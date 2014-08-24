
### Basic Types
require("basic_types.jl")

### Products
require("bullet.jl")
require("sac.jl")
require("stock.jl")

### Stubs for some indexes (trimestral)
petr4_idx = [ (i,25*(1+0.15)^(i/12)) for i=1:3:1200]
selic_idx = [ (i,1 + rand(0.0:0.01:0.1)) for i=1:3:1200]
tjlp_idx = [ (i,1 + rand(0.0:0.01:0.1)) for i=1:3:1200]

###
o = stock(1000.0, 0.05, 3, "PETR4")
b = bullet(1000.0, 60, "SELIC")
w = sac(1000.0, 60, 0.1, "TJLP")
#projectCashFlows(o)

