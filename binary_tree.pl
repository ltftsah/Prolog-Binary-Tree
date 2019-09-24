
emptyBT :- nil.

bTree(N, T1, T2) :- T1 =< N, N < T2.

%search predicate to check if something is in a tree
search(bTree(Node, _, _), Node). %Base case, if in first node
search(bTree(Node, Left, _), X) :- X =< Node, search(Left, X).%search left branch
search(bTree(_, _, Right), X) :- search(Right, X). %search right branch

%insert(I,T1,T2) predicate where T2 is binary tree T1 with I inserted
insert(Node, nil, bTree(Node, nil, nil)).%base case, if bTree 1 is empty
insert(Node, bTree(X, Left, Right), bTree(X, Lefty, Right)) :- Node =< X, insert(Node, Left, Lefty).
insert(Node, bTree(X, Left, Right), bTree(X, Left, Righty)) :- insert(Node, Right, Righty).

%height predicate
height(nil, 0). %if tree is empty, height is zero
height(bTree(_, Left, Right), Height) :- %check height of left and right branches
    height(Left, LHeight), height(Right, RHeight),
    Height is max(LHeight, RHeight)+1.%Height is which ever branch is higher

%preorder predicate
preorder(nil, []).%base case, if binary tree is empty
preorder(bTree(Node, Left, Right), [Node|List]) :-
    preorder(Left, LList), preorder(Right, RList), %recursive calls on left, then right branch
    append(LList, RList, List). %append right lists to left lists

%inorder predicate
inorder(nil, []).%base case, if binary tree is empty
inorder(bTree(Node, Left, Right), List) :-
    inorder(Left, LList), inorder(Right, RList), %recursive calls on left, then right branch
    append(LList, [Node|RList], List).%append right lists to left lists, keeping Node as head

%postorder predicate
postorder(nil, []).%base case, if binary tree is empty
postorder(bTree(Node, Left, Right), List) :-
    postorder(Left, LList), postorder(Right, RList),%recursive calls on left, then right branch
    append(LList, RList, Lister), % append right lists to left lists to create lister
    append(Lister, [Node], List). %append the node to the end of Lister

