
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
	ticker::ASCIIString

	#Constructor
	function stock(amount::Float64, dividend_yield::Float64, dividend_frequency::Int64, ticker::ASCIIString)
		new(amount, dividend_yield, dividend_frequency, ticker)
	end

end

### CashFlow Projection on contract index
function projectCashFlow(c::stock)
	H = 200
	d = c.dividend_yield*c.dividend_frequency
	v = [c.amount for i=1:H]
	cfOnIndex = [cashFlow(i, v[i]*d, "DomesticCurrency") for i=1:c.dividend_frequency:H]
	cfOnDomestic = cfOnIndex
	return {:onIndex=> cfOnIndex, :onDomestic => cfOnDomestic}
end

### MTM
function mtm(c::stock)
	c.amount * 25
end



