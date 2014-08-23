
# Plain Vanilla European Options
abstract PlainVanillaEuropeanOption

# European Call with Fixed Strike
type EuropeanCallFixedStrike <: PlainVanillaEuropeanOption
	S0::Float64
	r::Float64
	q::Float64
	sigma::Float64
	T::Float64
	K::Float64
end

# European Put with Fixed Strike
type EuropeanPutFixedStrike <: PlainVanillaEuropeanOption
	S0::Float64
	r::Float64
	q::Float64
	sigma::Float64
	T::Float64
	K::Float64
end

# Plain Vanilla American Options
abstract PlainVanillaAmericanOption

