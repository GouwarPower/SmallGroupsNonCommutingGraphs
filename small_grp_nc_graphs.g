LoadPackage("NCGraph");

SmallGroupNonCommutingGraphs := function(start, fin)
  # Loops through all of the small groups from order start to fin, and creates
  #  a list of pairs of the groups and their non-commuting graph
  # Precondition: start <= fin
  local G, i, j, groups_graphs;
  groups_graphs := [];
  for i in [start..fin] do
    for j in [1..NumberSmallGroups(i)] do
      G := SmallGroup(i, j);
      Add(groups_graphs, [G, NonCommutingGraph(G)]);
    od;
  od;
  return groups_graphs;
end;

PrintMatrixToFile := function(file, mat)
  # Prints a matrix row by row to a file
  local row;
  AppendTo(file, "[", "\n");
  for row in mat do AppendTo(file, "\t", row, "\n"); od;
  AppendTo(file, "]", "\n");
  return;
end;

GenerateSmallGroupNonCommutingGraphs := function(start, fin, file)
  # Runs SmallGroupNonCommutingGraphs from start to fin, and then writes
  #  each group's structure, the adjacency matrix of the group's non-commuting
  #  graph, and the structure of the automorphism group of the graph to the
  #  file.
  # Preconditions: file is a valid file path, start <= fin
  # Postcondtions: everything is appended to the file, and the file is not
  #                 overwritten
  local groups_graphs, pair, graph, group_struct, adj_mat, aut_group_struct;
  groups_graphs := SmallGroupNonCommutingGraphs(start, fin);
  for pair in groups_graphs do
    graph := pair[2];
    group_struct := StructureDescription(pair[1]);
    adj_mat := AdjacencyMatrix(graph);
    aut_group_struct := StructureDescription(AutomorphismGroup(graph));
    AppendTo(file, "Group: ", group_struct, "\n");
    if adj_mat = [] then
      AppendTo(file, "Group is abelian", "\n");
      continue;
    else
      PrintMatrixToFile(file, adj_mat);
    fi;
    AppendTo(file, "Automorphism Group of Graph: ", aut_group_struct, "\n\n");
  od;
  return;
end;
