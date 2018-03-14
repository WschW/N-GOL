module Test

include("../src/ArrayFunctions.jl")
#ONE DIMENSIONAL TESTS


"""
tests 1-dimensional game of life with out of index array accesses wrapped around
"""
function one_D_oveflow_wrapped()
    A = [1,1,0,1,1]
    if([1,0,0,0,1] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_wrapped not passed")
    end
    A = [1,1,1,1,0]
    if(A != GOL.nextGeneration(GOL.shiftRotArr,A,2,GOL.GolGenerationRule))
        throw("one_D_oveflow_wrapped not passed")
    end
    A = [1,1,1,1,0]
    if([0,1,1,0,0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_wrapped not passed")
    end
    A = [0,1,1,0,0]
    if([0,0,0,0,0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_wrapped not passed")
    end
end



"""
tests 1-dimensional game of life with out of index array accesses returning zero(eltype(the input array))
"""
function one_D_oveflow_zeroed()
    A = [1,1,0,1,1]
    if([0,0,0,0,0] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_zeroed not passed")
    end
    A = [1,1,1,1,0]
    if(A != GOL.nextGeneration(GOL.shiftZeroArr,A,2,GOL.GolGenerationRule))
        throw("one_D_oveflow_zeroed not passed")
    end
    A = [1,1,1,1,0]
    if([0,1,1,0,0] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_zeroed not passed")
    end
    A = [0,1,1,0,0]
    if([0,0,0,0,0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("one_D_oveflow_zeroed not passed")
    end
end


#TWO DIMENSIONAL TESTS

function two_D_oveflow_wrapped()
    A = [1 1; 1 1]
    if([0 0;0 0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_wrapped not passed")
    end
    A = [1 0 0 1; 0 0 0 0; 1 0 0 1]
    if([1 0 0 1; 0 0 0 0; 1 0 0 1] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_wrapped not passed")
    end
    A = [0 0 0 0; 0 0 1 0; 0 1 1 0; 0 0 0 0]
    if([0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
    A = [0 0 0 0; 0 0 0 0; 0 1 1 0; 0 0 0 0]
    if([0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0] != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
end


function two_D_oveflow_zeroed()
    A = [1 1; 1 1]
    if([1 1;1 1] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
    A = [1 0 0 1; 0 0 0 0; 1 0 0 1]
    if([0 0 0 0; 0 0 0 0; 0 0 0 0] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
    A = [0 0 0 0; 0 0 1 0; 0 1 1 0; 0 0 0 0]
    if([0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
    A = [0 0 0 0; 0 0 0 0; 0 1 1 0; 0 0 0 0]
    if([0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0] != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("two_D_oveflow_zeroed not passed")
    end
end

#THREE DIMENSIONAL TESTS

function three_D_oveflow_wrapped()
    A = zeros(Int,(4,4,4))
    B = zeros(Int,(4,4,4))
    quad = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0]
    A[:,:,1] = [0 0 0 0; 0 0 1 0; 0 1 1 0; 0 0 0 0]
    B[:,:,1] = quad
    B[:,:,2] = quad
    B[:,:,4] = quad
    if(B != GOL.nextGeneration(GOL.shiftRotArr,A,1,GOL.GolGenerationRule))
        throw("three_D_oveflow_wrapped not passed")
    end
end

function three_D_oveflow_zeroed()
    A = zeros(Int,(4,4,4))
    B = zeros(Int,(4,4,4))
    quad = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0]
    A[:,:,1] = [0 0 0 0; 0 0 1 0; 0 1 1 0; 0 0 0 0]
    B[:,:,1] = quad
    B[:,:,2] = quad
    if(B != GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule))
        throw("three_D_oveflow_wrapped not passed")
    end
end

function runtests()
    tests = [two_D_oveflow_zeroed,two_D_oveflow_wrapped,one_D_oveflow_zeroed,one_D_oveflow_wrapped,three_D_oveflow_wrapped,three_D_oveflow_zeroed]
    count = 0
    foreach((x) -> begin
                        try
                            x()
                            print("test: ",x," succeeded\n---\n")
                            count += 1;
                        catch
                            warn("test: ",x," failed\n---\n")
                        end
                    end,
            tests)
    numTests = length(tests)
    print("\n\n======\n\n","Out of ",numTests," test ",numTests - count," failed.")
end

runtests()

end
