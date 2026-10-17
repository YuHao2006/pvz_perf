#pragma once
#include "DescParser.h"
#include <memory>

namespace Sexy {
// A raw-pointer container takes ownership only after insertion succeeds.
inline void AppendOwnedDataElement(ElementVector& elements, std::unique_ptr<DataElement> value)
{
    elements.push_back(value.get());
    value.release();
}
inline void InsertOwnedDefine(DataElementMap& definitions, const std::string& name,
                              std::unique_ptr<DataElement> value)
{
    if (definitions.emplace(name, value.get()).second)
        value.release();
}
}
