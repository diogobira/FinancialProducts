
### Importing to allow overriding
import Base.getindex

### Basic Types

#CashFlow Type
type cashFlow 
	t::Int64
	value::Float64
	index::ASCIIString
end

#"Observable" Type. Can bem used, for instance, for stock spot prices or any other observable variable in the nature!
type observable
	name::ASCIIString
	value::Any
end

#Value Process Type
type valueProcess
	value::Array{Float64,1}
	function valueProcess(baseIndex::Array{(Int64,Float64),1})
		new([ baseIndex[i][2]/baseIndex[1][2]  for i=1:length(baseIndex)])
	end
end

getindex(v::valueProcess, t) = v.value[t]

#Discount Process Type
type discountProcess
	value::Array{Float64,1}
	function discountProcess(discountIndex::Array{(Int64,Float64),1})
		new([ discountIndex[i][2]/discountIndex[1][2]  for i=1:length(discountIndex)])
	end
end

getindex(v::discountProcess, t) = v.value[t]

#Rating type
type rating
	sovereign_rating::ASCIIString
	counterparty_rating::ASCIIString
	operation_rating::ASCIIString
end

#Generic Financial Operation
type genericFinancialOperation
	financialOperation::Any
	rating::rating
end
