using Plots
function calc()
    imax=300
    result=zeros(Float64,5,2,(imax*2+1)^2)
    for iter in 1:5
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
                    z=tan((z^iter)^iter)+c
                    if abs(z)>2.0
                        flag=1
                        break
                    end
                end
                if flag==0
                    cnt+=1
                    result[iter,:,cnt]=[x,y]
                end
            end
        end
    end
    return result
end

result = calc()

for iter in 1:5
    scatter(result[iter,1,:], result[iter,2,:],
        markerstrokewidth=0.01,
        markersize=0.1
        )
    savefig("./out/mandelbrot_tan$iter.png")
end
