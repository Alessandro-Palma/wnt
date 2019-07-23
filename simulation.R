#load the libraries
library(BoolNet)
library(igraph)

#loading the network
network = loadNetwork("wnt.txt")

#set random seed for reproducibility
set.seed(1982)

#plotting the basins of the attractors from 1000 starting states
attr <- getAttractors(network, method="random", startStates=1000)
plotStateGraph(attr4, piecewise=T)

#computing and plotting the attractor(s)
attr = getAttractors(network)
plotAttractors(attr, allInOnePlot=T, onColor="red", offColor="cyan")

#simulating the mdx condition by knocking out beta-catenin gene
mdx = fixGenes(network, "CTNNB1", 0)
attr2 = getAttractors(mdx)
plotAttractors(attr2, allInOnePlot=T, onColor="red", offColor="cyan")

#simulating the LY treatment by knocking out GSK3 beta
ly = fixGenes(network, "GSK3B_Axin_APC", 0)
attr3 = getAttractors(ly)
plotAttractors(attr3, allInOnePlot=T, onColor="red", offColor="cyan")

#robustness assessment
res <- testNetworkProperties(network,
                       numRandomNets=100,
                       testFunction="testAttractorRobustness",
                       testFunctionParams = list(copies=100, perturb="functions$



