module BoraneSolver

using DataFrames

function solver(formula::String)::DataFrame
# function solver(formula)
    m = match(r"B(?<num_of_B>\d+)H(?<num_of_H>\d+)", formula)

    # (BH)n(H)m
    n = parse(Int64, m[:num_of_B])
    m = parse(Int64, m[:num_of_H]) - n

    @assert m == 4 || m == 6 "Only support closo (BnHn+4) and nido (BnHn+6) Boranes"

    df_styx = DataFrame(; S=Int64[], T=Int64[], Y=Int64[], X=Int64[])

    
    for s in range(Int64(m / 2), m)
        # s + t = n
        t = n - s        
        if t < 0
            continue
        end
        
        # s + x = m
        x = m - s
        if x < 0
            continue
        end
        
        # y + x = m / 2
        y = Int64(m / 2) - x
        if y < 0
            continue
        end

        push!(df_styx, Dict(:S => s, :T => t, :Y => y, :X => x))
        
    end
    
    return df_styx
end

end