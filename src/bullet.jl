
#####################################################
####
#### Bullet Types and Methods
####
#####################################################

### Dependencies
require "basic_types.jl"

### Type
type bullet

	#Attributes
	notional::Float64
	t::Int64
	index::ASCIIString
	
	#Constructor
	function bullet(notional::Float64, t::Int64, index::ASCIIString)
		new(notional, t, index)
	end		

end

### CashFlow Projection
function projectCashFlow(c::bullet)
	[cashFlow(c.t,c.notional)]
end

### MTM
function mtm(c::bullet,d::Array{discountFactor,1})
	cf = projectCashFlow(c)
	sum([cf[i].value * d[cf[i].t].value for i=1:length(cf)])
end

### Tests ###
#o = bullet(1000.0,60)
#d = [discountFactor(i,inv((1+0.1/12)^(i/12))) for i=1:60]
#projectCashFlow(o)
#mtm(o,d)
#@time for i=1:1000
#	for j=1:60
#		projectCashFlow(o)
#		mtm(o,d)
#	end	
#end

