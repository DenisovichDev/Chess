class PieceInfoClass {
  
  int none = 0;
  int king = 1;
  int queen = 2;
  int rook = 3;
  int bishop = 4;
  int knight = 5;
  int pawn = 6;
  
  int white = 8;
  int black = 16;
  
  int whiteMask = 0b01000;    //checks if white with bitwise and operator
  int blackMask = 0b10000;    //checks if black with bitwise and operator
  
  int colorMask = whiteMask | blackMask;    //returns the color when used with bitwise and operator
  
  int pieceMask = 0b00111;          //returns the piece when used with bitwise and operator
  
  
  void identifyPieces(int file, int rank, int[] arr){
    
    int pieceCode = arr[file + 8*rank];
    
    if (!board.isSquareEmpty(file, rank)){
      
      drawPiece(getColor(pieceCode), pieceCode, file, rank);
      

    }
  }
  
  void drawPiece(int colour, int piece, int file, int rank){
    PVector position = new PVector(file*l, h - (rank*l + l));
    int colourIndexInJason = json.getJasonColorIndex(colour);
    int pieceIndexInJason = json.getJasonPieceIndex(piece);
    arrr.add(board.squareInfo[file + rank *8]);
    image(piecesImageArray[colourIndexInJason][pieceIndexInJason], position.x, position.y);  //pieces.get(file + rank*8).
    
  }
  
// The following functions read the 5-bit binary code and identifies the color and piece
  
  boolean isPawn(int a) {
    return ((pieceMask & a) == pawn);
  }
  
  boolean isKnight(int a) {
    return ((pieceMask & a) == knight);
  }
  
  boolean isBishop(int a) {
    return ((pieceMask & a) == bishop);
  }
  
  boolean isRook(int a) {
    return ((pieceMask & a) == rook);
  }
  
  boolean isQueen(int a) {
    return ((pieceMask & a) == queen);
  }
  
  boolean isKing(int a) {
    return ((pieceMask & a) == king);
  }
  
  int getColor(int a) {
    return (a & colorMask);
  }
  
  //Returns pointer location in squares
  

  
}
