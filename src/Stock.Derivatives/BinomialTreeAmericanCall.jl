#####################################################
#### BinomialTree American Call
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type BinomialTreeAmericanCall
	S0::Number
	r::Number
	q::Number
	sigma::Number
	T::Number
	K::Number
	steps::Number
end

### MTM
function mtm(c::BinomialTreeAmericanCall)
end


