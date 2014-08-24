
#####################################################
####
#### SAC Credit Operation Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type sac

	#Attributes
	notional::Float64
	n::Int64
	rate::Float64
	index::ASCIIString
	
	#Constructor
	function sac(notional::Float64, n::Int64, rate::Float64, index::ASCIIString)
		new(notional, n, rate, index)
	end

end

### CashFlow Projection on contract index
function projectCashFlow(c::sac)
	amortization = [c.notional / c.n for i=1:c.n]
	interest = (c.n - [1:c.n] + 1) .* amortization * c.rate
	p = amortization + interest
	cfOnIndex = [cashFlow(i,p[i],c.index) for i=1:c.n]
	cfOnDomestic = projectCashFlowOnDomesticCurrency(cfOnIndex, getProcessFromIndexName(c.index,valueProcess))
	return {:onIndex=> cfOnIndex, :onDomestic => cfOnDomestic}
end

### MTM
function mtm(cfOnDomestic::Array{cashFlow,1}, d::discountProcess)
	dcf = discountedCashFlowValues(cfOnDomestic, d)
	sum([x.value for x = dcf])
end

