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
    savefig("langfordTsit5.png")
end

# plot using Gnuplot
function pltgnu()
    x, y, z = sol[1,:], sol[2,:], sol[3,:]
    tempo = sol.t
    @gsp "set xyplane at -3" "set auto fix" "set grid" :-
    @gsp :- x y z tempo "w l notit lc palette" #palette(:plasma)
    @gsp :- "set title 'Langford attractor'" "set cblabel 'time'"
    @gsp :- xl  ab = "x" ylab = "y" zlab = "z"
    save(term="pngcairo size 640,480", output="langford_gnu.png")
end

function pltgif()
    plt = plot3d(1, xlim=(-1.5,1.5), ylim=(-1.5,1.5), zlim=(-0.5,2),
                title = "Langford Attractor", 
                xlabel="x", ylabel="y", zlabel="z",
                size=(640, 480),
                label="")
    anim = @animate for step in 1:size(sol)[2]
        push!(plt, sol[1,step], sol[2,step], sol[3,step])
    end every 10
    gif(anim, "langfordTsit5.gif", fps=30)
end

# @CPUtime plt()
# @CPUtime pltgnu()
@CPUtime pltgif()