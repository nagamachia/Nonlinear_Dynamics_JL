using DifferentialEquations
using CPUTime
# using Plots
using PyCall,PyPlot

sir_ode = @ode_def SIRModel begin
    d🌝 = -β*🌝*🤧
    d🤧 = β*🌝*🤧-γ*🤧
    d😷 = γ*🤧
    end β γ

parms = [0.1,0.05]
init = [0.99,0.01,0.0]
tspan = (0.0,200.0)
sir_prob = ODEProblem(sir_ode,init,tspan,parms)

@CPUtime sir_sol = solve(sir_prob,saveat = 0.1);

# plot(sir_sol,xlabel="Time",ylabel="Number")

rc("font", family="Segoe UI Emoji")
plot(sir_sol.t,sir_sol[1,:],lw=1,label="💪😀")
plot(sir_sol.t,sir_sol[2,:],lw=1,label="🦠🤧")
plot(sir_sol.t,sir_sol[3,:],lw=1,label="💉😷")
xlabel("Time")
ylabel("Number")
legend()

savefig("SIR.png")