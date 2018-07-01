import processing.opengl.*;
import java.util.Calendar;

PImage img;
int counter=0;
int DETAIL = 100;
float xoff = 0.0;
float xoff2 = 0.0;

boolean[][] board_1,board_2;      /* 現在の状態を保存する変数 */
boolean[][] temp_board_1,temp_board_2; /* 次の状態を保存する変数 */
int NX_1 = 10;
int NY_1 = 10;
int NX_2 = 4;
int NY_2 = 6;
int w = 25;
String now;

// セットアップ
void setup(){
    now = timestamp();
   img = loadImage("data/koume_phase02.png"); 
   size(1000,1500,P3D);
   colorMode(HSB,360,100,100,100);
   noStroke();
  board_1 = new boolean[NX_1][NY_1];
  temp_board_1 = new boolean[NX_1][NY_1];
  board_2 = new boolean[NX_2][NY_2];
  temp_board_2 = new boolean[NX_2][NY_2];
  for (int i = 0; i < NX_1; i++ ){
    for (int j = 0; j < NY_1; j++ ){
      board_1[i][j] = int(random(2)) == 0 ;
    }
  }
  for (int i = 0; i < NX_2; i++ ){
    for (int j = 0; j < NY_2; j++ ){
      board_2[i][j] = int(random(2)) == 0 ;
    }
  }
    

  frameRate(10);
}

// 描画
void draw(){
  image(img,0,0);
  step_1();
  step_2();
  
  for (int i = 0; i < NX_1; i++ ) {
    for (int j = 0; j < NY_1; j++ ) {
      /* board[i][j]がtrueすなわち生きている場合描画 */
      if ( board_1[i][j] ){
        color c = img.get(120+i*w+w/2,650+j*w+w/2);
        fill(c);
        rect(120+i*w, 650+j*w, w, w);
      }
    }
  }
  for (int i = 0; i < NX_2; i++ ) {
    for (int j = 0; j < NY_2; j++ ) {
      /* board[i][j]がtrueすなわち生きている場合描画 */
      if ( board_2[i][j] ){
        color c = img.get(350+i*w+w/2,400+j*w+w/2);
        fill(c);
        rect(350+i*w, 400+j*w, w, w);
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

void step_1() {
  /* temp_boardにとりあえずその後の状態を保存 */
  for (int i = 0; i < NX_1; i++ ) 
    for (int j = 0; j < NY_1; j++ ) 
      temp_board_1[i][j] = is_alive_1(i, j);
      
  /* ボードをコピー */
  for (int i = 0; i < NX_1; i++ ) 
    for (int j = 0; j < NY_1; j++ ) 
      board_1[i][j] = temp_board_1[i][j];
}
void step_2() {
  /* temp_boardにとりあえずその後の状態を保存 */
  for (int i = 0; i < NX_2; i++ ) 
    for (int j = 0; j < NY_2; j++ ) 
      temp_board_2[i][j] = is_alive_2(i, j);
      
  /* ボードをコピー */
  for (int i = 0; i < NX_2; i++ ) 
    for (int j = 0; j < NY_2; j++ ) 
      board_2[i][j] = temp_board_2[i][j];
}

boolean is_alive_1(int x, int y) {
  int count = 0;
  
  /* 周囲8マスを見る */
  for (int i = -1; i <= 1; i++ ) 
    for (int j = -1; j <= 1; j++ ) 
      if ( in_range_1(x+i, y+j) )
        if ( i != 0 || j != 0 )
          if ( board_1[x+i][y+j] )
            count++;

  
  if ( board_1[x][y] && ( count == 2 || count == 3 ) )
    return true;/* 生きていて周りに友達がいるから生き残れる */
  else if ( board_1[x][y] == false && count == 2 )
    return true;/* それなりに人がいるから新しい子供が生まれる */
  else 
    return false;/* それ以外は生き残れない */
}
boolean is_alive_2(int x, int y) {
  int count = 0;
  
  /* 周囲8マスを見る */
  for (int i = -1; i <= 1; i++ ) 
    for (int j = -1; j <= 1; j++ ) 
      if ( in_range_2(x+i, y+j) )
        if ( i != 0 || j != 0 )
          if ( board_2[x+i][y+j] )
            count++;

  
  if ( board_2[x][y] && ( count == 2 || count == 3 ) )
    return true;/* 生きていて周りに友達がいるから生き残れる */
  else if ( board_2[x][y] == false && count == 2 )
    return true;/* それなりに人がいるから新しい子供が生まれる */
  else 
    return false;/* それ以外は生き残れない */
}

boolean in_range_1(int x, int y) {
  if ( x < 0 || x >= NX_1 || y < 0 || y >= NY_1 )
    return false;
  return true;
}
boolean in_range_2(int x, int y) {
  if ( x < 0 || x >= NX_2 || y < 0 || y >= NY_2 )
    return false;
  return true;
}

//void edit_board() {
//  int x = mouseX * NX / width;
//  int y = mouseY * NY / height;

//  if ( in_range(x, y) )
//    board[x][y] = !board[x][y];
//}