unit A_Star_PathFinding;

interface

  uses
    System.Generics.Collections, System.Generics.Defaults, Math, Grid_Node, Vcl.Dialogs, SysUtils;

  type
    arrDirections = array of array of Integer;

  type
    A_Star = class
      private
      //****
      OpenList : TList<TNode>;
      ClosedList : TList<TNode>;
      //****

      fGridArray : TGridArray;
      fCurrentNode, fStartNode, fGoalNode : TNode;
      DirectionsArray : arrDirections;
      procedure SortList(SortList : TList<TNode>);
      procedure CheckNeighboreNode(iCheckPosX, iCheckPosY : Integer);
      procedure BuildPath(arrPath : arrDirections; fFinalNode : TNode);
      function Heuristic(currentNode, endNode : TNode) : Integer;

      public
      Constructor create(StartNode, endNode : TNode; arrGrid : TGridArray);
      property Directions : arrDirections read DirectionsArray;

    end;

implementation

{ A_Star }

procedure A_Star.BuildPath(arrPath: arrDirections; fFinalNode : TNode);
var
  i: Integer;
  fParentNode, fBacktrackNode : TNode;
  bAdded : Boolean;
begin

  //A* patah finding function to create an array for the vehicles to follow
  //the directions correctly
  SetLength(arrPath, fFinalNode.G + 2, 2);
  bAdded := false;

  fBacktrackNode := fFinalNode;

  for i := Length(arrPath) - 3 DownTo 0 do
  begin

    fParentNode := fBacktrackNode.parent;
    arrPath[i, 0] := fBacktrackNode.X - fParentNode.X;
    arrPath[i, 1] := fParentNode.Y - fBacktrackNode.Y;

    fBacktrackNode := fParentNode;

  end;

  if Length(arrPath) > 3 then
  begin

    if (arrPath[Length(arrPath) - 3, 0] = -1) OR (arrPath[Length(arrPath) - 3, 1] = 1) then
    begin

      arrPath[Length(arrPath) - 2, 0] := arrPath[Length(arrPath) - 3, 0];
      arrPath[Length(arrPath) - 2, 1] := arrPath[Length(arrPath) - 3, 1];
      bAdded := true;

    end;

  end;

  if (Length(arrPath) > 1) AND (bAdded) then
  begin

    arrPath[Length(arrPath) - 1, 0] := 1;
    arrPath[Length(arrPath) - 1, 1] := 1;

  end else if (Length(arrPath) > 2) AND NOT(bAdded) then
  begin

    arrPath[Length(arrPath) - 2, 0] := 1;
    arrPath[Length(arrPath) - 2, 1] := 1;
    SetLength(arrPath, Length(arrPath) - 1, 2)

  end;

  DirectionsArray := arrPath;

end;

procedure A_Star.CheckNeighboreNode(iCheckPosX, iCheckPosY : Integer);
var
    fNeighboreNode : TNode;
begin


    //Checks the neighboring nodes to ensure they are movable nodes and not outside the map
    if (iCheckPosX = -1) OR (iCheckPosX = 23) OR (iCheckPosY = -1) OR (iCheckPosY = 15) then
    begin

      Exit;

    end;


    fNeighboreNode := fGridArray[iCheckPosX, iCheckPosY];

    if (fNeighboreNode.Walkable = 0) AND (ClosedList.Contains(fNeighboreNode) = false) then
    begin

      if (OpenList.Contains(fNeighboreNode) = false) then
      begin

        OpenList.Add(fNeighboreNode);

      end;

      if (fNeighboreNode.G = -1) OR (fNeighboreNode.G > fCurrentNode.G) then
      begin

       fNeighboreNode.SetValues(fCurrentNode.G + 1, Heuristic(fNeighboreNode, fGoalNode), fCurrentNode);

      end;


    end;


end;

constructor A_Star.create(StartNode, endNode: TNode; arrGrid : TGridArray);
var
  bRepeat : Boolean;
  i, j : Integer;
begin

  //A* Path finding algorythim

  //****
  OpenList := TList<TNode>.Create;
  ClosedList := TList<TNode>.Create;
  //****

  fGridArray := arrGrid;
  fStartNode := StartNode;
  fGoalNode := endNode;
  bRepeat := true;

  //****
  for i := Low(fGridArray) to High(fGridArray) do
    for j := Low(fGridArray[0]) to High(fGridArray[0]) do
    begin
      fGridArray[i, j].SetValues(-1, -1, nil);
      fGridArray[i, j].F := -1;
    end;
  //****

  fStartNode.SetValues(0, Heuristic(fStartNode, fGoalNode), nil);
  OpenList.add(fStartNode);

  repeat

    SortList(OpenList);

    fCurrentNode := OpenList[0];

    if (fCurrentNode = fGoalNode) then
    begin

      ClosedList.Add(fCurrentNode);
      BuildPath(DirectionsArray, fCurrentNode);

      bRepeat := false;

    end;

    OpenList.Remove(fCurrentNode);
    ClosedList.Add(fCurrentNode);

    CheckNeighboreNode(fCurrentNode.X, fCurrentNode.Y - 1);
    CheckNeighboreNode(fCurrentNode.X + 1, fCurrentNode.Y);
    CheckNeighboreNode(fCurrentNode.X, fCurrentNode.Y + 1);
    CheckNeighboreNode(fCurrentNode.X - 1, fCurrentNode.Y);


  until bRepeat = false;


  //****
  OpenList.Free;
  ClosedList.Free;
  //****

end;

//****
function A_Star.Heuristic(currentNode, endNode: TNode): Integer;
begin

  result := Abs(currentNode.X - endNode.X) + Abs(currentNode.Y - endNode.Y);

end;
//****

//****
procedure A_Star.SortList(SortList: TList<TNode>);
begin

  SortList.Sort(
  TComparer<TNode>.Construct(
    function(const A, B: TNode): Integer
    begin
      Result := A.F - B.F;  // Ascending sort by F value
    end
  )
);

end;
//****

end.
