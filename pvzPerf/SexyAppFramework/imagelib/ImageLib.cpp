#define XMD_H

#include "ImageLib.h"
#include <spng.h>
#include <algorithm>
#include <array>
#include <bit>
#include <cstdint>
#include <cstdio>
#include <setjmp.h>
#include <math.h>
#include <limits>
#include <memory>
#include <new>
#include <utility>
#include "paklib/PakInterface.h"
#include "Common.h"

extern "C"
{
#include <jpeglib.h>
#include <jerror.h>
}

using namespace ImageLib;

Image::Image()
{
	mWidth = 0;
	mHeight = 0;
	mBits = NULL;
}

Image::~Image()
{
	for (auto* layer : mAlphaLayers)
		delete layer;
	delete[] mBits;
}


//////////////////////////////////////////////////////////////////////////
// PNG support
//
// libspng deliberately exposes an explicit output format instead of libpng's
// mutable transform pipeline.  The game stores pixels as 0xAARRGGBB values;
// SPNG_FMT_RGBA8 is byte-oriented RGBA, so conversion is explicit here.  This
// avoids relying on host byte order or the old png_set_bgr() transform.

static int spng_pak_read(spng_ctx* /*theContext*/, void* theUser,
	void* theDestination, size_t theLength)
{
	PFILE* aFile = static_cast<PFILE*>(theUser);
	unsigned char* aDestination = static_cast<unsigned char*>(theDestination);
	while (theLength != 0)
	{
		const size_t aChunk = std::min(theLength,
			static_cast<size_t>(std::numeric_limits<int>::max()));
		if (p_fread(aDestination, 1, static_cast<int>(aChunk), aFile) != aChunk)
			return SPNG_IO_EOF;
		aDestination += aChunk;
		theLength -= aChunk;
	}
	return 0;
}

static bool image_dimensions_valid(uint32_t theWidth, uint32_t theHeight,
	size_t* thePixelCount)
{
	if (theWidth == 0 || theHeight == 0 ||
		theWidth > static_cast<uint32_t>(std::numeric_limits<int>::max()) ||
		theHeight > static_cast<uint32_t>(std::numeric_limits<int>::max()))
		return false;
	const size_t aWidth = static_cast<size_t>(theWidth);
	const size_t aHeight = static_cast<size_t>(theHeight);
	if (aHeight > std::numeric_limits<size_t>::max() / aWidth)
		return false;
	*thePixelCount = aWidth * aHeight;
	return *thePixelCount<std::numeric_limits<size_t>::max()/sizeof(unsigned int);
}

static uint16_t gif_little_endian_u16(uint16_t theValue)
{
	if constexpr (std::endian::native == std::endian::big)
		return std::byteswap(theValue);
	return theValue;
}

static Image* GetPNGImage(const std::string& theFileName)
{
	static_assert(sizeof(unsigned int) == 4);
	PFILE* aFile = p_fopen(theFileName.c_str(), "rb");
	if (aFile == nullptr)
		return nullptr;

	spng_ctx* aContext = spng_ctx_new(0);
	if (aContext == nullptr)
	{
		p_fclose(aFile);
		return nullptr;
	}

	struct spng_ihdr aHeader{};
	size_t aPixelCount = 0;
	size_t aDecodedSize = 0;
	std::unique_ptr<unsigned int[]> aBits;
	Image* anImage = nullptr;
	const bool aStreamSet = spng_set_png_stream(aContext, spng_pak_read, aFile) == 0;
	const bool aHeaderRead = aStreamSet &&
		spng_get_ihdr(aContext, &aHeader) == 0 &&
		image_dimensions_valid(aHeader.width, aHeader.height, &aPixelCount);
	const bool aPixelBytesValid =
		aPixelCount <= std::numeric_limits<size_t>::max() / 4;
	const bool aSizeRead = aHeaderRead && aPixelBytesValid &&
		spng_decoded_image_size(aContext, SPNG_FMT_RGBA8, &aDecodedSize) == 0 &&
		aDecodedSize == aPixelCount * 4;
	if (aSizeRead)
	{
		aBits.reset(new (std::nothrow) unsigned int[aPixelCount+1]);
	}
	const bool aDecoded = aBits != nullptr &&
		spng_decode_image(aContext, aBits.get(), aDecodedSize,
			SPNG_FMT_RGBA8, SPNG_DECODE_TRNS) == 0;
	if (aDecoded)
	{
		for (size_t i = 0; i < aPixelCount; ++i)
		{
			const unsigned char* aPixel = reinterpret_cast<const unsigned char*>(aBits.get()) + i * 4;
			aBits[i] = (static_cast<unsigned int>(aPixel[3]) << 24) |
				(static_cast<unsigned int>(aPixel[0]) << 16) |
				(static_cast<unsigned int>(aPixel[1]) << 8) |
				static_cast<unsigned int>(aPixel[2]);
		}
		anImage = new (std::nothrow) Image();
		if (anImage != nullptr)
		{
			anImage->mWidth = static_cast<int>(aHeader.width);
			anImage->mHeight = static_cast<int>(aHeader.height);
			anImage->mBits = aBits.release();
			anImage->mPixelCapacity=aPixelCount+1;
		}
	}

	spng_ctx_free(aContext);
	p_fclose(aFile);
	return anImage;
}

