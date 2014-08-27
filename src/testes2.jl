
require("basic_types.jl")

kBRL = currency("BRL")
kUSD = currency("USD")
kTJLP = currency("TJLP")
kSELIC = currency("SELIC")

currencies = {:BRL, :USD, :TJLP, :SELIC}
for k1 in currencies
	for k2 in currencies
		if k1!=k2
			@eval function $(symbol(string("exchange_",k1,"_",k2)))(t::Number)
					return(t^2)
				  end	
		end
	end
end


