### Dependencies
require("basic_types.jl")


### Type
type price

	notional::Number
	n::Integer
	rate::Number
	k::currency

	#Constructor
	function price(notional::Number, n::Integer, rate::Number, k::currency)
		new(notional, n, rate, k)
	end
	
end

### Methods

function projectCashFlow(c::price)

end