static Image* GetTGAImage(const std::string& theFileName)
{
	static_assert(sizeof(unsigned int) == 4);
	using PFilePtr = std::unique_ptr<PFILE, decltype(&p_fclose)>;
	PFilePtr aFile(p_fopen(theFileName.c_str(), "rb"), &p_fclose);
	if (!aFile)
		return nullptr;

	// Keep the existing uncompressed BGRA32, top-left image subset.
	// The optional Image ID follows the 18-byte header, before the pixels.
	unsigned char aHeader[18]{};
	if (p_fread(aHeader, 1, sizeof(aHeader), aFile.get()) != sizeof(aHeader) ||
		aHeader[1] != 0 || aHeader[2] != 2 ||
		aHeader[16] != 32 || aHeader[17] != (8 | (1 << 5)))
		return nullptr;

	const int aWidth = aHeader[12] | (aHeader[13] << 8);
	const int aHeight = aHeader[14] | (aHeader[15] << 8);
	if (aWidth == 0 || aHeight == 0)
		return nullptr;

	const uint64_t aPixelCount = static_cast<uint64_t>(aWidth) * aHeight;
	const int aDataOffset = sizeof(aHeader) + aHeader[0];
	// PFILE offsets and resource lengths are signed int. Check the actual
	// payload before allocating, and still check for a later short read.
	if (p_fseek(aFile.get(), 0, SEEK_END) != 0)
		return nullptr;
	const int aFileLength = p_ftell(aFile.get());
	if (aFileLength < aDataOffset ||
		aPixelCount * 4 > static_cast<uint64_t>(aFileLength - aDataOffset) ||
		p_fseek(aFile.get(), aDataOffset, SEEK_SET) != 0)
		return nullptr;

	auto anImage = std::make_unique<Image>();
	anImage->mWidth = aWidth;
	anImage->mHeight = aHeight;
	anImage->mBits = new unsigned int[static_cast<size_t>(aPixelCount)+1];
	anImage->mPixelCapacity=static_cast<size_t>(aPixelCount)+1;
	if (p_fread(anImage->mBits, 4, static_cast<int>(aPixelCount), aFile.get()) != aPixelCount)
		return nullptr;
	return anImage.release();
}

static int ReadBlobBlock(PFILE* fp, char* data)
{
	unsigned char aCount = 0;
	if (p_fread(&aCount, sizeof(char), 1, fp) != 1)
		return -1;
	if (aCount != 0 &&
		p_fread(data, sizeof(char), aCount, fp) != aCount)
		return -1;
	return aCount;
}

