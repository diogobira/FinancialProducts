
#####################################################
####
#### Stock Types and Methods
####
#####################################################

### Dependencies
require("basic_types.jl")

### Type
type stock

	#Attributes
	amount::Float64
	dividend_yield::Float64		
	dividend_frequency::Int64
	index::ASCIIString

	#Constructor
	function stock(amount::Float64, dividend_yield::Float64, dividend_frequency::Int64, index::ASCIIString)
		new(amount, dividend_yield, dividend_frequency, index)
	end

end

### CashFlow Projection
function projectCashFlow(c::stock)
	H = 200
	d = c.dividend_yield*c.dividend_frequency
	v = [c.amount for i=1:H]
	[cashFlow(i, v[i]*d, c.index) for i=1:c.dividend_frequency:H]
end

### MTM
function mtm(c::stock)
	c.amount	
end



