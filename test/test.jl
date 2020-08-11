using HopfieldNets
using Pkg

include(Pkg.dir("HopfieldNets", "demo", "letters.jl"))

patterns = hcat(X, O)

n = size(patterns, 1)

net = DiscreteHopfieldNet(n)

train!(net, patterns)

settle!(net, 10, true)

Xcorrupt = copy(X)
for i = 2:7
     Xcorrupt[i] = 1
end

Xrestored = associate!(net, Xcorrupt[:,3])
all(Xcorrupt .== X)
all(Xrestored .== X)