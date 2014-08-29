#####################################################
####
#### zcb Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type zcb

	notional::Number
	t::Int64
	k::currency

	function zcb(notional::Number, t::Number, k::currency)
		new(notional, t, k)
	end		
end

### Cash Flow Projections
function projectCashFlow(c::zcb)
	[cashFlow(c.t, c.notional, c.k)]
end

### MTM
function mtm(c::zcb)
	cf = projectCashFlow(c::zcb)
	discount(cf)
end

