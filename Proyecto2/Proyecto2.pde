PImage photo;

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

ArrayList<Boundary> boundaries;
ArrayList<Box> boxes;
ArrayList <particula> particulas;

void setup() {
  size(700,450);
  smooth();
  
   particulas = new ArrayList<particula>();
  
  for (int i=0; i<350; i++){
    particulas.add(new particula());
  }

  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(width/4,height-5,width/2-50,10));
  boundaries.add(new Boundary(3*width/4,height-50,width/2-50,10));
  
  size(700, 450);
  photo = loadImage("reloj.png");
}

void draw() {
  background(255);
  
   
 for(particula p : particulas){
   p.display();
   p.movimiento();
   p.rebotar();
 }

  // We must always step through time!
  box2d.step();

  // Boxes fall from the top every so often
  if (random(1) < 0.2) {
    Box p = new Box(width/2,40);
    boxes.add(p);
  }

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
    }
  }
  
  image(photo, 0, 0);
}

void mousePressed(){
  particula foo = new particula(mouseX, mouseY);
  particulas.add(foo);
}