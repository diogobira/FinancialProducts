#####################################################
#### regular Coupom Bond
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type coupomBond

	t0::Integer
	notional::Number
	coupom_dates::Array{Number,1}
	coupom_rates::Array{Number,1}	
	k::currency

	function coupomBond(notional::Number, coupom_dates::Array{Number,1}, coupom_rates::Array{Number,1}, k::currency, t0=0)
		new(t0, notional, coupom_dates, coupom_rates, k)
	end 

end

### Cash Flow Projections
function projectCashFlow(c::coupomBond)
	cf = [cashFlow(c.coupom_dates[t], c.notional*c.coupom_rates[t], c.k) for t = 1:length(c.coupom_dates)]
	cf[length(c.coupom_dates)].v = cf[length(c.coupom_dates)].v + c.notional
	cf
end

### MTM
#function mtm(c::coupomBond)
#end

