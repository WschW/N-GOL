# N-GOL
# N-GOL
## N-Dimensional generalization of Conway's Game of Life

## Progress:
The Model that can be found in ArrayFunctions.jl file is complete
Testing 1 thru 3 dimensions complete

## REPL example
```

julia> A = zeros(Int,(4,4,4))¬
julia> quad = [0 0 0 0; 0 1 1 0; 0 1 1 0; 0 0 0 0]¬
julia> A[:,:,1] = [0 0 0 0; 0 0 1 0; 0 1 1 0; 0 0 0 0]¬
julia> GOL.nextGeneration(GOL.shiftZeroArr,A,1,GOL.GolGenerationRule)

4×4×4 Array{Int64,3}:
[:, :, 1] =
 0  0  0  0
 0  1  1  0
 0  1  1  0
 0  0  0  0

[:, :, 2] =
 0  0  0  0
 0  1  1  0
 0  1  1  0
 0  0  0  0

[:, :, 3] =
 0  0  0  0
 0  0  0  0
 0  0  0  0
 0  0  0  0

[:, :, 4] =
 0  0  0  0
 0  0  0  0
 0  0  0  0
 0  0  0  0
```

## TODO:
1.) Make a UI to display to allow for the display and manipulation of the simulation outside of the REPL
2.) AOT compile a version for 2D and 3D display
3.) Make tests for 4-D version
