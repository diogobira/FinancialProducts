
require("basic_types.jl")

#Return the valueProcess given a index name
function getProcessFromIndexName(index::ASCIIString, processType)
	if index=="PETR4"
		p = [(i,25*(1+0.15)^(i/12)) for i=1:3:1200]
	elseif index=="SELIC"
		p = [(i,1 + rand(0.0:0.01:0.1)) for i=1:3:1200]
	elseif index=="TJLP"
		p = [(i,1 + rand(0.0:0.01:0.1)) for i=1:3:1200]
	end
	processType(p)
end

#Compute the future values of a cashFlows array in the domestic currency
function projectCashFlowOnDomesticCurrency(cf::Array{cashFlow,1}, v::valueProcess)
	new_cf_values = [c.value for c=cf] .* [v[t] for t=[c.t for c=cf]]
	[cashFlow(t,new_cf_values[t],"DomesticCurrency") for t=1:length(cf)]
end

#Compute the discounted value of a cashFlows array 
function discountedCashFlowValues(cf::Array{cashFlow,1}, d::discountProcess)
	new_cf_values = [c.value for c=cf] .* [d[t] for t=[c.t for c=cf]]
	[cashFlow(t, new_cf_values[t], cf[t].index) for t=1:length(cf)]
end	

#Get stock spot price given an index name (must be implemented by the user
function getStockSpotPriceFromTickerName()
	return 25
end
