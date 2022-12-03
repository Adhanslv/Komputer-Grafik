import processing.sound.*;
SoundFile file;

float gerak, gerak1, arah = 0.5, x = -500, y;
float bg1 = 216, bg2= 250, bg3 = 255;
float ap;
float[] hujany = new float[3000];
float [] speed = new float [3000];
PImage img;
PImage img1;
PImage img2;
float camX, camZ = 0;
int cuaca = 2;

void setup() {
  size(1800, 1000, P3D);
  file = new SoundFile(this, "kapalberlayar.mp3");
  file.loop();
  for (int i = 0; i < hujany.length; i++) {
    hujany[i] = random(height);
    speed [i] = random (3, 9);
  }

  img = loadImage("jangkar.png");
  img1 = loadImage("pohon.png");
  img2 = loadImage("rumput.png");
}

void draw() {
  lights();

  if (cuaca == 2) {
    background(bg1, bg2, bg3);
    ap = 255;
    fill(ap);
    bahan();
    cerah();
  } else if (cuaca == 3) {
    background(44, 141, 175);
    ap = 70;
    fill(ap);
    bahan();
    hujan();
  } else if (cuaca == 1) {
    background(0, 67, 90);
    ap = 120;
    fill(ap);
    bahan();
    malam();
  }

  if (cuaca == 2) {
    cuaca = 2;
  } else if (cuaca > 2) {
    cuaca = 3;
  } else if (cuaca < 2 ) {
    cuaca = 1;
  }

  if (key == 'c' || key == 'C') {   //CERAH
    cuaca = 2;
  } else if (key == 'h' || key == 'H') {    //HUJAN
    cuaca = 3;
  } else if (key == 'm' || key == 'M') {    //MALAM
    cuaca = 1;
  }

  camera(width/2.0, height/2.0, 833+camZ, //default camera position without 360 degree
    width/2.0+camX, height/2.0, 0, //where it is looking to
    0, 1, 0); //eye openness

  if (camX <= -100) {
    camX = -100;
  }

  if (camX >= 100) {
    camX = 100;
  }

  if (camZ <= -100) {
    camZ = -100;
  }

  if (camZ >= 200) {
    camZ = 200;
  }

  if (key == ',') {   // LEFT
    camX --;
  } else if (key == '.') {    // RIGHT
    camX++;
  } else if (key == 'z') {    // ZOOM
    camZ++;
  } else if (key == 'x') {    // UNZOOM
    camZ--;
  }
}

void bahan() {

  awan(-250, -50);
  awan(50, 50);
  awan(350, 70);
  awan(725, -70);
  laut();
  gunung();
  kapal2();
  burung(-250, -50); //1 dari kiri
  burung(100, 0); // 2 dari kiri
  burung(500, 70); // 3 dari kiri
  burung(700, -80); // 3 dari kiri
}

void cerah() {
  noStroke();
  fill(255, 237, 33);
  pushMatrix();
  pointLight(100, 100, 100, 1, 0, 0);
  translate(1780, 0, -100);
  sphere(50);
  popMatrix();
}

void malam() {
  directionalLight(100, 100, 100, 1, 0, 0);
  noStroke();
  fill(255, 255, 255);
  pushMatrix();
  translate(1700, 100, -100);
  sphere(50);
  popMatrix();
}

//====================================================================================//

