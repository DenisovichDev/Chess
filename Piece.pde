class Piece {
  int none = 0;
  int king = 1;
  int queen = 2;
  int rook = 3;
  int bishop = 4;
  int knight = 5;
  int pawn = 6;
  
  int white = 8;
  int black = 16;

  
  
  void identifyPieces(int file, int rank, int[] arr){
    
    int code = arr[file + 8*rank];
    
    if (!board.isSquareEmpty(file, rank)){
      
      if (isPawn(code)){
        drawPiece(getColor(code), 5, file, rank);
      }
      else if (isKnight(code)){
        drawPiece(getColor(code), 3, file, rank);
      }
      else if (isBishop(code)){
        drawPiece(getColor(code), 2, file, rank);
      }
      else if (isRook(code)){
        drawPiece(getColor(code), 4, file, rank);
      }
      else if (isQueen(code)){
        drawPiece(getColor(code), 1, file, rank);
      }
      else if (isKing(code)){
        drawPiece(getColor(code), 0, file, rank);
      }
    }
  }
  
  void drawPiece(int colour, int piece, int file, int rank){
    PVector position = new PVector(file*l, h - (rank*l + l));
    image(piecesImageArray[colour][piece], position.x, position.y);
    
  }
  
// The following functions read the 5-bit binary code and identifies the color and piece
  
  boolean isPawn(int a){
    return (((a>>2 & 1) == 1) && ((a>>1 & 1) == 1) && ((a>>0 & 1) != 1));
  }
  
  boolean isKnight(int a){
    return (((a>>2 & 1) == 1) && ((a>>1 & 1) != 1) && ((a>>0 & 1) == 1));
  }
  
  boolean isBishop(int a){
    return (((a>>2 & 1) == 1) && ((a>>1 & 1) != 1) && ((a>>0 & 1) != 1));
  }
  
  boolean isRook(int a){
    return (((a>>2 & 1) != 1) && ((a>>1 & 1) == 1) && ((a>>0 & 1) == 1));
  }
  
  boolean isQueen(int a){
    return (((a>>2 & 1) != 1) && ((a>>1 & 1) == 1) && ((a>>0 & 1) != 1));
  }
  
  boolean isKing(int a){
    return (((a>>2 & 1) != 1) && ((a>>1 & 1) != 1) && ((a>>0 & 1) == 1));
  }
  
  int getColor(int a){
    return (a>>4);
  }
  
  
}
