void setup() {
  size(800, 600);

  noStroke();
  smooth();
  background(240); 
  noLoop();
  
  drawPoint();
}
void drawPoint(){
  for(int i=1;i<N+1;i++){
    fill(10, 80, 100, 80);
    ellipse(i*(width/N), height - 300, 5, 5);
  }
}
int N = 1000;

void draw() {
  //draw point
  int max = 200;
  for(int i=1;i<max;i++){
//    int num = int(random(N));
    int num = i;
    while(num!=1){
      boolean isEven = false;
      if(num%2 == 0){
        isEven=true;
      }
      int num2 = collatz(num);  
      
      drawCircle(num, num2, isEven);
      num = num2;
    }
  }
}

void drawCircle(int num1, int num2, boolean isEven){
  float x_num1 = num1 * width/N;
  float x_num2 = num2 * width/N;
  float xcenter = (x_num1 + x_num2)/2;
  float radius = abs(x_num1 - x_num2);
  stroke(0, 10);
  strokeWeight(2);
  noFill();
  if (isEven==false){
    stroke(180,40,0,2);
    arc(xcenter, height - 300, radius, 400, PI, TWO_PI);
  }else{
    stroke(0,40,180,2);
    arc(xcenter, height - 300, radius, 400, 0, PI);
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