void kapal2() {
  strokeWeight(1);
  stroke(0);

  pushMatrix();
  translate(1500, 0);
  rotateX(radians(0));
  rotateY(radians(180));

  pushMatrix();
  translate(x, y);

  if (x >= width ) {
    x = -1400;
  }

  if (x <= -width) {
    x = 1500;
  }

  //batas pergerakan
  if (y <=0) {
    y = 0;
  }

  if (y >= height - 600) {
    y = 400;
  }


  //arah dengan keypress
  if (key == 'W' || key == 'w' || key == '8' || keyCode == UP) {
    y --;
  }
  if (key == 'A' || key == 'a' || key == '4' || keyCode == LEFT) {
    x ++;
  }
  if (key == 'S' || key == 's' || key == '2' || keyCode == DOWN) {
    y ++;
  }
  if (key == 'D' || key == 'd' || key == '6' || keyCode == RIGHT) {
    x --;
  }

  for (int i=-10; i<0; i++) {
    pushMatrix();
    translate(0, 0, i);
    beginShape();
    fill(255);
    //badan kapal bawah
    vertex(120, 400);
    vertex(200, 600);
    vertex(900, 600);
    vertex(950, 450);
    vertex(550, 450);
    vertex(450, 400);
    vertex(120, 400);
    endShape();

    beginShape();
    //badan kapal atas lt1
    vertex(190, 400);
    vertex(270, 300);
    vertex(830, 300);
    vertex(910, 450);
    vertex(550, 450);
    vertex(450, 400);
    vertex(120, 400);
    endShape();

    beginShape();
    //badan kapal atas lt2
    vertex(270, 300);
    vertex(350, 200);
    vertex(740, 200);
    vertex(800, 300);
    endShape();

    beginShape();
    //badan dek kapal atas lt3
    vertex(370, 200);
    vertex(410, 120);
    vertex(510, 120);
    vertex(520, 200);
    endShape();

    beginShape();
    //cerobong kiri
    vertex(540, 200);
    vertex(560, 110);
    vertex(610, 120);
    vertex(630, 200);
    //vertex(550, 450);
    //vertex(450, 400);
    //vertex(120, 400);
    endShape();

    beginShape();
    //cerobong kanan
    vertex(640, 200);
    vertex(660, 110);
    vertex(710, 120);
    vertex(730, 200);
    //vertex(550, 450);
    //vertex(450, 400);
    //vertex(120, 400);
    endShape();

    beginShape();
    fill(255, 0, 0);
    //badan kapal bawah MERAH
    vertex(184, 560);
    vertex(200, 600);
    vertex(900, 600);
    vertex(913, 560);
    vertex(184, 560);
    endShape();

    beginShape();
    //jendela kapal lt1
    fill(8, 189, 252);
    vertex(206, 380);
    vertex(254, 320);
    vertex(841, 320);
    vertex(873, 380);
    endShape(CLOSE);
    for (int j = 300; j < 900; j += 100) {
      line(j, 320, j, 379);
    }

    beginShape();
    //jendela kapal lt2
    vertex(286, 280);
    vertex(334, 220);
    vertex(752, 220);
    vertex(788, 280);
    endShape(CLOSE);
    for (int j = 400; j < 800; j += 100) {
      line(j, 220, j, 279);
    }

    beginShape();
    //jendela kapal lt3
    vertex(375, 190);
    vertex(405, 130);
    vertex(480, 130);
    vertex(480, 190);
    endShape(CLOSE);
    line(450, 130, 450, 189);

    beginShape();
    //Cerobong kiri merah
    fill(255, 0, 0);
    vertex(550, 160);
    vertex(556, 130);
    vertex(613, 130);
    vertex(620, 160);
    endShape();

    beginShape();
    //Cerobong kanan merah
    fill(255, 0, 0);
    vertex(650, 160);
    vertex(656, 130);
    vertex(713, 130);
    vertex(720, 160);
    endShape();


    //jendela kapal bulat
    fill(0);
    for (int j = 270; j <= 900; j+= 80) {
      ellipse(j, 500, 20, 20 );
    }

    // jangkar
    fill(220);
    ellipse(200, 430, 35, 25);

    img.resize(0, 20);
    image(img, 190, 420);
    popMatrix();
  }
  popMatrix();
  popMatrix();


  //======================================================================================//
}

