using Plots

function main()
    left=[-1.0,0.0];right=[1.0,0.0];up=[0.0,1.0];down=[0.0,-1.0]
    println("原点からのランダムウォーク")
    S = 20000
    for roop in 1:5
        result=cumsum(rand([left,right,up,down],S);dims=1)
        plot([result[i][1] for i in 1:S], [result[i][2] for i in 1:S],aspect_ratio=:equal,label="")
        savefig("./out/randomwalk$roop.png")
    end
end

main()