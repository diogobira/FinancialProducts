###############################################
### Basic Types
###############################################

type currency
	name::String
end

type cashFlow 
	t::Integer
	v::Number
	k::currency
end

type discountCurve
	name::String
	discount::Function
end

type observable
	name::String
	value::Any
end

###############################################
### Basic Operations
###############################################

#Scale the cashFlows by a constant s
function scale(c::Array{cashFlow,1}, s::Number)
	map!(x -> cashFlow(x.t, x.v*s, x.k), c)
end

#Exchange the currency of a cashFlow
function exchange(c::Array{cashFlow,1}, k::currency)
end

#Return the time where the last cashFlow occurs
function horizon(c::Array{cashFlow,1})
	maximum([x.t for x=c])
end

#Truncate all the cashFlows that occurs after time T
function truncate(c::Array{cashFlow,1}, T::Number)
	for i=1:length(c)
		c[i].t > T ? deleteat!(c,i) : Nothing()
	end
end

#Delay cash flows by d units of time
function delay(c::Array{cashFlow,1}, d::Number)
	map!(x -> cashFlow(x.t+d, x.v, x.k), c)
end

#Shift all cashFlow dates by -1
function shiftleft(c::Array{cashFlow,1})
	map!(x -> cashFlow(x.t-1, x.v, x.k), c)
end

#Discount the cashFlows, preserving the original currency
function discount(c::Array{cashFlow,1}, d::Function)
end	

#Discount the cashFlows and change
function discount_and_rename_currency(c::Array{cashFlow,1}, k::currency)
end
