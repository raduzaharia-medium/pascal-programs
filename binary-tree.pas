Program BinaryTreeExample;

Type 
  BinaryTreePointer = ^BinaryTree;
  BinaryTree = Record
    value: integer;

    left: BinaryTreePointer;
    right: BinaryTreePointer;
  End;

Function CreateTreeNode(value: integer; leftTree: BinaryTreePointer; rightTree: BinaryTreePointer): BinaryTreePointer;
Var result: BinaryTreePointer;
Begin
  new(result);

  result^.value := value;
  result^.left := leftTree;
  result^.right := rightTree;

  exit(result);
End;

Function CreateTreeNode(value: integer): BinaryTreePointer;
Begin
  exit(CreateTreeNode(value, Nil, Nil));
End;

Procedure InsertValue(value: integer; Var treeNode: BinaryTreePointer);
Begin
  If treeNode = Nil Then treeNode := CreateTreeNode(value)
  Else
    Begin
      If value > treeNode^.value Then
        Begin
          If treeNode^.right = Nil Then treeNode^.right := CreateTreeNode(value)
          Else InsertValue(value, treeNode^.right);
        End;

      If value < treeNode^.value Then
        Begin
          If treeNode^.left = Nil Then treeNode^.left := CreateTreeNode(value)
          Else InsertValue(value, treeNode^.left);
        End;
    End;
End;

Procedure PrintTree(treeNode: BinaryTreePointer);
Begin
  If treeNode = Nil Then exit;
  writeln(treeNode^.value);

  If treeNode^.left <> Nil Then PrintTree(treeNode^.left);
  If treeNode^.right <> Nil Then PrintTree(treeNode^.right);
End;

Procedure DisposeTree(var treeNode: BinaryTreePointer);
Begin
  If treeNode = Nil Then exit;

  DisposeTree(treeNode^.left);
  DisposeTree(treeNode^.right);

  dispose(treeNode);
  treeNode := Nil;
End;

Var myTree: BinaryTreePointer;
Begin
  InsertValue(2, myTree);
  InsertValue(3, myTree);
  InsertValue(1, myTree);
  InsertValue(0, myTree);

  PrintTree(myTree);
  DisposeTree(myTree);

  InsertValue(2, myTree);
  InsertValue(3, myTree);
  InsertValue(1, myTree);
  InsertValue(0, myTree);

  PrintTree(myTree);
  DisposeTree(myTree);
End.
