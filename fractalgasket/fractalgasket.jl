# using Pkg
using Plots
# using Gnuplot

p0=[0,0];p1=[1,0];p2=[1,1]
x=0;y=0
result = Array{Float64}(undef, 2, 0)
println("フラクタル・シェルピンスキーのギャスケット")

N = 100000

for k in 1:N
    r = rand(0:10)
    if r%3==0
        p=p0
    elseif r%3==1
        p=p1
    else
        p=p2
    end
    global x,y,result
    x=(x+p[1])/2.0
    y=(y+p[2])/2.0
    result = hcat(result,[x,y])
end

scatter(result[1, :], result[2, :],
    markerstrokewidth=0.01,
    markersize=0.1,
    ratio=:equal,
    label=""
    )
savefig("fractalgasket.png")

# @gp "set size ratio -1"
# @gp result[1, :] result[2, :] "with dots title 'fractalgasket'"
# save(term="pngcairo", output="fractalgasket_gn.png")