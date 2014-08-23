
#####################################################
####
#### SAC Credit Operation Types and Methods
####
#####################################################

### Dependencies
require "basic_types.jl"

### Type
type sac

	#Attributes
	notional::Float64
	n::Int64
	rate::Float64
	index::ASCIIString
	start::Int32
	gracePeriod::Int64
	
	#Constructor
	function sac(notional::Float64, n::Int64, rate::Float64, index::ASCIIString, start::Int64=0, gracePeriod::Int64=0)
		new(notional, n, rate, index, start, gracePeriod)
	end

end

### CashFlow Projection
function projectCashFlow(c::sac)
	amortization = [c.notional / c.n for i=1:c.n]
	interest = (c.n - [1:c.n] + 1) .* amortization * c.rate
	p = amortization + interest
	[cashFlow(i,p[i]) for i=1:c.n]
end

### MTM
function mtm(c::sac,d::Array{discountFactor,1})
	cf = projectCashFlow(c)
	sum([cf[i].value * d[i].value for i=1:length(cf)])
end

### Tests ###
#o = sac(1000.0,60,0.1,"A",0,0)
#d = [discountFactor(i,inv((1+0.1/12)^(i/12))) for i=1:60]
#projectCashFlow(o)
#mtm(o,d)
#@time for i=1:300
#	for j=1:60
#		projectCashFlow(o)
#		mtm(o,d)
#	end	
#end

