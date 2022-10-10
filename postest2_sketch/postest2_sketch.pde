// mendefinisikan varibale 
float x;
float size  =  65;

void setup(){
  size(1000, 600); //Untuk Mengatur Ukuran Canvasnya;
}

void draw(){ //menjalnkan perintah secara berulang

  background(#B7E7FF); //latar canvas warma biru muda;

  textSize(20); //Untuk Mengatur Ukuran Text;
  fill(#501C07);
  text("Asyhab Ramadhan", 70,100); //Isi text dan posisi textnya;
  text("2009106145", 70,128); //Isi text dan posisi textnya;
  
  fill(#E8AE42); //Untuk Mewarnai dalam objek;
  ellipse(920, 70, 100, 100); //Matahari;
  
  x = x + 1; //berguna untuk menentukan kecepatan objek
  translate(100-x, height/2-2*size/0.6); //untuk menggerakan objek secara horizontal dari kanan ke kiri
  
  //Deck Kapal;
  fill(#501C07); //Untuk Mewarnai dalam objek;
  noStroke(); //Untuk menonaktifkan warna pada garis;
  quad(350,350, 700,350, 650,400, 420,400);
  
  fill(#98350E); //Warna Coklat;
  rect(420,250, 6,100); //Tiang Pendek;
  ellipse(423,250, 10,10);
  rect(500,150, 6,200); //Tiang Panjang;
  ellipse(503,150, 10,10);
  
  fill(#B9ACA7); //Warna Abu-Abu;
  triangle(423,250, 480,320, 423,320); //Bendera Kecil;  
  triangle(503,150, 580,320, 503,320); //Bendera Besar;  
  
  //Komponen Rumah;
  fill(#98350E); //Warna Coklat
  rect(605,310, 60,40);  //Rumah;
  fill(#FFFFFF); // Warna Putih;
  rect(620,320, 12,30); //Pintu;
  fill(#FFFFFF); // Warna Putih;
  rect(640,320, 12,12); //Jendela;
  fill(0);  // Warna Hitam;
  triangle(595,310, 635,290, 675,310); // Atap Rumah;

}
