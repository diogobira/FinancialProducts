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

function projectCashFlow(c::zcb, k::currency)
	cf = [cashFlow(c.t, c.notional, c.k)]
	exchange_(cf,k)
end


### MTM
function mtm(c::zcb)
	cf = projectCashFlow(c::zcb)
	discount(cf)
end

function mtm(c::zcb, k::currency)
end

