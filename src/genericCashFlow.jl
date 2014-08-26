#############################################################################
#### GenericCashFlow Types and Methods
#### Description: 
#### 	A contract defined only by an array of cashFlows, 
#### 	possibly with diferent indexes.
#############################################################################

### Dependencies
require("basic_types.jl")
require("basic_operations.jl")

type genericCashFlow
	cashFlows::Array{cashFlow,1}
end

function projectCashFlow(c::genericCashFlow)
end

function mtm(cfOnDomestic::Array{cashFlow,1}, d::discountProcess)
end

