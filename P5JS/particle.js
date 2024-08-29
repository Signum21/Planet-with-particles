class Particle{
  constructor(_pos, _dir, _size, _life) {
      this.pos = _pos;
      this.dir = _dir;
      this.size = _size;
      this.life  = _life;
      this.lifeStart = _life;
  }

  display() {
      fill(255, map(this.life, 0, this.lifeStart, 0, 40));
      circle(this.pos.x, this.pos.y, this.size);
  }

  move() {
    this.pos.add(this.dir);
    this.life -= abs(this.dir.x) + abs(this.dir.y);
  }

  isDead(_r) {
      if (dist(this.pos.x, this.pos.y, width/2, height/2) < _r - this.size || this.life <= 0 || (abs(this.dir.x) < 1 && abs(this.dir.y) < 1)) {
          return true;
      }
      return false;
  }
}