static Image* GetGIFImage(const std::string& theFileName)
{
	#define BitSet(byte,bit)  (((byte) & (bit)) == (bit))
	#define LSBFirstOrder(x,y)  (((y) << 8) | (x))

	int
		opacity,
		status;

	int i;

	unsigned char *p;

	unsigned char
		background,			// 背景色在全局颜色列表中的索引（背景色：图像中没有被指定颜色的像素会被背景色填充）
		c,
		flag,				// 图像标志的压缩字节
		header[1664]{},
		magick[12]{};
	std::unique_ptr<unsigned char[]> global_colormap;

	unsigned int
		delay,
		dispose,
		global_colors,		// 全局颜色列表大小
		image_count,
		iterations;

	/*
	Open image file.
	*/

	using PFilePtr = std::unique_ptr<PFILE, decltype(&p_fclose)>;
	PFilePtr fp(p_fopen(theFileName.c_str(), "rb"), &p_fclose);

	if (fp == nullptr)
		return NULL;
	/*
	Determine if this is a GIF file.
	*/
	status = p_fread(magick, sizeof(char), 6, fp.get());  // 读取文件头（包含文件签名与版本号，共 6 字节）
	if (status != 6)
		return nullptr;

	// 文件头的 ASCII 值为“GIF87a”或”GIF89a”，其中前三位为 GIF 签名，后三位为不同年份的版本号
	if (((strncmp((char*)magick, "GIF87", 5) != 0) && (strncmp((char*)magick, "GIF89", 5) != 0)))
		return NULL;

	global_colors = 0;
	uint16_t pw;  // 图像宽度
	uint16_t ph;  // 图像高度

	// 读取逻辑屏幕描述符，共 7 字节
	if (p_fread(&pw, sizeof(pw), 1, fp.get()) != 1 ||
		p_fread(&ph, sizeof(ph), 1, fp.get()) != 1 ||
		p_fread(&flag, sizeof(char), 1, fp.get()) != 1 ||
		p_fread(&background, sizeof(char), 1, fp.get()) != 1 ||
		p_fread(&c, sizeof(char), 1, fp.get()) != 1)
		return nullptr;
	pw = gif_little_endian_u16(pw);
	ph = gif_little_endian_u16(ph);

	if (BitSet(flag, 0x80))  // 如果存在全局颜色列表
	{
		/*
		opacity global colormap.
		*/
		global_colors = 1 << ((flag & 0x07) + 1);  // 压缩字节的最低 3 位表示全局颜色列表的大小，设其二进制数值为 N，则列表大小 = 2 ^ (N + 1)
		global_colormap.reset(new (std::nothrow) unsigned char[3 * global_colors]);  // 每个颜色占 3 个字节，按 RGB 排列
		if (global_colormap == nullptr)
			return NULL;

		if (p_fread(global_colormap.get(), sizeof(char), 3 * global_colors,
			fp.get()) != static_cast<size_t>(3 * global_colors))
			return nullptr;
	}

	delay = 0;
	dispose = 0;
	iterations = 1;
	opacity = (-1);
	image_count = 0;

	for (; ; )
	{
		if (p_fread(&c, sizeof(char), 1, fp.get()) == 0)
			break;  // 如果读取错误或读取到文件尾则退出，返回空指针

		if (c == ';')  // 当读取到 gif 结束块标记符（End Of File）
			break;  /* terminator */
		if (c == '!')  // 当读取到 gif 拓展块标记符
		{
			/*
			GIF Extension block.
			*/
			if (p_fread(&c, sizeof(char), 1, fp.get()) != 1)  // 读取拓展块的功能编码号
				return nullptr;

			switch (c)
			{
			case 0xf9:
			{
				/*
				Read Graphics Control extension.
				*/
				while (ReadBlobBlock(fp.get(), (char*)header) > 0);

				dispose = header[0] >> 2;
				delay = (header[2] << 8) | header[1];
				(void)delay; // Unused
				if ((header[0] & 0x01) == 1)
					opacity = header[3];
				break;
			}
			case 0xfe:
			{
				/*
				Comments are metadata only.  Discard every sub-block instead of
				concatenating into a first-block-sized buffer.
				*/
				while (ReadBlobBlock(fp.get(), (char*)header) > 0);
				break;
			}
			case 0xff:
			{
				int
					loop;

				/*
				Read Netscape Loop extension.
				*/
				loop = false;
				if (ReadBlobBlock(fp.get(), (char*)header) > 0)
					loop = !strncmp((char*)header, "NETSCAPE2.0", 11);
				while (ReadBlobBlock(fp.get(), (char*)header) > 0)
					if (loop)
						iterations = (header[2] << 8) | header[1];
				break;
			}
			default:
			{
				while (ReadBlobBlock(fp.get(), (char*)header) > 0);
				break;
			}
			}
		}

		if (c != ',')  // 如果读取的不为图像描述符
			continue;

		if (image_count != 0)
		{
			/*
			Allocate next image structure.
			*/

			/*AllocateNextImage(image_info,image);
			if (image->next == (Image *) NULL)
			{
			DestroyImages(image);
			return((Image *) NULL);
			}
			image=image->next;
			MagickMonitor(LoadImagesText,TellBlob(image),image->filesize);*/
		}
		image_count++;

		uint16_t pagex;
		uint16_t pagey;
		uint16_t width;
		uint16_t height;
		int colors;
		bool interlaced;

		if (p_fread(&pagex, sizeof(pagex), 1, fp.get()) != 1 ||
			p_fread(&pagey, sizeof(pagey), 1, fp.get()) != 1 ||
			p_fread(&width, sizeof(width), 1, fp.get()) != 1 ||
			p_fread(&height, sizeof(height), 1, fp.get()) != 1 ||
			p_fread(&flag, sizeof(char), 1, fp.get()) != 1)
			return nullptr;
		pagex = gif_little_endian_u16(pagex);
		pagey = gif_little_endian_u16(pagey);
		width = gif_little_endian_u16(width);
		height = gif_little_endian_u16(height);

		colors = !BitSet(flag, 0x80) ? global_colors : 1 << ((flag & 0x07) + 1);  // 判断使用全局颜色列表或使用局部颜色列表，并取得列表大小
		if (colors <= 0 || colors > 256)
			return nullptr;
		auto colortable = std::make_unique<unsigned int[]>(colors);  // 申请颜色列表

		interlaced = BitSet(flag, 0x40);  // 当前帧图像数据存储方式，为 1 表示交织顺序存储，0 表示顺序存储

		delay = 0;
		dispose = 0;
		(void)dispose; // unused
		iterations = 1;
		(void)iterations; //unused
		/*if (image_info->ping)
		{
		f (opacity >= 0)
		/image->matte=true;

		CloseBlob(image);
		return(image);
		}*/
		if ((width == 0) || (height == 0))
			return NULL;
		/*
		Inititialize colormap.
		*/
		/*if (!AllocateImageColormap(image,image->colors))
		ThrowReaderException(ResourceLimitWarning,"Memory allocation failed",
		image);*/
		if (!BitSet(flag, 0x80))  // 如果使用全局颜色列表
		{
			/*
			Use global colormap.
			*/
			if (global_colormap == nullptr)
				return nullptr;
			p = global_colormap.get();
			for (i = 0; i < (int)colors; i++)
			{
				int r = *p++;
				int g = *p++;
				int b = *p++;

				colortable[i] = 0xFF000000 | (r << 16) | (g << 8) | (b);
			}

			//image->background_color=
			//image->colormap[Min(background,image->colors-1)];
		}
		else
		{
			/*
			Read local colormap.
			*/
			auto colormap = std::make_unique<unsigned char[]>(3 * colors);

			int pos = p_ftell(fp.get());
			(void)pos; // unused

			if (p_fread(colormap.get(), sizeof(char), 3 * colors,
				fp.get()) != static_cast<size_t>(3 * colors))
				return nullptr;

			p = colormap.get();
			for (i = 0; i < (int)colors; i++)
			{
				int r = *p++;
				int g = *p++;
				int b = *p++;

				colortable[i] = 0xFF000000 | (r << 16) | (g << 8) | (b);
			}
		}

		/*if (opacity >= (int) colors)
		{
		for (i=colors; i < (opacity+1); i++)
		{
		image->colormap[i].red=0;
		image->colormap[i].green=0;
		image->colormap[i].blue=0;
		}
		image->colors=opacity+1;
		}*/
		/*
		Decode image.
		*/
		//status=DecodeImage(image,opacity,exception);

		//if (global_colormap != (unsigned char *) NULL)
		// LiberateMemory((void **) &global_colormap);
		global_colormap.reset();

		//while (image->previous != (Image *) NULL)
		//    image=image->previous;

#define MaxStackSize  4096
#define NullCode  (-1)

		int
			available,
			bits,
			code,
			clear,
			code_mask,
			code_size,
			count,
			end_of_information,
			in_code,
			offset,
			old_code,
			pass,
			y;

		int
			x;

		unsigned int
			datum;

		std::unique_ptr<short[]> prefix;

		unsigned char
			data_size,
			first,
			* top_stack;
		std::unique_ptr<unsigned char[]> packet;
		std::unique_ptr<unsigned char[]> pixel_stack;
		std::unique_ptr<unsigned char[]> suffix;

		/*
		Allocate decoder tables.
		*/

		packet = std::make_unique<unsigned char[]>(256);
		prefix = std::make_unique<short[]>(MaxStackSize);
		suffix = std::make_unique<unsigned char[]>(MaxStackSize);
		pixel_stack = std::make_unique<unsigned char[]>(MaxStackSize + 1);

		/*
		Initialize GIF data stream decoder.
		*/
		if (p_fread(&data_size, sizeof(char), 1, fp.get()) != 1)
			return nullptr;
		if (data_size < 2 || data_size > 11)
			return nullptr;
		clear = 1 << data_size;
		end_of_information = clear + 1;
		available = clear + 2;
		old_code = NullCode;
		code_size = data_size + 1;
		code_mask = (1 << code_size) - 1;
		for (code = 0; code < clear; code++)
		{
			prefix[code] = 0;
			suffix[code] = (unsigned char)code;
		}
		/*
		Decode GIF pixel stream.
		*/
		datum = 0;
		bits = 0;
		c = 0;
		count = 0;
		first = 0;
		offset = 0;
		pass = 0;
		top_stack = pixel_stack.get();

		std::unique_ptr<unsigned int[]> aBits(
			new (std::nothrow) unsigned int[size_t(width)*height+1]);
		if (aBits == nullptr)
			return nullptr;

		unsigned char* c = NULL;
		bool aDecodeFailed = false;
		auto PushPixel = [&](unsigned char thePixel)
		{
			if (top_stack >= pixel_stack.get() + MaxStackSize)
				return false;
			*top_stack++ = thePixel;
			return true;
		};

		for (y = 0; y < (int)height; y++)
		{
			//q=SetImagePixels(image,0,offset,width,1);
			//if (q == (PixelPacket *) NULL)
			//break;
			//indexes=GetIndexes(image);

			if (offset < 0 || offset >= height)
			{
				aDecodeFailed = true;
				break;
			}
			unsigned int* q = aBits.get() + offset * width;



			for (x = 0; x < (int)width; )
			{
				if (top_stack == pixel_stack.get())
				{
					if (bits < code_size)
					{
						/*
						Load bytes until there is enough bits for a code.
						*/
						if (count == 0)
						{
							/*
							Read a new data block.
							*/
							int pos = p_ftell(fp.get());
							(void)pos; // unused

							count = ReadBlobBlock(fp.get(), (char*)packet.get());
							if (count <= 0)
							{
								aDecodeFailed = true;
								break;
							}
							c = packet.get();
						}
						datum += (*c) << bits;
						bits += 8;
						c++;
						count--;
						continue;
					}
					/*
					Get the next code.
					*/
					code = datum & code_mask;
					datum >>= code_size;
					bits -= code_size;
					/*
					Interpret the code
					*/
					if ((code > available) || (code == end_of_information))
					{
						aDecodeFailed = true;
						break;
					}
					if (code == clear)
					{
						/*
						Reset decoder.
						*/
						code_size = data_size + 1;
						code_mask = (1 << code_size) - 1;
						available = clear + 2;
						old_code = NullCode;
						continue;
					}
					if (old_code == NullCode)
					{
						if (code >= clear || !PushPixel(suffix[code]))
						{
							aDecodeFailed = true;
							break;
						}
						old_code = code;
						first = (unsigned char)code;
						continue;
					}
					in_code = code;
					if (code >= available)
					{
						if (!PushPixel(first))
						{
							aDecodeFailed = true;
							break;
						}
						code = old_code;
					}
					while (code >= clear)
					{
						if (code < 0 || code >= available || code >= MaxStackSize ||
							!PushPixel(suffix[code]))
						{
							aDecodeFailed = true;
							break;
						}
						code = prefix[code];
					}
					if (aDecodeFailed || code < 0 || code >= clear)
					{
						aDecodeFailed = true;
						break;
					}
					first = suffix[code];
					/*
					Add a new string to the string table,
					*/
					if (available >= MaxStackSize || !PushPixel(first))
					{
						aDecodeFailed = true;
						break;
					}
					prefix[available] = old_code;
					suffix[available] = first;
					available++;
					if (((available & code_mask) == 0) && (available < MaxStackSize))
					{
						code_size++;
						code_mask += available;
					}
					old_code = in_code;
				}
				if (aDecodeFailed || top_stack == pixel_stack.get())
				{
					aDecodeFailed = true;
					break;
				}
				/*
				Pop a pixel off the pixel stack.
				*/
				top_stack--;

				int index = (*top_stack);
				if (index < 0 || index >= colors)
					return nullptr;

				*q = colortable[index];

				if (index == opacity)
					*q = 0;

				x++;
				q++;
			}
			if (aDecodeFailed || x < width)
			{
				aDecodeFailed = true;
				break;
			}

			if (!interlaced)
				offset++;
			else
			{
				switch (pass)
				{
				case 0:
				default:
				{
					offset += 8;
					if (offset >= height)
					{
						pass++;
						offset = 4;
					}
					break;
				}
				case 1:
				{
					offset += 8;
					if (offset >= height)
					{
						pass++;
						offset = 2;
					}
					break;
				}
				case 2:
				{
					offset += 4;
					if (offset >= height)
					{
						pass++;
						offset = 1;
					}
					break;
				}
				case 3:
				{
					offset += 2;
					break;
				}
				}
			}

			/*if (image->previous == (Image *) NULL)
			if (QuantumTick(y,image->rows))
			MagickMonitor(LoadImageText,y,image->rows);*/
		}
		if (aDecodeFailed)
			return nullptr;
		//if (y < image->rows)
		//failed = true;

		Image* anImage = new (std::nothrow) Image();
		if (anImage == nullptr)
			return nullptr;

		anImage->mWidth = width;
		anImage->mHeight = height;
		anImage->mBits = aBits.release();
		anImage->mPixelCapacity=size_t(width)*height+1;

		//TODO: Change for animation crap
		return anImage;
	}

	return NULL;
}

