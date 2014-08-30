#####################################################
#### Zero Coupom Bond
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type zcb
	
	t0::Integer
	notional::Number
	t::Integer
	k::currency

	function zcb(notional::Number, t::Number, k::currency, t0=0)
		new(t0, notional, t, k)
	end		

end

### Cash Flow Projections
function projectCashFlow(c::zcb)
	[cashFlow(c.t, c.notional, c.k, c.t0)]
end

### MTM
function mtm(c::zcb)
	cf = projectCashFlow(c::zcb)
	discount(cf)
end

