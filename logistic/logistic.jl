using Pkg
# Pkg.add("GR")
# Pkg.add("Plots")
# Pkg.add("CPUTime")
# Pkg.add("DynamicalSystems")
# Pkg.add("PyPlot")
using LinearAlgebra
using CPUTime
using DynamicalSystems
using Plots
# using PyPlot

ds = Systems.logistic()
i = 1
pvalues = 3:0.001:4
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

function plotPyplot()
    figure()
    PyPlot.title("total points: $(L*n)")
    plot(x, y, ls = "None", ms = 0.5, color = "black", marker = "o", alpha = 0.05)
    xlim(pvalues[1], pvalues[end]); ylim(0,1)
    xlabel("\$r\$"); ylabel("\$x\$")
    tight_layout()
    savefig("logistic.png")
end

function plotPlots()
    scatter(x,y,
    markershape=:circle,
    markersize=0.5,
    markeralpha=0.05,
    title="total points: $(L*n)",
    xlims=(pvalues[1],pvalues[end]),ylims=(0,1),
    label="",
    xlabel="\$r\$",
    ylabel="\$x\$"
    )
    savefig("logisticplots.png")
end

plotPlots()