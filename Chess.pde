color lightColor = color(241, 217, 192);
color darkColor = color(169, 122, 101);
int h = 600;
int l = h/8;

PImage spritesheet;
JSONObject spritedata;
PImage[][] piecesImageArray;

ArrayList<Piece> pieces = new ArrayList<Piece>();
ArrayList<Integer> arrr = new ArrayList<Integer>();
 

IntDict piecesFromSymbol;


void setup(){
  size(600, 600);
  
  //creating sprite array
  
  piecesImageArray = new PImage[2][6];
  spritedata = loadJSONObject("sprites/piecesSprite.json");
  spritesheet = loadImage("sprites/pieces.png");
  JSONArray piecesPosition = spritedata.getJSONArray("pieces");
  for (int j = 0; j < 2; j++){          //j = 0: white; j = 1: black
    for (int i = 0; i < 6; i++){
      JSONObject piece = piecesPosition.getJSONObject(i + j*6);
      JSONObject pos = piece.getJSONObject("position");
      int x = pos.getInt("x");
      int y = pos.getInt("y");
      int w = pos.getInt("w");
      int h = pos.getInt("h");
      PImage img = spritesheet.get(x, y, w, h);
      piecesImageArray[j][i] = img;
    }
  }
  // Dictionary for FEN
  
  
  piecesFromSymbol = new IntDict();
  piecesFromSymbol.set("k", pieceInfo.black | pieceInfo.king);  piecesFromSymbol.set("K", pieceInfo.white | pieceInfo.king);
  piecesFromSymbol.set("q", pieceInfo.black | pieceInfo.queen); piecesFromSymbol.set("Q", pieceInfo.white | pieceInfo.queen);
  piecesFromSymbol.set("b", pieceInfo.black | pieceInfo.bishop);piecesFromSymbol.set("B", pieceInfo.white | pieceInfo.bishop);
  piecesFromSymbol.set("n", pieceInfo.black | pieceInfo.knight);piecesFromSymbol.set("N", pieceInfo.white | pieceInfo.knight);
  piecesFromSymbol.set("r", pieceInfo.black | pieceInfo.rook);  piecesFromSymbol.set("R", pieceInfo.white | pieceInfo.rook);
  piecesFromSymbol.set("p", pieceInfo.black | pieceInfo.pawn);  piecesFromSymbol.set("P", pieceInfo.white | pieceInfo.pawn);
  
  // PieceArray
  fen.loadFen();
  for (int file = 0; file < 8; file++){
    for (int rank = 0; rank < 8; rank++){
      if (board.squareInfo[file + rank*8] != 0){
        pieces.add(new Piece(file, rank));
      }
    }
  }
  
}


void draw(){
  drawChessBoard();
  fen.loadFen();
  arrr.clear();
  board.readBoard(board.squareInfo);

  println(arrr.size());
}

// Creating chessboard----------------------------------------------

void drawChessBoard(){
  for (int file = 0; file < 8; file++){
    for (int rank = 0; rank < 8; rank++){
      boolean isLightSquare = (file + rank) % 2 != 0;
      
      color squareColor = isLightSquare ? lightColor : darkColor;
      PVector position = new PVector(file*l, h - (rank*l + l));
      drawSquare(squareColor, position);
    }
  }
}

void drawSquare(color c, PVector v){
  push();
  fill(c); noStroke();
  rect(v.x, v.y, l, l);
  pop(); 
}
