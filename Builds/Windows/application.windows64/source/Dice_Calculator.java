import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Dice_Calculator extends PApplet {

// Enable for Mobile Build
//import android.app.Activity;
//import android.view.WindowManager;
//import android.view.View;
//import android.os.*;
 
//Activity act;
//View decorView;
//int uiOptions;
 
//@ Override
//public void onCreate(Bundle savedInstanceState) {
//  super.onCreate(savedInstanceState);
//  act = this.getActivity();
//  uiOptions = View.SYSTEM_UI_FLAG_VISIBLE;
//  decorView = act.getWindow().getDecorView();
//  act.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
//  decorView.setSystemUiVisibility(uiOptions);
//}

//float padding = height*0.1;
//float outputwindowheight = height/2;


// Enable for Desktop Build
float outputwindowheight = height/3.5f;
float padding = height*0.025f;


PFont f;
String total = "";
String history = "";
float buttonHeight = 100;
String[] names1 = {"D20", "D10", "D6", "x2"};
String[] names2 = {"D12", "D8", "D4", "+1"};

public void setup() {
  // Enable for Desktop Build
  //size(720, 1280);
  
  
  // Enable for Mobile Build
  //fullScreen();
  
  
  surface.setResizable(true);
  f = createFont("Roboto-Black.ttf", 72);
  textFont(f);
}

 
 public void draw() {
   
   background(0);
  
   //Draw Output Window
   noStroke();
   fill(255);
   rect(0, 0, width, outputwindowheight*10); 
  
   //Draw Centerline
   stroke(255);   
   line(width/2, 0, width/2, height);
   
   //Draw button lines   
   float buttonSpace = height - outputwindowheight*10;
   int numberOfButtons = 4; //Edit this value to add sets of buttons
   buttonHeight = buttonSpace/numberOfButtons;
   for (int i = 0; i < numberOfButtons; i = i+1) { 
     line(0, outputwindowheight*10+buttonHeight*i, width, outputwindowheight*10+buttonHeight*i);
   }
   
   //Draw Button Labels
   for (int i = 0; i < 4; i++) {
     textAlign(CENTER, CENTER);
     fill(255);
     textSize(height*0.075f); 
     text(names1[i], width/4, outputwindowheight*10+buttonHeight*i+buttonHeight/2);
     text(names2[i], width - width/4, outputwindowheight*10+buttonHeight*i+buttonHeight/2); 
   }

   //Draw Output Text
   textAlign(LEFT, TOP);
   textSize(outputwindowheight*5);
   fill(0);
   text(total, padding*3, padding*3);
   
   //Draw History Text
   textAlign(LEFT);
   fill(150);
   textSize(outputwindowheight*1.25f); 
   text(history, padding, outputwindowheight*10-outputwindowheight*5, width-padding, outputwindowheight*5);
   
   //Draw Clear Text
   textAlign(RIGHT);
   fill(150);
   textSize(outputwindowheight-4); 
   text("CLEAR", width-padding*4,padding*10);
  
}
   
public void mousePressed() {
  //Button(1,1) D20
  if (mouseX < width/2 && mouseY > outputwindowheight*10 && mouseY < outputwindowheight*10+buttonHeight) {
    float D20 = random(1,21);
    int roll = PApplet.parseInt(D20);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D20:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,1) D12
  if (mouseX > width/2 && mouseY > outputwindowheight*10 && mouseY < outputwindowheight*10+buttonHeight) {
    float D12 = random(1,13);
    int roll = PApplet.parseInt(D12);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D12:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,2) D10
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight && mouseY < outputwindowheight*10+buttonHeight*2) {
    float D10 = random(1,11);
    int roll = PApplet.parseInt(D10);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D10:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,2) D8
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight && mouseY < outputwindowheight*10+buttonHeight*2) {
    float D8 = random(1,9);
    int roll = PApplet.parseInt(D8);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D8:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,3) D6
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight*2 && mouseY < outputwindowheight*10+buttonHeight*3) {
    float D6 = random(1,7);
    int roll = PApplet.parseInt(D6);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D6:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,3) D4
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight*2 && mouseY < outputwindowheight*10+buttonHeight*3) {
    float D4 = random(1,5);
    int roll = PApplet.parseInt(D4);
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D4:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,4) D8
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight*3 && mouseY < outputwindowheight*10+buttonHeight*4) {
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal * 2;
    total = str(newTotal);
    String output = "x2:"+str(newTotal) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,4) +1
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight*3 && mouseY < outputwindowheight*10+buttonHeight*4) {
    int currentTotal = PApplet.parseInt(total);
    int newTotal = currentTotal + 1;
    total = str(newTotal);
    String output = "+1:"+str(newTotal) + " ";
    history = history + output;
    print(output+"\n");
  }  
  //Clear Button
  if (mouseX > width*0.85f && mouseY < outputwindowheight*2.5f) {
    total = "";
    history = "";
  }  
}
 
  public void settings() {  size(576, 1024);  pixelDensity(displayDensity()); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Dice_Calculator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}