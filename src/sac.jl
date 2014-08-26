
#####################################################
####
#### SAC Credit Operation Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")

type sac

	#Attributes
	notional::Float64
	n::Int64
	rate::Float64
	index::ASCIIString
	
	#Constructor
	function sac(notional::Float64, n::Int64, rate::Float64, index::ASCIIString)
		new(notional, n, rate, index)
	end

end

function projectCashFlow(c::sac)
	amortization = [c.notional / c.n for i=1:c.n]
	interest = (c.n - [1:c.n] + 1) .* amortization * c.rate
	p = amortization + interest
end

function mtm(cfOnDomestic::Array{cashFlow,1}, d::discountProcess)
	dcf = discountedCashFlowValues(cfOnDomestic, d)
	sum([x.value for x = dcf])
end

