
int nx=60;
int ny=40;
int r = 10;
boolean[][] dd;
boolean[][] de;
int mode = 0; // 0:edit, 1:erase
boolean run = false;

void setup() {
  size (600, 450);
  frameRate(40);
  dd = new boolean[nx][ny];
  de = new boolean[nx][ny];
  for (int h=0;h<nx;h++) {
    for (int i=0;i<ny;i++) {
      dd[h][i]=false;
      de[h][i]=false;
    }
  }
}

void draw() {
  background(32);
  fill(64);
  text("The Game of Life by 縺ｿ繝ｼ@atsuhiro-me.net", 40, 360);
  noStroke();
  fill(128);
  // mouse
  if (mousePressed) {
    if (mouseY<400) {
      if (mode==0) {
        dd[(int)(mouseX/r)][(int)(mouseY/r)]=true;
      }
      else if (mode==1) {
        dd[(int)(mouseX/r)][(int)(mouseY/r)]=false;
      }
    }
  }
  // calc
  if (run) {
    int u = 0;
    for (int h=1;h<nx-1;h++) {
      for (int i=1;i<ny-1;i++) {
        u=0;
        if (dd[h-1][i-1]) u++;
        if (dd[h-1][i  ]) u++;
        if (dd[h-1][i+1]) u++;
        if (dd[h  ][i-1]) u++;
        if (dd[h  ][i+1]) u++;        
        if (dd[h+1][i-1]) u++;
        if (dd[h+1][i  ]) u++;
        if (dd[h+1][i+1]) u++;
        //
        if (u==3) {
          de[h][i] = true;
        } 
        else if (u==2) {
          de[h][i] = dd[h][i];
        } 
        else {
          de[h][i]= false;
        }
      }
    }
    for (int h=1;h<nx-1;h++) {
      for (int i=1;i<ny-1;i++) {
        dd[h][i] = de[h][i];
      }
    }
  }

  for (int h=0;h<nx;h++) {
    for (int i=0;i<ny;i++) {
      if (dd[h][i]) {
        rect(h*r, i*r, r, r);
      }
    }
  }
  // status
  fill(48);
  rect(10, 400, 100, 40);
  if (run) {
    fill(255, 64, 64);
  } 
  else {
    fill(128);
  }
  text("Run", 40, 430);
  //
  fill(48);
  rect(130, 400, 100, 40);
  fill(128);
  if (mode==0) {
    text("Pencil", 160, 430);
  } 
  else if (mode==1) {
    text("Eraser", 160, 430);
  }
  //
  fill(48);
  rect(250, 400, 100, 40);
  fill(128);
  text("Glider gun", 260, 430);
  //
  fill(48);
  rect(370, 400, 100, 40);
  fill(128);
  text("Spaceship", 390, 430);
  //
  fill(48);
  rect(490, 400, 100, 40);
  fill(128);
  text("Clear", 520, 430);
}

void mouseClicked() {
  if (mouseY>400) {
    if (mouseX<120) {
      run = !run;
    }
    else if (mouseX<240) {
      mode++;
      if (mode==2) mode=0;
    } 
    else {
      for (int h=0;h<nx;h++) {
        for (int i=0;i<ny;i++) {
          dd[h][i]=false;
        }
      }
      if (mouseX<360) {
        int x=4;
        int y=4;
        dd[x   ][y+4]=true;
        dd[x   ][y+5]=true;
        dd[x+1 ][y+4]=true;
        dd[x+1 ][y+5]=true;
        dd[x+10][y+4]=true;
        dd[x+10][y+5]=true;
        dd[x+10][y+6]=true;
        dd[x+11][y+3]=true;
        dd[x+11][y+7]=true;
        dd[x+12][y+2]=true;
        dd[x+12][y+8]=true;         
        dd[x+13][y+2]=true;
        dd[x+13][y+8]=true;
        dd[x+14][y+5]=true;
        dd[x+15][y+3]=true;
        dd[x+15][y+7]=true;
        dd[x+16][y+4]=true;
        dd[x+16][y+5]=true;
        dd[x+16][y+6]=true;
        dd[x+17][y+5]=true;
        dd[x+20][y+2]=true;
        dd[x+20][y+3]=true;
        dd[x+20][y+4]=true;
        dd[x+21][y+2]=true;
        dd[x+21][y+3]=true;
        dd[x+21][y+4]=true;
        dd[x+22][y+1]=true;
        dd[x+22][y+5]=true;
        dd[x+24][y  ]=true;
        dd[x+24][y+1]=true;
        dd[x+24][y+5]=true;
        dd[x+24][y+6]=true;
        dd[x+34][y+2]=true;
        dd[x+34][y+3]=true;
        dd[x+35][y+2]=true;
        dd[x+35][y+3]=true;
      } 
      else if (mouseX<480) {
        int x=1;
        int y=10;
        dd[x  ][y  ]=true;
        dd[x  ][y+2]=true;
        dd[x+1][y+3]=true;
        dd[x+2][y+3]=true;
        dd[x+3][y  ]=true;
        dd[x+3][y+3]=true;
        dd[x+4][y+1]=true;
        dd[x+4][y+2]=true;
        dd[x+4][y+3]=true;
      }
    }
  }
}