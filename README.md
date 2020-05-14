# SmallGroupsNonCommutingGraphs
A example of how to use the NCGraph package in GAP. The program provides a function which loops through all of GAP's "small groups" for a given range of orders, generates their non-commuting graphs and the automorphism groups of those graphs, and writes the adjacency matrices, group structure, and automorphism group structure to either a file of the console.

## Requirements
This program depends on the NCGraph package, which you can find [here](https://github.com/GouwarPower/NCGraph). NCGraph depends on GRAPE. For computing the automorphism groups, GRAPE relies on the external nauty binary which must be compiled before use.

## Using the program
To run the program, simply start gap and run the following commands

`gap> ReadFile("small_grp_nc_graphs.g");`

`gap> GenerateSmallGroupNonCommutingGraphs(start, fin, file)`

where start is the order of the group you'd like to start with, fin is the order that you would like to finish with, and file is either the path to a text file where you'd like to write the output or the string `"*stdout*"` to write the console.
