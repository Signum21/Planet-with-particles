PGraphics stars, planet;
ArrayList<Particle> particles = new ArrayList<Particle>();
float cX, cY, r;
  
void createStars(){
  stars = createGraphics(width, height); 
  stars.beginDraw();
  stars.noStroke();

  for(int a = 0; a < 1000; a++){
    stars.fill(random(0, 255));
    stars.circle(random(0, width), random(0, height), random(0, 5));
  }
  stars.endDraw();
}

void createPlanet(){
  float rT, pX, pY;
  cX = width/2;
  cY = height/2;
  r = (width-200)/2;
  planet = createGraphics(width, height);
  planet.beginDraw();

  planet.fill(0);
  planet.noStroke();
  planet.circle(cX, cY, r*2);  

  planet.noFill();
  planet.stroke(255, 5);
  
  for(float a = 0; a <= 360; a += 0.5){ 
    for(int b = 0; b < 5; b++){
      rT = random(0, r);
      pX = cX + rT * cos(radians(a));
      pY = cY + rT * sin(radians(a));
      planet.circle(pX, pY, r*2-rT*2);
    }
  }
  planet.endDraw();
}

void setup(){
  size(700, 700, P2D);
  noStroke();
  createStars();
  createPlanet();
}

void draw(){
  background(0);
  image(stars, 0, 0);
  addParticles();
  displayParticles();  
  image(planet, 0, 0);
}

void addParticles(){
  final float rP = 15;
  float _pX, _pY;

  for(float a = 0; a < 360; a++){
    _pX = cX + (r-rP) * cos(radians(a));
    _pY = cY + (r-rP) * sin(radians(a));
    particles.add(new Particle(new PVector(_pX, _pY), new PVector(random(-2, 2.1), random(-2, 2.1)), rP, 80));
  }
}

void displayParticles(){
  for(int a = particles.size()-1; a >= 0 ; a--){
    particles.get(a).display();
    particles.get(a).move();
    
    if(particles.get(a).isDead(r)){
      particles.remove(a);
    }
  }
}