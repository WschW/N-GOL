#=
 © Warren Schweigert 2017
 Array functions for n-dimensional game of life.
=#
using Base.Cartesian

export shiftRotArr, shiftZeroArr, neighborCount, nextGeneration, GolGenerationRule

"""
If array access exceeds bounds loop around
"""
function shiftRotArr(A::AbstractArray,Index)
    topLimits = size(A)
    Index = mod1.(Index,topLimits)
    A[Index...]
end

"""
If array access exceeds bounds return zero
"""
function shiftZeroArr(A::AbstractArray, Index)
    if(checkbounds(Bool,A,Index...))
        A[Index...]
    else
        zero(eltype(A))
    end
end

"""
finds the sum of the cells within the recatangular radius for each item in the array
Input:
    edgeMode: a function that indexes the array
    array: the input array
    radius: the radius of an n-cube in which to sum
Output: the sum of the cells within an n-cube of the radius for each
        item in the array, is of type SharedArray{outputElType}
"""
@generated function neighborCount(edgeMode, array::AbstractArray{T,N}, radius) where {T,N}
    quote
        output = similar(array)
        for (index,value) in enumerate(IndexCartesian(),array)
            count = zero(T)
            @nloops $N ii ii->(-radius:radius) begin
                count += edgeMode(array, index.I .+ @ntuple $N ii)
            end
            output[index] = count - array[index]
        end
        output
    end
end


"""
Runs a Game of Life Iteration
Input:
    edgeMode: function which controls what happens to access beyond the arrays edges
    inputArray: the previous generation
    radius: the rectangular radius in which neighbors are counted
    GenerationRule: The rule to calculate the next generation

Output:
    an array that is the next generation
"""
function nextGeneration(edgeMode,inputArray,radius,GenerationRule)
    neighbors = neighborCount(edgeMode,inputArray,radius)
    GenerationRule(neighbors,inputArray)
end

"""
Generation rule for Conway's Game of Life.
"""
function GolGenerationRule(neighbors,inputArray)
    output = similar(inputArray)
    for ii = eachindex(inputArray)
        if(inputArray[ii] > 0)
            output[ii] =  eltype(output)(1 < neighbors[ii] < 4)
        else
            output[ii] = eltype(output)(neighbors[ii] == 3)
        end
    end
    output
end

print(:loaded_2dG) #useful while working TODO:delele this stub
