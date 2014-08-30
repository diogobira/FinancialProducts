### Dependencies
require("Basic.Types.And.Functions/basic_types.jl")


### Type
type price

	t0::Integer
	notional::Number
	n::Integer
	rate::Number
	k::currency

	#Constructor
	function price(notional::Number, n::Integer, rate::Number, k::currency, t0=0)
		new(t0, notional, n, rate, k)
	end
	
end

### Methods

function projectCashFlow(c::price)
	p = (c.notional * c.rate) * inv(1 - inv((1+c.rate).^c.n))
	return [cashFlow(t, p, c.k, c.t0) for i=1:c.n]
end

function mtm(c::price)
end