void laut() {
  //laut;
  noStroke();
  fill(#4D72FF);
  rect(-450, 600, 3000, 1000);
}

void gunung() {
  noStroke();
  //gerak = gerak + 3;
  gerak = gerak - 3;

  pushMatrix();
  translate(gerak, 0);

  if (gerak <= -4000 ) {
    gerak = 2200;
  }

  fill(110, 198, 10);
  //gunung kecil
  beginShape();
  vertex(-50, 600);
  //vertex(-50, 600);
  vertex(145, 470);
  vertex(170, 470);
  vertex(245, 410);
  vertex(290, 420);
  vertex(335, 410);
  vertex(390, 475);
  vertex(750, 600);
  endShape();

  //gunung besar
  beginShape();
  vertex(510, 600);
  vertex(755, 505);
  vertex(895, 470);
  vertex(922, 492);
  vertex(992, 484);
  vertex(1242, 400);
  vertex(1341, 319);
  vertex(1441, 319);
  vertex(1486, 340);
  vertex(1524, 333);
  vertex(1560, 343);
  vertex(1596, 340);
  vertex(1697, 443);
  vertex(1772, 470);
  vertex(1900, 600);
  endShape();

  //gunung kecil2
  beginShape();
  vertex(1850, 600);
  vertex(1995, 470);
  vertex(2020, 470);
  vertex(2095, 410);
  vertex(2140, 420);
  vertex(2185, 410);
  vertex(2240, 475);
  vertex(2600, 600);
  endShape();

  //gunung besar2
  beginShape();
  vertex(2350, 600);
  vertex(2595, 505);
  vertex(2735, 470);
  vertex(2762, 492);
  vertex(2832, 484);
  vertex(3082, 400);
  vertex(3181, 319);
  vertex(3281, 319);
  vertex(3326, 340);
  vertex(3364, 333);
  vertex(3390, 343);
  vertex(3426, 340);
  vertex(3527, 443);
  vertex(3602, 470);
  vertex(3730, 600);
  endShape();

  pohon();
  rumput();

  popMatrix();
}

void hujan() {
  strokeWeight(1);
  pushMatrix();
  translate(0, 0, 10);
  for (int i = 0; i < hujany.length; i++) {
    hujany[i] = hujany[i] + speed [i];
    float hujanX = width * i*2 / hujany.length;
    line(hujanX-400, hujany[i], hujanX-400, hujany[i]+15);
    hujany[i]++;

    if (hujany[i]> height+200) {
      hujany[i] = -200;
    }

    if (hujanX <= width) {
      hujanX = -400;
    }
  }
  popMatrix();
}

void pohon() {
  img1.resize(0, 50);
  for (int i = 30; i <= 3640; i += 50) {
    image(img1, i, 550);
  }
}

void rumput() {
  img2.resize(0, 20);
  for (int i = -40; i <= 3670; i += 50) {
    image(img2, i, 580);
  }
}

void awan(int xb, int yb) {
  gerak1 = gerak1 + arah;
  noStroke();
  fill(ap);
  pushMatrix();
  translate(xb+gerak1, yb, -40);
  if (gerak1 >= width+400 || gerak1 <= -1800) {
    arah *=-1;
  }

  for (int i = 0; i < 80; i+=40) {
    // Awan Atas
    pushMatrix();
    translate(440+i, 170, 0);
    sphere(40);
    popMatrix();
    pushMatrix();
    translate(480+i, 160, 0);
    sphere(40);
    popMatrix();
    pushMatrix();
    translate(520+i, 165, 0);
    sphere(40);
    popMatrix();
    // Awan Tengah
    pushMatrix();
    translate(420+i, 195, 0);
    sphere(40);
    popMatrix();
    pushMatrix();
    translate(485+i, 190, 0);
    sphere(45);
    popMatrix();
    pushMatrix();
    translate(545+i, 185, 0);
    sphere(40);
    popMatrix();
    // Awan bawah
    pushMatrix();
    translate(450+i, 210, 0);
    sphere(40);
    popMatrix();
    pushMatrix();
    translate(490+i, 220, 0);
    sphere(40);
    popMatrix();
    pushMatrix();
    translate(530+i, 215, 0);
    sphere(40);
    popMatrix();
  }
  popMatrix();
}

void burung(int xb, int yb) {
  noFill();
  stroke(50);
  strokeWeight(2);
  pushMatrix();
  translate(-800+mouseX+xb, -300+mouseY+yb, 10);

  // Sayap Kiri
  beginShape();
  curveVertex(400, 400);
  curveVertex(425, 300);
  curveVertex(475, 310);
  curveVertex(500, 400);
  endShape();
  // Sayap Kanan
  beginShape();
  curveVertex(450, 400);
  curveVertex(475, 310);
  curveVertex(525, 300);
  curveVertex(550, 400);
  endShape();
  // kaki burung
  beginShape();
  curveVertex(450, 330);
  curveVertex(455, 312);
  curveVertex(495, 312);
  curveVertex(500, 330);
  endShape();
  popMatrix();
}
