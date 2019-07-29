import com.hamoid.*;

VideoExport videoExport;

void setup() {
  size(1000,1000);
   
  videoExport = new VideoExport(this);
  videoExport.startMovie();

  noFill();
  stroke(255);
  strokeWeight(2);
}

float t = 0;

void draw() {
  background(10,12,100);
  fill(240,244,83);
  
  translate (width / 2, height / 2);
  videoExport.saveFrame();
  
      beginShape();
  
  // add vertices
  for (float theta = 0; theta <= 2 *PI; theta += 0.01) {
    float rad = r(theta,
    2, // a 
    cos(t) * 0.3 + 0.5, // b
    16, // m # of sides
    cos(t) * 0.5 - 0.7, // n1
    sin(t) * 0.8 + 0.5, // n2
    cos(t) * 0.8 + 0.5// n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }
  
  endShape();
  
  fill(80,255,75);
  
      beginShape();
  
  // add vertices
  for (float theta = 0; theta <= 2 *PI; theta += 0.01) {
    float rad = r(theta,
    1, // a 
    cos(t) * 0.3 + 0.6, // b
    8, // m # of sides
    cos(t) * 0.5 - 0.8 , // n1
    sin(t) * 0.5 + 0.5, // n2
    cos(t) * 0.5 + 0.5// n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }
  
  endShape();
  
  fill(255,0,80,255);
  
  beginShape();
  
  // add vertices
  for (float theta = 0; theta <= 2 *PI; theta += 0.01) {
    float rad = r(theta,
    1, // a 
    cos(t) * 0.3 + 0.5, // b
    16, // m # of sides
    cos(t) * 0.5 - 1 , // n1
    sin(t) * 0.5 + 0.5, // n2
    cos(t) * 0.5 + 0.5// n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }
  
  endShape();
  
  fill(255,128,0);
  
    beginShape();
  
  // add vertices
  for (float theta = 0; theta <= 2 *PI; theta += 0.01) {
    float rad = r(theta,
    2, // a 
    cos(t) * 0.3 + 0.5, // b
    12, // m # of sides
    3, // n1
    sin(t) * 0.8 + 0.5, // n2
    cos(t) * 0.8 + 0.5// n3
    );
    float x = rad * cos(theta) * 50;
    float y = rad * sin(theta) * 50;
    vertex(x,y);
  }
  
  endShape();
  
  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m * theta / 4.0) / a) , n2) + 
  pow(abs(sin(m * theta / 4.0) / b) , n3), -1.0 / n1);
}

void keyPressed() {
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
