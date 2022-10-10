void setup(){
  size(1000, 600); //Untuk Mengatur Ukuran Canvasnya;
}

void draw(){
  textSize(20); //Untuk Mengatur Ukuran Text;
  fill(#501C07);
  text("Asyhab Ramadhan", 70,100); //Isi text dan posisi textnya;
  text("2009106145", 70,128); //Isi text dan posisi textnya;
  
  fill(#501C07);
  noStroke();
  //rect(0,695,800,205);
  
  //Deck Kapal;
  fill(#501C07); //Untuk Mewarnai dalam objek;
  noStroke(); //Untuk menonaktifkan warna pada garis;
  quad(350,350, 700,350, 650,400, 420,400);
  
  fill(#98350E);
  rect(420,250, 6,100); //Tiang Pendek;
  ellipse(423,250, 10,10);
  rect(500,150, 6,200); //Tiang Panjang;
  ellipse(503,150, 10,10);
  
  fill(#B9ACA7);
  triangle(423,250, 480,320, 423,320); //Bendera Kecil;  
  triangle(503,150, 580,320, 503,320); //Bendera Besar;  
  
  //Komponen Rumah;
  fill(#98350E);
  rect(605,310, 60,40);
  fill(#FFFFFF);
  rect(620,320, 12,30); //Pintu;
  fill(#FFFFFF);
  rect(640,320, 12,12); //Jendela;
  fill(#E8AE42);
  ellipse(920, 70, 100, 100); //Matahari;

  fill(#501C07);
  triangle(595,310, 635,290, 675,310);
}
