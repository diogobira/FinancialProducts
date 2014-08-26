
require("basic_types.jl")

#Return the valueProcess given a index name
function getProcessFromIndexName(index::ASCIIString, processType)
	if index=="PETR4"
		p = [(i,25*(1+0.15)^(i/12)) for i=0:3:1200]
	elseif index=="SELIC"
		p = [(i,1 + rand(0.0:0.01:0.1)) for 0=1:3:1200]
	elseif index=="TJLP"
		p = [(i,1 + rand(0.0:0.01:0.1)) for 0=1:3:1200]
	end
	processType(p)
end

#
function scale()
end

#Compute the future values of a cashFlows array in the domestic currency
function value()
end

#Compute the discounted value of a cashFlows array 
function discount()
end	

