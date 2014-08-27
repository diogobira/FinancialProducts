
#####################################################
####
#### SAC Credit Operation Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")

type sac

	#Attributes
	notional::Number
	n::Integer
	rate::Number
	index::String
	
	#Constructor
	function sac(notional::Number, n::Integer, rate::Number, index::String)
		new(notional, n, rate, index)
	end

end

function projectCashFlow(c::sac)
	amortization = [c.notional / c.n for i=1:c.n]
	interest = (c.n - [1:c.n] + 1) .* amortization * c.rate
	p = amortization + interest
end

function mtm(c::sac, discount::Function)
	cf = projectCashFlow(c)	
	dcf = discount(cf)
	sum([x.value for x = dcf])
end