typedef struct my_error_mgr * my_error_ptr;

struct my_error_mgr
{
  struct jpeg_error_mgr pub;	/* "public" fields */

  jmp_buf setjmp_buffer;	/* for return to caller */
};

METHODDEF(void)
my_error_exit (j_common_ptr cinfo)
{
  /* cinfo->err really points to a my_error_mgr struct, so coerce pointer */
  my_error_ptr myerr = (my_error_ptr) cinfo->err;

  /* Always display the message. */
  /* We could postpone this until after returning, if we chose. */
  (*cinfo->err->output_message) (cinfo);

  /* Return control to the setjmp point */
  longjmp(myerr->setjmp_buffer, 1);

}

namespace ImageLib
{
// 命名污染审计：仅本 TU 使用，声明自对应头文件下沉（内部链接）。
static bool WriteJPEGImage(const std::string& theFileName, Image* theImage, int theQuality = 80);
static bool WriteTGAImage(const std::string& theFileName, Image* theImage);
static bool WriteBMPImage(const std::string& theFileName, Image* theImage);
}

bool ImageLib::WriteJPEGImage(const std::string& theFileName, Image* theImage, int theQuality)
{
	if (theImage == nullptr || theImage->mBits == nullptr ||
		theImage->mWidth <= 0 || theImage->mHeight <= 0 ||
		theImage->mWidth > JPEG_MAX_DIMENSION ||
		theImage->mHeight > JPEG_MAX_DIMENSION ||
		theImage->mWidth > std::numeric_limits<int>::max() / 3)
		return false;

	FILE *fp;

	if ((fp = fopen(theFileName.c_str(), "wb")) == NULL)
		return false;

	struct jpeg_compress_struct cinfo{};
	struct my_error_mgr jerr;
	unsigned char* volatile aTempBuffer = nullptr;
	// Construct the owner BEFORE setjmp. Its state never changes across a
	// longjmp, and the mutable output pointer is volatile. C++ exceptions from
	// jpegli also unwind through this owner instead of bypassing cleanup.
	const auto aCleanup = [&](jpeg_compress_struct*) {
		if (cinfo.mem != nullptr)
			jpeg_destroy_compress(&cinfo);
		delete[] const_cast<unsigned char*>(aTempBuffer);
		fclose(fp);
	};
	std::unique_ptr<jpeg_compress_struct, decltype(aCleanup)> aResources(&cinfo, aCleanup);

	cinfo.err = jpeg_std_error(&jerr.pub);
	jerr.pub.error_exit = my_error_exit;

	// The codec state lives in this OUTER function. Only this inner invocation
	// contains setjmp, so longjmp cannot make cinfo an indeterminate modified
	// automatic variable of the function containing the setjmp.
	return [&]() -> bool {
	if (setjmp(jerr.setjmp_buffer))
	{
		// JPEG reports malformed data through longjmp; the pre-existing owner
		// releases resources on this return, just as on a C++ exception.
		return false;
	}

	jpeg_create_compress(&cinfo);

	cinfo.image_width = theImage->mWidth;
	cinfo.image_height = theImage->mHeight;
	cinfo.input_components = 3;
    cinfo.in_color_space = JCS_RGB;
    jpeg_set_defaults(&cinfo);
	cinfo.optimize_coding = TRUE;
    jpeg_set_quality(&cinfo, std::clamp(theQuality, 0, 100), TRUE);

	jpeg_stdio_dest(&cinfo, fp);

	jpeg_start_compress(&cinfo, true);

	int row_stride = theImage->mWidth * 3;

	aTempBuffer = new (std::nothrow) unsigned char[row_stride];
	if (aTempBuffer == nullptr)
	{
		return false;
	}

	unsigned int* aSrcPtr = theImage->mBits;

	for (int aRow = 0; aRow < theImage->mHeight; aRow++)
	{
		unsigned char* aDest = const_cast<unsigned char*>(aTempBuffer);

		for (int aCol = 0; aCol < theImage->mWidth; aCol++)
		{
			unsigned int src = *(aSrcPtr++);

			*aDest++ = (src >> 16) & 0xFF;
			*aDest++ = (src >>  8) & 0xFF;
			*aDest++ = (src      ) & 0xFF;
		}

		unsigned char* aScanline = const_cast<unsigned char*>(aTempBuffer);
		jpeg_write_scanlines(&cinfo, &aScanline, 1);
	}

	delete[] const_cast<unsigned char*>(aTempBuffer);
	aTempBuffer = nullptr;

	jpeg_finish_compress(&cinfo);

	return true;
	}();
}

