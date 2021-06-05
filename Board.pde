class Board {
  int[] squareInfo;
  
  Board(){
    squareInfo = new int[64];
  }
  
  void readBoard(int[] arr){
    for (int file = 0; file < 8; file++){
      for (int rank = 0; rank < 8; rank++){
        pieceInfo.identifyPieces(file, rank, arr);
      }
    }
  }
  
  void resetBoard(){
    for (int file = 0; file < 8; file++){
      for (int rank = 0; rank < 8; rank++){
        squareInfo[file + rank*8] = 0;
      }
    }
  }
  
  
  boolean isSquareEmpty(int file, int rank){
    return (squareInfo[file + rank*8] == 0);
  }
  
  int squareColor(int file, int rank){
    
    return ((file + rank) % 2);

  }
  
  int pointerLocation(){
    int file = int(mouseX / 75) ;
    int rank = int(mouseY / 75) ;
    println(file, rank);
    return(file + rank*8);
  }
}
