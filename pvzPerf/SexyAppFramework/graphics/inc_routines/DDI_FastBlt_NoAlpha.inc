{	
	if (mLockedSurfaceDesc.ddpfPixelFormat.dwRGBBitCount == 16)
	{
		ushort* aDestPixelsRow = ((ushort*) mLockedSurfaceDesc.lpSurface) + (theY * mLockedSurfaceDesc.lPitch/2) + theX;		

		if (aMemoryImage->mHasTrans)
		{
			for (int y = 0; y < theSrcRect.mHeight; y++)
			{
				ushort* aDestPixels = aDestPixelsRow;								
				
				aSrcPixels = aSrcPixelsRow;

				for (int x = 0; x < theSrcRect.mWidth; x++)
				{
					unsigned int aSrc = NEXT_SRC_COLOR;

					if (aSrc>>24 != 0)
						*(aDestPixels++) = (ushort) aSrc;
					else
						aDestPixels++;
				}

				aDestPixelsRow += mLockedSurfaceDesc.lPitch/2;
				aSrcPixelsRow += theImage->mWidth;				
			}
		}
		else
		{
			for (int y = 0; y < theSrcRect.mHeight; y++)
			{
				ushort* aDestPixels = aDestPixelsRow;
				
				aSrcPixels = aSrcPixelsRow;

				for (int x = 0; x < theSrcRect.mWidth; x++)
				{
					*(aDestPixels++) = (ushort) NEXT_SRC_COLOR;							
				}

				aDestPixelsRow += mLockedSurfaceDesc.lPitch/2;
				aSrcPixelsRow += theImage->mWidth;
			}
		}
	}
	else if (mLockedSurfaceDesc.ddpfPixelFormat.dwRGBBitCount == 32)
	{
		unsigned int* aDestPixelsRow = ((unsigned int*) mLockedSurfaceDesc.lpSurface) + (theY * mLockedSurfaceDesc.lPitch/4) + theX;

		if (aMemoryImage->mHasTrans)
		{
			for (int y = 0; y < theSrcRect.mHeight; y++)
			{
				unsigned int* aDestPixels = aDestPixelsRow;
				
				aSrcPixels = aSrcPixelsRow;

				for (int x = 0; x < theSrcRect.mWidth; x++)
				{
					unsigned int aSrc = NEXT_SRC_COLOR;

					if (aSrc>>24 != 0)
						*(aDestPixels++) = aSrc;
					else
						aDestPixels++;
				}

				aDestPixelsRow += mLockedSurfaceDesc.lPitch/4;
				aSrcPixelsRow += theImage->mWidth;
			}
		}
		else
		{
			for (int y = 0; y < theSrcRect.mHeight; y++)
			{
				unsigned int* aDestPixels = aDestPixelsRow;
				
				aSrcPixels = aSrcPixelsRow;

				for (int x = 0; x < theSrcRect.mWidth; x++)
				{
					*(aDestPixels++) = NEXT_SRC_COLOR;
				}

				aDestPixelsRow += mLockedSurfaceDesc.lPitch/4;
				aSrcPixelsRow += theImage->mWidth;
			}
		}
	}

	UnlockSurface();
}