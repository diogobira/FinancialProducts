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

function projectCashFlow(c::bullet)
end

function mtm(cfOnDomestic::Array{cashFlow,1}, d::discountProcess)
end

