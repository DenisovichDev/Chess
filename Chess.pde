color lightColor = color(241, 217, 192);
color darkColor = color(169, 122, 101);
int h = 600;
int l = h/8;

PImage spritesheet;
JSONObject spritedata;
PImage[][] piecesImageArray;


IntDict piecesFromSymbol;


void setup(){
  size(600, 600);
  
  //creating sprite array
  
  piecesImageArray = new PImage[2][6];
  spritedata = loadJSONObject("sprites/pieces.json");
  spritesheet = loadImage("sprites/pieces.png");
  JSONArray pieces = spritedata.getJSONArray("pieces");
  for (int j = 0; j < 2; j++){          //j = 0: white; j = 1: black
    for (int i = 0; i < 6; i++){
      JSONObject piece = pieces.getJSONObject(i + j*6);
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
  piecesFromSymbol.set("k", piece.black | piece.king);  piecesFromSymbol.set("K", piece.white | piece.king);
  piecesFromSymbol.set("q", piece.black | piece.queen); piecesFromSymbol.set("Q", piece.white | piece.queen);
  piecesFromSymbol.set("b", piece.black | piece.bishop);piecesFromSymbol.set("B", piece.white | piece.bishop);
  piecesFromSymbol.set("n", piece.black | piece.knight);piecesFromSymbol.set("N", piece.white | piece.knight);
  piecesFromSymbol.set("r", piece.black | piece.rook);  piecesFromSymbol.set("R", piece.white | piece.rook);
  piecesFromSymbol.set("p", piece.black | piece.pawn);  piecesFromSymbol.set("P", piece.white | piece.pawn);
  
  
  
}


  
  

void draw(){
  drawChessBoard();
  fen.loadFen();

  board.readBoard(board.squareInfo);

  
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
