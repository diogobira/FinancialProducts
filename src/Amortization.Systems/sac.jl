
#####################################################
####
#### SAC Credit Operation Types and Methods
####
#####################################################

### Dependencies
require("Basic.Types.And.Functions/basic_types.jl")

type sac

	#Attributes
	notional::Number
	n::Integer
	rate::Number
	k::currency
	
	#Constructor
	function sac(notional::Number, n::Integer, rate::Number, k::currency)
		new(notional, n, rate, k)
	end

end

function projectCashFlow(c::sac)
	amortization = [c.notional / c.n for i=1:c.n]
	interest = (c.n - [1:c.n] + 1) .* amortization * c.rate
	p = amortization + interest
	[cashFlow(t, p[t], c.k) for t=1:c.n]
end

function projectCashFlow(c::sac, k::currency)
	exchange_(projectCashFlow(c)
end

function mtm(c::sac, d::discountCurve)
	sum([x.v for x = discount(projectCashFlow(c),d)])	
end

