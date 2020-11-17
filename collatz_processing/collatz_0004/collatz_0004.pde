void setup() {
  size(800, 600);

  noStroke();
  smooth(8);
  background(20); 
  
  drawPoint();
}
void drawPoint(){
  for(int i=1;i<N+1;i++){
    fill(10, 80, 100, 80);
    ellipse(i*(width/N), height - 300, 5, 5);
  }
}
int N = 10000;

int num = 1;
int max = 2000;

void draw() {
  num = frameCount;
  //draw point
  while(num!=1){
    boolean isEven = false;
    if(num%2 == 0){
      isEven=true;
    }
    int num2 = collatz(num);  
    
    drawCircle(num, num2, isEven);
    num = num2;
  }
  if (frameCount % 100 == 0){
    prinln(frameCount);
    saveFrame("frames/####.png");
  }
  if (frameCount >= 10000) {
   exit();
 }
}

void drawCircle(int num1, int num2, boolean isEven){
  float x_num1 = num1 * width/N;
  float x_num2 = num2 * width/N;
  float xcenter = (x_num1 + x_num2)/2;
  float radius = abs(x_num1 - x_num2);
  strokeWeight(2);
  noFill();
  if (isEven==false){
    stroke(180,40,0,1);
    arc(xcenter, height - 300, radius, 500, PI, TWO_PI);
  }else{
    stroke(0,40,180,1);
    arc(xcenter, height - 300, radius, 500, 0, PI);
  }
}

int collatz(int num){
  if(num%2 == 0){
    num /= 2;
  }else{
    num = 3*num+1;
  }
  return num;
}
