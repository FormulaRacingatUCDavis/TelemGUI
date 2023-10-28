final int bar_height = 120;
final int bar_width = 40;

class Sensor{
  public int raw = 0;
  public int percentage = 50; 
  //public int range = 0; 
  public boolean calibrated = true;
  public boolean open_short = false;
  String name = "";
  
  public Sensor(String n){
    name = n;
  }
  
  void draw_sensor(int x, int y){      
    fill(255);
    textSize(18);
    textAlign(CENTER);
    text(name, x, y);
    
    
    int bar_x = x - bar_width/2;
    int bar_y = y + 10;
    
    fill(127);
    if(open_short){
      fill(127, 0, 0);
    }
    
    //draw bar background
    rect(bar_x, bar_y, bar_width, bar_height);
    
    //fill bar
    if(calibrated & !open_short){
      fill(0, 180, 0);
      draw_bar(bar_x, bar_y, percentage);
      
      fill(255);
      textSize(14);
      int text_y = bar_y + bar_height/2;
      text(str(percentage)+"%", x, text_y);
    }
  }
}