template<class Pixel>
static bool WritePngPixels(const std::string& theFileName, int width, int height, std::span<const Pixel> bits)
{
	if (bits.empty() || width <= 0 || height <= 0)
		return false;

	const size_t aWidth = static_cast<size_t>(width);
	const size_t aHeight = static_cast<size_t>(height);
	if (aHeight > std::numeric_limits<size_t>::max() / aWidth)
		return false;
	const size_t aPixelCount = aWidth * aHeight;
	if (bits.size() != aPixelCount)
		return false;
	if (aPixelCount > std::numeric_limits<size_t>::max() / 4)
		return false;
	const size_t aByteCount = aPixelCount * 4;
	std::unique_ptr<unsigned char[]> aRGBA(new (std::nothrow) unsigned char[aByteCount]);
	if (aRGBA == nullptr)
		return false;

	for (size_t i = 0; i < aPixelCount; ++i)
	{
		const unsigned int aPixel = bits[i];
		unsigned char* aOutput = aRGBA.get() + i * 4;
		aOutput[0] = static_cast<unsigned char>((aPixel >> 16) & 0xFF);
		aOutput[1] = static_cast<unsigned char>((aPixel >> 8) & 0xFF);
		aOutput[2] = static_cast<unsigned char>(aPixel & 0xFF);
		aOutput[3] = static_cast<unsigned char>((aPixel >> 24) & 0xFF);
	}

	FILE* aFile = fopen(theFileName.c_str(), "wb");
	if (aFile == nullptr)
		return false;
	spng_ctx* aContext = spng_ctx_new(SPNG_CTX_ENCODER);
	if (aContext == nullptr)
	{
		fclose(aFile);
		return false;
	}

	struct spng_ihdr aHeader{};
	aHeader.width = static_cast<uint32_t>(width);
	aHeader.height = static_cast<uint32_t>(height);
	aHeader.bit_depth = 8;
	aHeader.color_type = SPNG_COLOR_TYPE_TRUECOLOR_ALPHA;
	aHeader.compression_method = 0;
	aHeader.filter_method = 0;
	aHeader.interlace_method = SPNG_INTERLACE_NONE;

	const bool aConfigured =
		spng_set_png_file(aContext, aFile) == 0 &&
		spng_set_ihdr(aContext, &aHeader) == 0;
	const bool aWritten = aConfigured &&
		spng_encode_image(aContext, aRGBA.get(), aByteCount,
			// The encoder accepts PNG/RAW, not the decoder's RGBA8 selector.
			// IHDR already specifies straight-alpha RGBA, 8 bits per channel.
			SPNG_FMT_PNG, SPNG_ENCODE_FINALIZE) == 0;

	spng_ctx_free(aContext);
	const bool aClosed = fclose(aFile) == 0;
	return aWritten && aClosed;
}

