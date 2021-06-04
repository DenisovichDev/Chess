class Fen{
  
  String startFen = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
  //String startFen = "rn3rk1/1pp1bpp1/p2qpnbp/8/3P2PB/P1N2N1P/1PP2PB1/R2Q1RK1 w Qq - 0 1";  
  void loadFen(String fenCode){
    String fenBoard = fenCode.split(" ")[0];
    int file = 0; int rank = 7;
    
    char[] fenBoardArray = new char[fenBoard.length()];
  
    // Copy character by character into array
    for (int i = 0; i < fenBoard.length(); i++) {
        fenBoardArray[i] = fenBoard.charAt(i);
    }
    
    for (char symbol: fenBoardArray){
      if (symbol=='/'){
        file = 0; rank --;
      } else {
        if (Character.isDigit(symbol)){
          file += (int) Character.getNumericValue(symbol);
        } else {
          String stringSymbol = Character.toString(symbol);
          int pieceTypeAndColor = piecesFromSymbol.get(stringSymbol);
          board.squareInfo[file + 8*rank] = pieceTypeAndColor;
          
          file ++;
        }
      }

    }
  }
}
