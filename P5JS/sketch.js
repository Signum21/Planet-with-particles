var stars, planet;
var particles;
var cX, cY, r;

function initializeFields() {
    stars = null;
    planet = null;
    particles = [];
    cX = 0;
    cY = 0;
    r = 0;
}

function setup() {
    initializeFields();
    createCanvas(700, 700);

    stars = createGraphics(width, height);
    stars.noStroke();

    for (let a = 0; a < 1000; a++) {
        stars.fill(random(0, 255));
        stars.circle(random(0, width), random(0, height), random(0, 5));
    }

    let rT, pX, pY;
    cX = width / 2;
    cY = height / 2;
    r = (width - 200) / 2;
    planet = createGraphics(width, height);
    planet.fill(0);
    planet.noStroke();
    planet.circle(cX, cY, r * 2);
    planet.noFill();
    planet.stroke(255, 5);

    for (let a = 0; a <= 360; a += 0.5) {
        for (let b = 0; b < 5; b++) {
            rT = random(0, r);
            pX = cX + rT * cos(radians(a));
            pY = cY + rT * sin(radians(a));
            planet.circle(pX, pY, r * 2 - rT * 2);
        }
    }
    noStroke();
}

function draw() {
    background(0);
    image(stars, 0, 0);
    const rP = 15;
    let _pX, _pY;

    for (let a = 0; a < 360; a+=2) {
        _pX = cX + (r - rP) * cos(radians(a));
        _pY = cY + (r - rP) * sin(radians(a));
        particles.push(new Particle(createVector(_pX, _pY), createVector(random(-2, 2.1), random(-2, 2.1)), rP, 80));
    }

    for (let a = particles.length - 1; a >= 0; a--) {
        particles[a].display();
        particles[a].move();

        if (particles[a].isDead(r)) {
            particles.splice(a, 1);
        }
    }
    image(planet, 0, 0);
}