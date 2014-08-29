#####################################################
#### BlackScholes European Call
#####################################################

### Dependencies
using Distributions
require("basic_types.jl")

### Type
type BlackScholesEuropeanPut
	S0::Number
	r::Number
	q::Number
	sigma::Number
	T::Number
	K::Number
end

### MTM
function mtm(c::BlackScholesEuropeanPut)
	d1 = inv(c.sigma*sqrt(c.T)) * (log(c.S0/c.K) + (c.r + 0.5*c.sigma^2)*c.T)	
	d2 = d1 - c.sigma*sqrt(c.T)
    price = -cdf(Normal(),-d1)*c.S0*exp(-c.q*c.T) + cdf(Normal(),-d2)*c.K*exp(-c.r*c.T) 
end

### Cash Flow Projections
#function projectCashFlow(c::BlackScholesEuropeanCall)
#end