bool ImageLib::WritePNGImage(const std::string& theFileName, Image* theImage)
{
    if (!theImage || !theImage->mBits || theImage->mWidth <= 0 || theImage->mHeight <= 0)
        return false;
    const uint64_t count = uint64_t(theImage->mWidth) * uint64_t(theImage->mHeight);
    if (count > (std::numeric_limits<size_t>::max)())
        return false;
    return WritePngPixels(theFileName, theImage->mWidth, theImage->mHeight,
        std::span<const unsigned int>(theImage->mBits, size_t(count)));
}

bool ImageLib::WritePNGImage(const std::string& theFileName, int width, int height,
    std::span<const uint32_t> pixels)
{
    return WritePngPixels(theFileName, width, height, pixels);
}

bool ImageLib::WriteTGAImage(const std::string& theFileName, Image* theImage)
{
	static_assert(sizeof(unsigned int) == 4);
	// Validate before opening: an invalid request must not truncate an
	// existing image. Both TGA dimensions and the PFILE reader must fit.
	if (theImage == nullptr || theImage->mBits == nullptr ||
		theImage->mWidth <= 0 || theImage->mHeight <= 0 ||
		theImage->mWidth > 65535 || theImage->mHeight > 65535)
		return false;
	const uint64_t aPixelCount =
		static_cast<uint64_t>(theImage->mWidth) * theImage->mHeight;
	if (aPixelCount > (std::numeric_limits<int>::max() - 18u) / 4u)
		return false;

	unsigned char aHeader[18]{};
	aHeader[2] = 2;
	aHeader[12] = static_cast<unsigned char>(theImage->mWidth);
	aHeader[13] = static_cast<unsigned char>(theImage->mWidth >> 8);
	aHeader[14] = static_cast<unsigned char>(theImage->mHeight);
	aHeader[15] = static_cast<unsigned char>(theImage->mHeight >> 8);
	aHeader[16] = 32;
	aHeader[17] = 8 | (1 << 5);

	using FilePtr = std::unique_ptr<FILE, decltype(&fclose)>;
	FilePtr aFile(fopen(theFileName.c_str(), "wb"), &fclose);
	if (!aFile ||
		fwrite(aHeader, 1, sizeof(aHeader), aFile.get()) != sizeof(aHeader) ||
		fwrite(theImage->mBits, 4, static_cast<size_t>(aPixelCount), aFile.get()) != aPixelCount)
		return false;

	// fclose also reports failures flushing buffered output.
	return fclose(aFile.release()) == 0;
}

bool ImageLib::WriteBMPImage(const std::string& theFileName, Image* theImage)
{
	static_assert(sizeof(unsigned int) == 4);
	static_assert(std::endian::native == std::endian::little);
	using FilePtr = std::unique_ptr<FILE, decltype(&fclose)>;
	FilePtr aFile(fopen(theFileName.c_str(), "wb"), &fclose);
	if (!aFile) return false;

	std::array<unsigned char, 54> header{};
	const auto word = [&](size_t offset, unsigned int value) {
		for (unsigned int byte = 0; byte < 4; ++byte)
			header[offset + byte] = static_cast<unsigned char>(value >> (byte * 8));
	};
	header[0] = 'B'; header[1] = 'M';
	word(2, static_cast<unsigned int>(header.size()) +
		static_cast<unsigned int>(theImage->mWidth) * theImage->mHeight * 4);
	word(10, static_cast<unsigned int>(header.size()));
	word(14, 40);
	word(18, static_cast<unsigned int>(theImage->mWidth));
	word(22, static_cast<unsigned int>(theImage->mHeight));
	header[26] = 1;
	header[28] = 32;
	if (fwrite(header.data(), 1, header.size(), aFile.get()) != header.size())
		return false;
	for (int row = theImage->mHeight - 1; row >= 0; --row)
		if (fwrite(theImage->mBits + size_t(row) * theImage->mWidth, 4,
			theImage->mWidth, aFile.get()) != size_t(theImage->mWidth))
			return false;
	return fclose(aFile.release()) == 0;
}

////////////////////////////////////////////////////////////////////////// 
// JPEG Pak Reader

typedef struct {
	struct jpeg_source_mgr pub;	/* public fields */

	PFILE * infile;		/* source stream */
	JOCTET * buffer;		/* start of buffer */
	boolean start_of_file;	/* have we gotten any data yet? */
} pak_source_mgr;

typedef pak_source_mgr * pak_src_ptr;

#define INPUT_BUF_SIZE 4096

METHODDEF(void) init_source (j_decompress_ptr cinfo)
{
	pak_src_ptr src = (pak_src_ptr) cinfo->src;
	src->start_of_file = TRUE;
}

METHODDEF(boolean) fill_input_buffer (j_decompress_ptr cinfo)
{
	pak_src_ptr src = (pak_src_ptr) cinfo->src;
	size_t nbytes;

	nbytes = p_fread(src->buffer, 1, INPUT_BUF_SIZE, src->infile);
	//((size_t) fread((void *) (buf), (size_t) 1, (size_t) (sizeofbuf), (file)))

	if (nbytes <= 0) {
		if (src->start_of_file)	/* Treat empty input file as fatal error */
			ERREXIT(cinfo, JERR_INPUT_EMPTY);
		WARNMS(cinfo, JWRN_JPEG_EOF);
		/* Insert a fake EOI marker */
		src->buffer[0] = (JOCTET) 0xFF;
		src->buffer[1] = (JOCTET) JPEG_EOI;
		nbytes = 2;
	}

	src->pub.next_input_byte = src->buffer;
	src->pub.bytes_in_buffer = nbytes;
	src->start_of_file = FALSE;

	return TRUE;
}

