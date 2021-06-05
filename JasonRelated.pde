class Json{
  
  int getJasonPieceIndex(int pieceCode) {
    switch(pieceCode & pieceInfo.pieceMask) {
      case 1:      //King
        return(0);
      case 2:      //Queen
        return(1);
      case 3:      //Rook
        return(4);
      case 4:      //Bishop
        return(2);
      case 5:      //Knight
        return(3);
      default:     //Pawn
        return(5);

    }
  }
  
  int getJasonColorIndex(int colorCode) {      //colorCode, not pieceCode [8/16]
    switch(colorCode){
      case 16:      //Black
        return(1);
      default:      //White
        return(0);
      }
    }
  }
