
### Dependencies
using DataFrames

### Basic Types
require("basic_types.jl")
require("basic_operations.jl")

### Products
require("bullet.jl")
require("sac.jl")
require("stock.jl")

###
#o = stock(1000.0, 0.05, 3, "PETR4")
#b = bullet(1000.0, 60, "SELIC")
#w = sac(1000.0, 60, 0.1, "TJLP")


### Tests ###

#Create an array of 1000 financial contracts
contracts = Any[]
for i=1:50
	push!(contracts, bullet(1000.0, 60, "SELIC"))
	push!(contracts, sac(1000.0, 60, 0.1, "TJLP"))
end

#Initialize the an array with cashFlows of pre-existent contracts
cashFlows = cashFlow[]
mtms = Float64[]
@time for i=1:length(contracts)
	cashFlows = vcat(cashFlows, projectCashFlow(contracts[i]))	 
end

#Loop on simulation horizon, creating new contracts and computing the mtm
@time for j=1:60

	#create new 20 contracts
	newcontracts = Any[]
	for j=1:15
		push!(newcontracts, bullet(1000.0, 60, "SELIC"))
		push!(newcontracts, sac(1000.0, 60, 0.1, "TJLP"))
	end
	
	#update the cashFlows array
	for i=1:length(newcontracts)
		cashFlows = vcat(cashFlows, projectCashFlow(newcontracts[i]))	 
	end

	for i=1:length(cashFlows)
		d = getProcessFromIndexName("TJLP", discountProcess)
		mtms = vcat(mtms, mtm(cashFlows[i][:onDomestic], d))
	end

end


