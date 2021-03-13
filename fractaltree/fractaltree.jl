using Plots

N=50000; c1=0; c2=0; c3=0; c4=0; c5=0; c6=0

# パラメータ
a=[0.05,0.6,0.05,-0.5,1.0,0.46,-0.15,0.39,0.38,0.6,0.47,-0.15,0.17,0.42,1.1,0.43,0.28,-0.25,0.45,1.0,0.42,0.28,-0.35,0.31,0.7]

result = zeros(Float64,2,N+1)

x=0.5;y=0.0
result[:,1] = [x,y]

function calc(x,y,result,c1,c2,c3,c4,c5,c6)
    for i in 2:N+1
        r = rand(Vector(1:10))
        # global x,y,result,c1,c2,c3,c4,c5,c6
        if r==1
            x=a[1]*x
            y=a[2]*y
            result[:,i] = [x,y]
            c1+=1
        elseif r==2
            x=a[3]*x
            y=a[4]*y+a[5]
            result[:,i] = [x,y]
            c2+=1
        elseif r==3 || r==4
            x=a[6]*x+a[7]*y
            y=a[8]*x+a[9]*y+a[10]
            result[:,i] = [x,y]
            c3+=1
        elseif r==5 || r==6
            x=a[11]*x+a[12]*y
            y=a[13]*x+a[14]*y+a[15]
            result[:,i] = [x,y]
            c4+=1
        elseif r==7 || r==8
            x=a[16]*x+a[17]*y
            y=a[18]*x+a[19]*y+a[20]
            result[:,i] = [x,y]
            c5+=1
        else
            x=a[21]*x+a[22]*y
            y=a[23]*x+a[24]*y+a[25]
            result[:,i] = [x,y]
            c6+=1
        end
    end
    return result,c1,c2,c3,c4,c5,c6
end

result,c1,c2,c3,c4,c5,c6 = calc(x,y,result,c1,c2,c3,c4,c5,c6)

println([c1,c2,c3,c4,c5,c6])

scatter(result[1, :], result[2, :],
    markerstrokewidth=0.01,
    markersize=0.1,
    label=""
    )
savefig("fractaltree.png")