METHODDEF(void) skip_input_data (j_decompress_ptr cinfo, long num_bytes)
{
	pak_src_ptr src = (pak_src_ptr) cinfo->src;

	if (num_bytes > 0) {
		while (num_bytes > (long) src->pub.bytes_in_buffer) {
			num_bytes -= (long) src->pub.bytes_in_buffer;
			(void) fill_input_buffer(cinfo);
		}
		src->pub.next_input_byte += (size_t) num_bytes;
		src->pub.bytes_in_buffer -= (size_t) num_bytes;
	}
}

METHODDEF(void) term_source (j_decompress_ptr /* cinfo */)
{
	/* no work necessary here */
}

static void jpeg_pak_src (j_decompress_ptr cinfo, PFILE* infile)
{
	pak_src_ptr src;

	/* The source object and input buffer are made permanent so that a series
	* of JPEG images can be read from the same file by calling jpeg_stdio_src
	* only before the first one.  (If we discarded the buffer at the end of
	* one image, we'd likely lose the start of the next one.)
	* This makes it unsafe to use this manager and a different source
	* manager serially with the same JPEG object.  Caveat programmer.
	*/
	if (cinfo->src == NULL) {	/* first time for this JPEG object? */
		cinfo->src = (struct jpeg_source_mgr *)
			(*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
			sizeof(pak_source_mgr));
		src = (pak_src_ptr) cinfo->src;
		src->buffer = (JOCTET *)
			(*cinfo->mem->alloc_small) ((j_common_ptr) cinfo, JPOOL_PERMANENT,
			INPUT_BUF_SIZE * sizeof(JOCTET));
	}

	src = (pak_src_ptr) cinfo->src;
	src->pub.init_source = init_source;
	src->pub.fill_input_buffer = fill_input_buffer;
	src->pub.skip_input_data = skip_input_data;
	src->pub.resync_to_restart = jpeg_resync_to_restart; /* use default method */
	src->pub.term_source = term_source;
	src->infile = infile;
	src->pub.bytes_in_buffer = 0; /* forces fill_input_buffer on first read */
	src->pub.next_input_byte = NULL; /* until buffer loaded */
}


static Image* GetJPEGImage(const std::string& theFileName)
{
	PFILE *fp;

	if ((fp = p_fopen(theFileName.c_str(), "rb")) == NULL)
		return NULL;

	struct jpeg_decompress_struct cinfo{};
	struct my_error_mgr jerr;
	unsigned int* volatile aBits = nullptr;
	Image* volatile anImage = nullptr;
	// Keep the guard outside the setjmp region: a longjmp must not bypass a
	// newly constructed non-trivial local. jpegli's C++ exceptions use the
	// same cleanup, and are not converted into successful/empty decoding.
	const auto aCleanup = [&](jpeg_decompress_struct*) {
		if (cinfo.mem != nullptr)
			jpeg_destroy_decompress(&cinfo);
		delete[] const_cast<unsigned int*>(aBits);
		delete const_cast<Image*>(anImage);
		p_fclose(fp);
	};
	std::unique_ptr<jpeg_decompress_struct, decltype(aCleanup)> aResources(&cinfo, aCleanup);

	cinfo.err = jpeg_std_error(&jerr.pub);
	jerr.pub.error_exit = my_error_exit;

	// Keep the mutable codec/output state in the caller of the setjmp region;
	// no non-trivial owner is constructed between setjmp and a codec call.
	return [&]() -> Image* {
	if (setjmp(jerr.setjmp_buffer))
	{
		return nullptr;
	}

	jpeg_create_decompress(&cinfo);
	jpeg_pak_src(&cinfo, fp);
	jpeg_read_header(&cinfo, TRUE);
	if (cinfo.jpeg_color_space == JCS_GRAYSCALE)
		cinfo.out_color_space = JCS_GRAYSCALE;
	else
		cinfo.out_color_space = JCS_RGB;
	jpeg_start_decompress(&cinfo);
	if (cinfo.output_width == 0 || cinfo.output_height == 0 ||
		cinfo.output_width > static_cast<JDIMENSION>(std::numeric_limits<int>::max()) ||
		cinfo.output_height > static_cast<JDIMENSION>(std::numeric_limits<int>::max()) ||
		(cinfo.output_components != 1 && cinfo.output_components != 3))
	{
		return nullptr;
	}
	const size_t aWidth = static_cast<size_t>(cinfo.output_width);
	const size_t aHeight = static_cast<size_t>(cinfo.output_height);
	if (aHeight > (std::numeric_limits<size_t>::max()/sizeof(unsigned int)-1) / aWidth ||
		aWidth > std::numeric_limits<JDIMENSION>::max() /
			static_cast<size_t>(cinfo.output_components))
	{
		return nullptr;
	}
	const JDIMENSION row_stride = static_cast<JDIMENSION>(
		aWidth * static_cast<size_t>(cinfo.output_components));

	unsigned char** buffer = (*cinfo.mem->alloc_sarray)
		((j_common_ptr) &cinfo, JPOOL_IMAGE, row_stride, 1);

	aBits = new (std::nothrow) unsigned int[aWidth*aHeight+1];
	if (aBits == nullptr)
	{
		return nullptr;
	}
	unsigned int* q = const_cast<unsigned int*>(aBits);

	if (cinfo.output_components==1)
	{
		while (cinfo.output_scanline < cinfo.output_height)
		{
			jpeg_read_scanlines(&cinfo, buffer, 1);

			unsigned char* p = *buffer;
			for (unsigned int i = 0; i < cinfo.output_width; i++)
			{
				int r = *p++;
				*q++ = 0xFF000000 | (r << 16) | (r << 8) | (r);
			}
		}
	}
	else
	{
		while (cinfo.output_scanline < cinfo.output_height)
		{
			jpeg_read_scanlines(&cinfo, buffer, 1);

			unsigned char* p = *buffer;
			for (unsigned int i = 0; i < cinfo.output_width; i++)
			{
				int r = *p++;
				int g = *p++;
				int b = *p++;

				*q++ = 0xFF000000 | (r << 16) | (g << 8) | (b);
			}
		}
	}

	anImage = new (std::nothrow) Image();
	if (anImage == nullptr)
	{
		return nullptr;
	}
	anImage->mWidth = cinfo.output_width;
	anImage->mHeight = cinfo.output_height;
	anImage->mBits = const_cast<unsigned int*>(aBits);
	anImage->mPixelCapacity=aWidth*aHeight+1;
	aBits = nullptr;

	jpeg_finish_decompress(&cinfo);

	Image* aResult = const_cast<Image*>(anImage);
	anImage = nullptr;
	return aResult;
	}();
}

