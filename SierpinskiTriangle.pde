float zoom = 1;
float translate_x = 0;
float translate_y = 0;

public void setup() {
  size(500, 500);
}

public void draw() {
  background(color(0xff, 0xff, 0xff));
  System.out.println("draw");
  sierpinski(
    0,
    0,
    50
  );
}

public void sierpinski(float x, float y, float len) {
  float zlen = len * zoom;
  if (x + zlen / 2 + 10 * zoom < -width / 2 - translate_x ||
      x - zlen / 2 - 10 * zoom > width / 2 - translate_x ||
      y + zlen / (2 * sqrt(3)) + 10 * zoom < -height / 2 - translate_y ||
      y - zlen / sqrt(3) - 10 * zoom > height / 2 - translate_y) {
    return;
  }
  float start_x = x + width / 2 + translate_x;
  float start_y = y + height / 2 + translate_y;
  if (zlen <= 1) {
    point(
      start_x,
      start_y
    );
  }
  else if (zlen <= 3) {
    triangle(
      start_x,
      start_y - zlen / sqrt(3),
      start_x - zlen / 2,
      start_y + zlen / (2 * sqrt(3)),
      start_x + zlen / 2,
      start_y + zlen / (2 * sqrt(3))
    );
  }
  else {
    sierpinski(
      x,
      y - zlen * (sqrt(3) / 4),
      len / 2
    );
    sierpinski(
      x - zlen * (3.0 / 8),
      y + zlen * (sqrt(3) / 8),
      len / 2
    );
    sierpinski(
      x + zlen * (3.0 / 8),
      y + zlen * (sqrt(3) / 8),
      len / 2
    );
  }   
}

public void mouseDragged() {
  int x_dist = mouseX - pmouseX;
  int y_dist = mouseY - pmouseY;
  translate_x += x_dist;
  translate_y += y_dist;
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      translate_x *= (zoom + 0.05) / zoom;
      translate_y *= (zoom + 0.05) / zoom;
      zoom += 0.05;
    }
    if (keyCode == DOWN) {
      translate_x *= (zoom - 0.05) / zoom;
      translate_y *= (zoom - 0.05) / zoom;
      zoom -= 0.05;
    }
  }
}
