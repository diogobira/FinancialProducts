
### Basic Types

#CashFlow Type
type cashFlow 
	t::Int64
	value::Float64
end

#Discount Factor Type
type discountFactor
	t::Int64
	value::Float64
end

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
