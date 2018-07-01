import processing.opengl.*;
import java.util.Calendar;

PImage img;
int counter=0;
int DETAIL = 100;
float xoff = 0.0;
float xoff2 = 0.0;

boolean[][] board;      /* 現在の状態を保存する変数 */
boolean[][] temp_board; /* 次の状態を保存する変数 */
int NX = 10;
int NY = 10;
int w = 25;
String now;

// セットアップ
void setup(){
    now = timestamp();
   img = loadImage("data/koume_phase02.png"); 
   size(1000,1500,P3D);
   colorMode(HSB,360,100,100,100);
   noStroke();
  board = new boolean[NX][NY];
  temp_board = new boolean[NX][NY];
  for (int i = 0; i < NX; i++ ){
    for (int j = 0; j < NY; j++ ){
      board[i][j] = int(random(2)) == 0 ;
    }
  }
    

  frameRate(10);
}

// 描画
void draw(){
  image(img,0,0);
  step();
  
  for (int i = 0; i < NX; i++ ) {
    for (int j = 0; j < NY; j++ ) {
      /* board[i][j]がtrueすなわち生きている場合描画 */
      if ( board[i][j] ){
        color c = img.get(120+i*w+w/2,650+j*w+w/2);
        fill(c);
        rect(120+i*w, 650+j*w, w, w);
      }
    }
  }
  saveFrame(now+"/####.png");
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

void step() {
  /* temp_boardにとりあえずその後の状態を保存 */
  for (int i = 0; i < NX; i++ ) 
    for (int j = 0; j < NY; j++ ) 
      temp_board[i][j] = is_alive(i, j);
      
  /* ボードをコピー */
  for (int i = 0; i < NX; i++ ) 
    for (int j = 0; j < NY; j++ ) 
      board[i][j] = temp_board[i][j];
}

boolean is_alive(int x, int y) {
  int count = 0;
  
  /* 周囲8マスを見る */
  for (int i = -1; i <= 1; i++ ) 
    for (int j = -1; j <= 1; j++ ) 
      if ( in_range(x+i, y+j) )
        if ( i != 0 || j != 0 )
          if ( board[x+i][y+j] )
            count++;

  
  if ( board[x][y] && ( count == 2 || count == 3 ) )
    return true;/* 生きていて周りに友達がいるから生き残れる */
  else if ( board[x][y] == false && count == 2 )
    return true;/* それなりに人がいるから新しい子供が生まれる */
  else 
    return false;/* それ以外は生き残れない */
}

boolean in_range(int x, int y) {
  if ( x < 0 || x >= NX || y < 0 || y >= NY )
    return false;
  return true;
}

void edit_board() {
  int x = mouseX * NX / width;
  int y = mouseY * NY / height;

  if ( in_range(x, y) )
    board[x][y] = !board[x][y];
}