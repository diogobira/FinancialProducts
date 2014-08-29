
require("Basic.Types.And.Functions/basic_types.jl")
require("Amortization.Systems/sac.jl")

#Algumas moedas
BRL = currency("BRL")
USD = currency("USD")
TJLP = currency("TJLP")
SELIC = currency("SELIC")

#Uma curva de desconto
d = discountCurve("PRE", [(i,0.95) for i=1:10000])

#Criando uma operação SAC
s = sac(1000, 10, 0.01, BRL)
cf = projectCashFlow(s)
discount(cf, d)

