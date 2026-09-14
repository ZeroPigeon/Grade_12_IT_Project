unit Grid_Node;

interface

  type
    TNode = class
      private
      fX, fY, f_F, f_G, f_H, fStatus : Integer;
      fParentNode : TNode;

      public
      Constructor create(iX, iY, iStatus : Integer);
      procedure SetValues (i_G, i_H : Integer; _ParentNode : TNode);
      property F : Integer read f_F write f_F;
      property X : Integer read fX;
      property Y : Integer read fY;
      property G : Integer read f_G;
      property parent : TNode read fParentNode;
      property Walkable : Integer read fStatus write fStatus;

    end;

  //****
  type TGridArray = array of array of TNode;
  //****

implementation

{ TNode }

constructor TNode.create(iX, iY, iStatus : Integer);
begin

  //Creates a vehicle object
  fX := iX;
  fY := iY;
  fStatus := iStatus;

  f_F := 0;
  f_G := -1;
  f_H := 0;

  fParentNode := nil;

end;

procedure TNode.SetValues(i_G, i_H: Integer; _ParentNode : TNode);
begin

  //Sets values for path finding
  f_G := i_G;
  f_H := i_H;
  f_F := f_G + f_H;
  fParentNode := _ParentNode;

end;

end.
