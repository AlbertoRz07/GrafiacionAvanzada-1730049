import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
PImage comica;

void setup() {
  
size(640, 480);

comica = loadImage("dog.png");

video = new Capture(this, 640, 480, "DroidCam Source 3");
opencv = new OpenCV(this, 640, 480);
opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);

video.start();

}

void draw() {
  
scale(2);
opencv.loadImage(video);
image(video, 0, 0 );

noFill();
stroke(0, 255, 0);
strokeWeight(3);
Rectangle[] faces = opencv.detect();
println(faces.length);

for (int i = 0; i < faces.length; i++) {
  println(faces[i].x + "," + faces[i].y);
  rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  image(comica,faces[i].x, faces[i].y, faces[i].width, faces[i].height);
}

}

void captureEvent(Capture c) {
  
  c.read();
  
}
