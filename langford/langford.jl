using Pkg
# Pkg.add("ParameterizedFunctions")
# Pkg.add("DifferentialEquations")
# Pkg.add("GR")
# Pkg.add("Plots")
# Pkg.add("Gnuplot")
# Pkg.add("CPUTime")
using ParameterizedFunctions, DifferentialEquations
using Plots;gr()
using Gnuplot, LinearAlgebra
using CPUTime

g = @ode_def Langford begin
    dx = (z-u)*x - w*y
    dy = w*x + (z-u)*y
    dz = n + z - (z^3)/3.0 - (x^2+y^2)*(1+l*z)
  end u w n l

u0 = [0;1;0]
tspan = (0,500)
p = [0.7,3.5,0.6,0.25]
prob = ODEProblem(g,u0,tspan,p)

@CPUtime sol = solve(prob,Tsit5(),reltol=1e-8,abstol=1e-8)
# @CPUtime sol = solve(prob,RK4();dt=0.01)

# plot using Plots
function plt()
    gr()
    plot(sol,vars=(1,2,3))
    savefig("./langford/langfordTsit5.png")
end

# plot using Gnuplot
function pltgnu()
    x, y, z = sol[1,:], sol[2,:], sol[3,:]
    tempo = sol.t
    @gsp "set xyplane at -3" "set auto fix" "set grid" :-
    @gsp :- x y z tempo "w l notit lc palette" #palette(:plasma)
    @gsp :- "set title 'Langford attractor'" "set cblabel 'time'"
    @gsp :- xl  ab = "x" ylab = "y" zlab = "z"
    save(term="pngcairo size 640,480", output="./langford/langford_gnu.png")
end

@CPUtime plt()
# @CPUtime pltgnu()