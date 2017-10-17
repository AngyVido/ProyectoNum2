class particula{
  float x,y,v,a,t,w;
  //dx,dy;
  float px=sin(x);
  float py= cos(y);
  color c;

particula(float x_,float y_, float v_, float a_, float t_, color c_){
  x = x_;
  y = y_;
  v = v_;
  a = a_;
  t = t_;
  c = c_;
}
  particula(){
    x = random(400);
    y = random (400);
    v = random (10);
    a = random (TWO_PI);
    t = random (1,30);
    c = color (random (255), random (100), random(100));
    w=random(10);
    
  }
  
  particula(float x_, float y_){
    x = x_;
    y = y_;
    v = random (3);
    a = random (TWO_PI);
    t = random (50,100);
    c = color (random (80), random (50), random(100));
    
  }

 void display(){
  pushMatrix();
  translate(x,y);
  noStroke();
  fill(c);
  ellipse(0,0,t,t);
  popMatrix();
}

 void movimiento(){
   float sushu=TWO_PI/25;
  x=x+sin(a)*v*sushu;
  y=y+sin(a-90)*w*sushu;
 
if((x<=0)||(x>=700)||(mousePressed)){
      v*=-1;
    }
if((y<=0)||(y>=450)||(mousePressed)){
      w*=-1;
}
    }
   void rebotar(){
    if (y<=0){
      v*= a;
    }
    if (y>=700){
      v*= a;
    }
    if (x<=0){
      v*= a;
    }
    if (x>=450){
      v *= a;
    }    
 }
  
}