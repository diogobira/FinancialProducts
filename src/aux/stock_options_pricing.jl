
### Dependencies
using Distributions
require("stock_options_types.jl")

### Pricing Functions

# Price an European Call with Fixed Strike
function price(o::EuropeanCallFixedStrike)
	d1 = inv(o.sigma*sqrt(o.T)) * (log(o.S0/o.K) + (o.r - o.q + 0.5*o.sigma^2)*o.T)
	d2 = d1 - o.sigma*sqrt(o.T)
	p = o.S0*exp(-o.q*o.T)*cdf(Normal(),d1) - o.K*exp(-o.r*o.T)*cdf(Normal(),d2)
end

# Price an European Put with Fixed Strike
function price(o::EuropeanPutFixedStrike)
	d1 = inv(o.sigma*sqrt(o.T)) * (log(o.S0/o.K) + (o.r - o.q + 0.5*o.sigma^2)*o.T)
	d2 = d1 - o.sigma*sqrt(o.T)
	p = - o.S0*exp(-o.q*o.T)*cdf(Normal(),-d1) + o.K*exp(-o.r*o.T)*cdf(Normal(),-d2)
end
