# using Pkg
# Pkg.add("ParameterizedFunctions")
# Pkg.add("DifferentialEquations")
# Pkg.add("GR")
# Pkg.add("Plots")
# Pkg.add("Gnuplot")
# Pkg.add("CPUTime")
using ParameterizedFunctions, DifferentialEquations
using Plots, Gnuplot
using CPUTime

g = @ode_def LorenzExample begin
    dx = p*(y-x) 
    dy = x*(r-z) - y
    dz = x*y - b*z
  end p r b

u0 = [0.0;1.01;0.0]
tspan = (0.0,100.0)
p = [10.0,25.0,7/3]
prob = ODEProblem(g,u0,tspan,p)

@CPUtime sol = solve(prob,Tsit5(),reltol=1e-8,abstol=1e-8)

function plt()
    # gr()
    plot(sol,vars=(1,2,3), title="Lorenz Attractor", 
        xlabel="x", ylabel="y", zlabel="z", label="")
    savefig("lorenz.png")
end

function pltgnu()
    x, y, z = sol[1,:], sol[2,:], sol[3,:]
    tempo = sol.t
    @gsp "set xyplane at -3" "set auto fix" "set grid" :-
    @gsp :- x y z tempo "w l notit lc palette" #palette(:plasma)
    @gsp :- "set title 'Lorenz attractor'" "set cblabel 'time'"
    @gsp :- xlab = "x" ylab = "y" zlab = "z"
    save(term="pngcairo size 640,480", output="lorenz_gnu.png")
end

function pltgif()
    plt = plot3d(1, xlim=(-20,20), ylim=(-20,25), zlim=(0,40),
                title = "Lorenz Attractor", 
                xlabel="x", ylabel="y", zlabel="z",
                size=(640, 480),
                label="")
    anim = @animate for step in 1:size(sol)[2]
        push!(plt, sol[1,step], sol[2,step], sol[3,step])
    end every 10
    gif(anim, "lorenzFps30.gif", fps=30)
end

@CPUtime plt()
# @CPUtime pltgnu()
# @CPUtime pltgif()