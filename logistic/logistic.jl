using Pkg
Pkg.add("GR")
# Pkg.add("Plots")
Pkg.add("Gnuplot")
Pkg.add("CPUTime")
Pkg.add("DynamicalSystems")
Pkg.add("PyPlot")
# using Plots
using Gnuplot, LinearAlgebra
using CPUTime
using DynamicalSystems
using PyPlot

ds = Systems.logistic()
i = 1
pvalues = 3:0.001:4
ics = [rand() for m in 1:10]
n = 2000
Ttr = 2000
p_index = 1
output = orbitdiagram(ds, i, p_index, pvalues; n = n, Ttr = Ttr)

L = length(pvalues)
x = Vector{Float64}(undef, n*L)
y = copy(x)
for j in 1:L
    x[(1 + (j-1)*n):j*n] .= pvalues[j]
    y[(1 + (j-1)*n):j*n] .= output[j]
end

figure()
PyPlot.title("total points: $(L*n)")
plot(x, y, ls = "None", ms = 0.5, color = "black", marker = "o", alpha = 0.05)
xlim(pvalues[1], pvalues[end]); ylim(0,1)
xlabel("\$r\$"); ylabel("\$x\$")
tight_layout()
savefig("logistic.png")