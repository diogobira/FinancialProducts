#####################################################
####
#### Bullet Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")
require("basic_operations.jl")

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

### CashFlow Projection on contract index
function projectCashFlow(c::bullet)
	cfOnIndex = [cashFlow(c.t,c.notional,c.index)]
	cfOnDomestic = projectCashFlowOnDomesticCurrency(cfOnIndex, getProcessFromIndexName(c.index,valueProcess))
	return {:onIndex=> cfOnIndex, :onDomestic => cfOnDomestic}
end

### MTM
function mtm(cfOnDomestic::Array{cashFlow,1}, d::discountProcess)
	dcf = discountedCashFlowValues(cfOnDomestic, d)
	sum([x.value from x = dcf])
end

