import Base.convert
using Dates

convert(::Type{Int}, v::SubString{String}) = parse(Int, v)
convert(::Type{Float64}, v::SubString{String}) = parse(Float64, v)
convert(::Type{Dates.Date}, v::String) = Date(v)

