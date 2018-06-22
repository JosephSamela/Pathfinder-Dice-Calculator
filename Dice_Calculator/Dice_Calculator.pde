PFont f;
String total = "";
String history = "";
float buttonHeight = 100;
String[] names1 = {"D20", "D10", "D6", "D3", "+1"};
String[] names2 = {"D12", "D8", "D4", "x2", "-1"};


// ########################### ENABLE FOR ANDROID ################################
import android.app.Activity;
import android.view.WindowManager;
import android.view.View;
import android.os.*;
Activity act;
View decorView;
int uiOptions;
@ Override
public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  act = this.getActivity();
  uiOptions = View.SYSTEM_UI_FLAG_VISIBLE;
  decorView = act.getWindow().getDecorView();
  act.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
  decorView.setSystemUiVisibility(uiOptions);
}
float padding = height*0.1;
float outputwindowheight = 50;
void setup() { 
  fullScreen();
  // size(720, 1280);
  
  f = createFont("Roboto-Black.ttf", 72);
  textFont(f);
}
// ########################### ENABLE FOR ANDROID ################################


// ########################### ENABLE FOR DESKTOP ################################
//float outputwindowheight = height/3.5;
//float padding = height*0.025;
//void setup() {
//  //size(720, 1280);
//  size(576, 1024);
//  pixelDensity(displayDensity());
//  surface.setResizable(true);
//  f = createFont("Roboto-Black.ttf", 72);
//  textFont(f);
//}
// ########################### ENABLE FOR DESKTOP ################################
 

void draw() {
   
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
   int numberOfButtons = 5; //Edit this value to add sets of buttons
   buttonHeight = buttonSpace/numberOfButtons;
   for (int i = 0; i < numberOfButtons; i = i+1) { 
     line(0, outputwindowheight*10+buttonHeight*i, width, outputwindowheight*10+buttonHeight*i);
   }
   
   //Draw Button Labels
   for (int i = 0; i < 5; i++) {
     textAlign(CENTER, CENTER);
     fill(255);
     textSize(height*0.075); 
     text(names1[i], width/4, outputwindowheight*10+buttonHeight*i+buttonHeight/2);
     text(names2[i], width - width/4, outputwindowheight*10+buttonHeight*i+buttonHeight/2); 
   }

   //Draw Output Text
   textAlign(LEFT, TOP);
   textSize(outputwindowheight*5);
   fill(0);
   text(total, padding*3, padding*4);
   
   //Draw History Text
   textAlign(LEFT);
   fill(150);
   textSize(outputwindowheight*1.25); 
   text(history, padding, outputwindowheight*10-outputwindowheight*5, width-padding, outputwindowheight*5);
   
   //Draw Clear Text
   textAlign(RIGHT, TOP);
   fill(150);
   textSize(outputwindowheight*1.5); 
   text("CLEAR", width-padding,padding);
}

void mousePressed() {
  //Button(1,1) D20
  if (mouseX < width/2 && mouseY > outputwindowheight*10 && mouseY < outputwindowheight*10+buttonHeight) {
    float D20 = random(1,21);
    int roll = int(D20);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D20:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,1) D12
  if (mouseX > width/2 && mouseY > outputwindowheight*10 && mouseY < outputwindowheight*10+buttonHeight) {
    float D12 = random(1,13);
    int roll = int(D12);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D12:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,2) D10
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight && mouseY < outputwindowheight*10+buttonHeight*2) {
    float D10 = random(1,11);
    int roll = int(D10);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D10:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,2) D8
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight && mouseY < outputwindowheight*10+buttonHeight*2) {
    float D8 = random(1,9);
    int roll = int(D8);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D8:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,3) D6
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight*2 && mouseY < outputwindowheight*10+buttonHeight*3) {
    float D6 = random(1,7);
    int roll = int(D6);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D6:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,3) D4
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight*2 && mouseY < outputwindowheight*10+buttonHeight*3) {
    float D4 = random(1,5);
    int roll = int(D4);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D4:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,4) D3
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight*3 && mouseY < outputwindowheight*10+buttonHeight*4) {
    float D3 = random(1,4);
    int roll = int(D3);
    int currentTotal = int(total);
    int newTotal = currentTotal + roll;
    total = str(newTotal);
    String output = "D3:" + str(roll) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(2,4) x2
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight*3 && mouseY < outputwindowheight*10+buttonHeight*4) {
    int currentTotal = int(total);
    int newTotal = currentTotal * 2;
    total = str(newTotal);
    String output = "x2:"+str(newTotal) + " ";
    history = history + output;
    print(output+"\n");
  }
  //Button(1,5) +1
  if (mouseX < width/2 && mouseY > outputwindowheight*10+buttonHeight*4 && mouseY < outputwindowheight*10+buttonHeight*5) {
    int currentTotal = int(total);
    int newTotal = currentTotal + 1;
    total = str(newTotal);
    String output = "+1:"+str(newTotal) + " ";
    history = history + output;
    print(output+"\n");
  }  
  //Button(2,5) -1
  if (mouseX > width/2 && mouseY > outputwindowheight*10+buttonHeight*4 && mouseY < outputwindowheight*10+buttonHeight*5) {
    int currentTotal = int(total);
    int newTotal = currentTotal - 1;
    total = str(newTotal);
    String output = "-1:"+str(newTotal) + " ";
    history = history + output;
    print(output+"\n");
  }  
  //Clear Button
  if (mouseX > width*0.85 && mouseY < outputwindowheight*2.5) {
    total = "";
    history = "";
  }  
}

void keyPressed() {
  if (key == 'c'){
    total = "";
    history = "";
  }
}
