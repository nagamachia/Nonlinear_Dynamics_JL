using Plots
function calc()
    imax=500
    result=zeros(Float64,2,(imax*2+1)^2)
    cnt=0
    dx=2.0/imax
    dy=2.0/imax
    for i in -imax:imax
        for j in -imax:imax
            x=dx*i
            y=dy*j
            c=complex(x,y)
            z=0.0im
            flag=0
            for l in 1:200
                z=z^2+c
                if abs(z)>2.0
                    flag=1
                    break
                end
            end
            if flag==0
                cnt+=1
                result[:,cnt]=[x,y]
            end
        end
    end
    return result
end

result = calc()

scatter(result[1,:], result[2,:],
    markerstrokewidth=0.01,
    markersize=0.1
    )
savefig("manderblot_square.png")
