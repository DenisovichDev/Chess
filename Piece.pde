

class Piece{
  
  PVector AlgebraicCoordinate = new PVector();
  PVector position = new PVector();
  int type;
  int colour;
  
  Piece(int file, int rank){
    AlgebraicCoordinate.set(file, rank);
    position.set(file*l, h - (rank*l + l));
    type = board.squareInfo[file + rank*8] & pieceInfo.pieceMask;
    colour = board.squareInfo[file + rank*8] & pieceInfo.colorMask;
    
  }
}
