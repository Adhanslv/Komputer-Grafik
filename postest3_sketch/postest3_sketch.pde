// mendefinisikan varibale
float x;
float size  =  65;

void setup() {
  size(1000, 600); //Untuk Mengatur Ukuran Canvasnya;
}

void draw() { //menjalnkan perintah secara berulang

  int waktu; //Mendefiniskan variabel waktu;
  waktu = second()*12; //Deklarasi variabel;

  background(#B7E7FF); //latar canvas warma biru muda;

  textSize(20); //Untuk Mengatur Ukuran Text;
  fill(#501C07); //Warna Hitam; 
  text("Asyhab Ramadhan", 30, 65); //Isi text dan posisi textnya;
  text("2009106145", 30, 89); //Isi text dan posisi textnya;

  fill(#E8AE42); //Untuk Mewarnai dalam objek;
  ellipse(920, 70, 100, 100); //Matahari;
  
  //awan
  noStroke();
  fill(255);
  ellipse(100+10+waktu, 160,75,45);
  ellipse(150+10+waktu, 160,85,65);
  ellipse(200+10+waktu, 160,70,45);

  //buat gunung
  beginShape(); //Untuk mengawali pembuatan objek;
  //gunung kanan
  fill(#1FD867); //Untuk mewarnai dalam garis;
  curveVertex(0, 400); //curveVertex(x, y);
  curveVertex(0, 400);
  curveVertex(250, 100);
  curveVertex(500, 400);
  curveVertex(500, 400);
  endShape(); //Untuk mengakhiri/penutup objek;

  beginShape(); //Untuk mengawali pembuatan objek;
  //gunung kiri
  fill(#1FD867);
  curveVertex(500, 400); //curveVertex(x, y);
  curveVertex(500, 400);
  curveVertex(750, 100);
  curveVertex(1000, 400);
  curveVertex(1000, 400);
  endShape(); //Untuk mengakhiri/penutup objek;

  //pohon
  for (int i = 0; i< 961; i+=80) { //jika kurang dari 961 , maka i+=80;
    noStroke(); //Untuk menonaktifkan warna pada garis;
    fill(#5F3603); // Warna Coklat;
    rect(12+i, 320, 10, 80); //Batang Pohon
    fill(#038301); // Warna Hijau;
    triangle(20+i, 270, 40+i, 320, -10+i, 320); //Daun atas;
    triangle(20+i, 295, 40+i, 345, -10+i, 345); //Daun Tengah;
    triangle(20+i, 320, 40+i, 370, -10+i, 370); //Daun Bawah
  }

  //laut;
  noStroke();
  fill(#4D72FF);
  rect(0, 400, 1000, 1000);

  x = x + 1; //berguna untuk menentukan kecepatan objek
  translate(100-x, height/2-2*size/0.6); //untuk menggerakan objek secara horizontal dari kanan ke kiri

  //Deck Kapal;
  fill(#501C07); //Untuk Mewarnai dalam objek;
  noStroke(); //Untuk menonaktifkan warna pada garis;
  quad(350, 350, 700, 350, 650, 400, 420, 400);

  fill(#98350E); //Warna Coklat;
  rect(420, 250, 6, 100); //Tiang Pendek;
  ellipse(423, 250, 10, 10);
  rect(500, 150, 6, 200); //Tiang Panjang;
  ellipse(503, 150, 10, 10);

  fill(#B9ACA7); //Warna Abu-Abu;
  triangle(423, 250, 480, 320, 423, 320); //Bendera Kecil;
  triangle(503, 150, 580, 320, 503, 320); //Bendera Besar;

  //Komponen Rumah;
  fill(#98350E); //Warna Coklat
  rect(605, 310, 60, 40);  //Rumah;
  fill(#FFFFFF); // Warna Putih;
  rect(620, 320, 12, 30); //Pintu;
  fill(#FFFFFF); // Warna Putih;
  rect(640, 320, 12, 12); //Jendela;
  fill(0);  // Warna Hitam;
  triangle(595, 310, 635, 290, 675, 310); // Atap Rumah;
}
