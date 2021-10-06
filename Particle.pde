class Particle{
  PVector pos, dir;
  final float size, lifeStart;
  float life;
  
  Particle(PVector _pos, PVector _dir, float _size, float _life){
    pos = _pos;
    dir = _dir;
    size = _size;
    life = lifeStart = _life;
  }
  
  void display(){
    fill(255, map(life, 0, lifeStart, 0, 40));
    circle(pos.x, pos.y, size);
  }
  
  void move(){
    pos.add(dir);
    life -= abs(dir.x) + abs(dir.y);
  }
  
  boolean isDead(float _r){
    return dist(pos.x, pos.y, width/2, height/2) < _r-size || life <= 0 || (abs(dir.x) < 1 && abs(dir.y) < 1);
  }
}
