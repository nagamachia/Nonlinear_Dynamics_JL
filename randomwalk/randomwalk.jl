using Plots

function main()
    left=[-1.0,0.0];right=[1.0,0.0];up=[0.0,1.0];down=[0.0,-1.0]
    # x=0;y=0;r=[x,y]
    println("原点からのランダムウォーク")
    S = 20000
    result = zeros(Float32,2,S)
    for roop in 1:5
        cleft=0;cup=0;cright=0;cdown=0;r=[0,0]
        for k in 1:S
            rnd=rand()*10
            if 0.0<=rnd && rnd<2.5
                path=left
                cleft+=1
            elseif rnd<5.0
                path=up
                cup+=1
            elseif rnd<7.5
                path=right
                cright+=1
            elseif rnd<=10.0
                path=down
                cdown+=1
            end
            r+=path
            result[:,k]=r
        end
        println("左",cleft,"上",cup,"右",cright,"下",cdown)
        plot(result[1, :], result[2, :])
        savefig("./out/randomwalk$roop.png")
    end    
end

main()