thread_local int ImageLib::gAlphaComposeColor = 0xFFFFFF;
namespace ImageLib
{
// 命名污染审计：仅本 TU 使用，声明自对应头文件下沉（内部链接）。
static bool gAutoLoadAlpha = true;
static bool gIgnoreJPEG2000Alpha = true;
}

Image* ImageLib::GetImage(const std::string& theFilename, bool lookForAlphaImage)
{
	if (!gAutoLoadAlpha)
		lookForAlphaImage = false;

	int aLastDotPos = theFilename.rfind('.');
	int aLastSlashPos = std::max((int)theFilename.rfind('\\'), (int)theFilename.rfind('/'));

	std::string anExt;
	std::string aFilename;

	if (aLastDotPos > aLastSlashPos)
	{
		anExt = theFilename.substr(aLastDotPos, theFilename.length() - aLastDotPos);
		aFilename = theFilename.substr(0, aLastDotPos);
	}
	else
		aFilename = theFilename;

	Image* anImage = nullptr;
	Image* anAlphaImage = nullptr;
	try
	{

	if ((anImage == NULL) && ((stricmp(anExt.c_str(), ".tga") == 0) || (anExt.length() == 0)))
		anImage = GetTGAImage(aFilename + ".tga");

	if ((anImage == NULL) && ((stricmp(anExt.c_str(), ".jpg") == 0) || (anExt.length() == 0)))
		anImage = GetJPEGImage(aFilename + ".jpg");

	if ((anImage == NULL) && ((stricmp(anExt.c_str(), ".png") == 0) || (anExt.length() == 0)))
		anImage = GetPNGImage(aFilename + ".png");

	if ((anImage == NULL) && ((stricmp(anExt.c_str(), ".gif") == 0) || (anExt.length() == 0)))
		anImage = GetGIFImage(aFilename + ".gif");

	if ((anImage == NULL) && (stricmp(anExt.c_str(), ".j2k") == 0))
		return nullptr; // There are no JPEG2000 files in the project
		//anImage = GetJPEG2000Image(aFilename + ".j2k");
	if ((anImage == NULL) && (stricmp(anExt.c_str(), ".jp2") == 0))
		return nullptr; // There are no JPEG2000 files in the project
		//anImage = GetJPEG2000Image(aFilename + ".jp2");


	// Check for alpha images
	if(lookForAlphaImage)
	{
		// Check _ImageName
		anAlphaImage = GetImage(theFilename.substr(0, aLastSlashPos+1) + "_" +
			theFilename.substr(aLastSlashPos+1, theFilename.length() - aLastSlashPos - 1), false);

		// Check ImageName_
		if(anAlphaImage==NULL)
			anAlphaImage = GetImage(aFilename + "_" + anExt, false);
	}



	// 2026-10-11 性能修复（用户指令"继续查性能倒退"）：恢复 1073 解码期 CPU
	// 合成（HEAD 语义，oracle 循环逐字还原）。批量化前的 GPU 逐图 compose 让
	// 每张合成图付 3 次 GPU 分配+2 次上传+1 次 dispatch（CreateTextures 残差
	// 1.9×）；CPU 合成只在装载线程付一次逐像素循环，产出普通位图后走单一
	// 上传。GPU 合成内核保留给工厂测试夹具（AppendAlphaImage/pending 路径）。
	if (anAlphaImage != NULL)
	{
		if (anImage != NULL)
		{
			if (anImage->mWidth!=anAlphaImage->mWidth || anImage->mHeight!=anAlphaImage->mHeight)
				throw ImageAlphaSizeMismatch{};
			unsigned int* aBits1 = anImage->mBits;
			unsigned int* aBits2 = anAlphaImage->mBits;
			const int aSize = anImage->mWidth*anImage->mHeight;
			for (int i = 0; i < aSize; i++)
			{
				*aBits1 = (*aBits1 & 0x00FFFFFF) | ((*aBits2 & 0xFF) << 24);
				++aBits1;
				++aBits2;
			}
		}
		else if (gAlphaComposeColor==0xFFFFFF)
		{
			anImage = anAlphaImage;
			anAlphaImage = nullptr;
			unsigned int* aBits1 = anImage->mBits;
			const int aSize = anImage->mWidth*anImage->mHeight;
			for (int i = 0; i < aSize; i++)
			{
				*aBits1 = (0x00FFFFFF) | ((*aBits1 & 0xFF) << 24);
				++aBits1;
			}
		}
		else
		{
			const int aColor = gAlphaComposeColor;
			anImage = anAlphaImage;
			anAlphaImage = nullptr;
			unsigned int* aBits1 = anImage->mBits;
			const int aSize = anImage->mWidth*anImage->mHeight;
			for (int i = 0; i < aSize; i++)
			{
				*aBits1 = aColor | ((*aBits1 & 0xFF) << 24);
				++aBits1;
			}
		}
	}

	delete anAlphaImage;
	return anImage;
	}
	catch (...)
	{
		delete anAlphaImage;
		delete anImage;
		throw;
	}
}
