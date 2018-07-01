/*
 * Arduino - Processingシリアル通信
 * Processing側サンプル
 */

import processing.serial.*;
Serial myPort; // シリアルポート
int num = 1;
int[] val = new int[num];
float fillColor;
float diameter;

void setup() {
  size(640, 480);
  // ポート番号とスピードを指定してシリアルポートをオープン
  //println(Serial.list()[3]);
  myPort = new Serial(this, Serial.list()[3], 9600);
  // 改行コード(\n)が受信されるまで、シリアルメッセージを受けつづける
  myPort.bufferUntil('\n');
}

void draw() {
  // 受信したセンサーの値で円を描画
  background(0);
  fill(200);
  //println(fillColor);
  ellipse(width/2, height/2, val[0], val[0]);
}

void serialEvent(Serial myPort) { 
  // シリアルバッファーを読込み
  //println(myPort);
  //String myString = myPort.readStringUntil('\n');
  if(myPort.available() > num*2-1){
    //for(int i=0; i<num; i++){
      if(myPort.read() == 'H'){
      //int val_high = myPort.read();
      //println(val_high);
      //int val_low = myPort.read();
      //println(val_low);
      //println(val_low);
      //val[0] = (val_high*256) + val_low;
      val[0] = myPort.read();
      if(0 == num-1){
        myPort.write(255);
      }
     }
    //}
    
  }
//  println(val[0]);
  // 空白文字など余計な情報を消去
  //myString = trim(myString);
  //int sensors = int(myString);
  // コンマ区切りで複数の情報を読み込む
  int sensors = val[0];
  println(sensors);
  // 読み込んだ情報の数だけ、配列に格納
  //if (sensors >0) {
    fillColor = map(val[0], 0, 1023, 0, 255);
    diameter = map(val[0], 0, 1023, 0, height);
  //}
  // 読込みが完了したら、次の情報を要求
  
  delay(100);
}

void mousePressed(){
  myPort.clear();
  myPort.write(255);
  println("click");
}
