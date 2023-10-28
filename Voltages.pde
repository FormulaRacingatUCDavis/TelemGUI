int bms_voltage = 459;
int cap_voltage = 300;
int max_voltage = 504;

void draw_voltages(int x, int y){
    fill(255);
    textSize(14);
    textAlign(CENTER);
    text(String.format("PACK: %3dV", bms_voltage), x, y);
    y+=15;
    text(String.format("CAPS: %3dV", cap_voltage), x, y);
    y+=10;
    
    x -= bar_width/2;
   //draw bar background
    fill(127);
    rect(x, y, bar_width, bar_height);
    
    int bms_percentage = bms_voltage*100/max_voltage;
    int cap_percentage = cap_voltage*100/max_voltage;
    
    //draw fills
    fill(0, 180, 0);
    draw_bar(x, y, bms_percentage);
    fill(180, 180, 0);
    draw_bar(x, y, cap_percentage);
    
    
}

void draw_bar(int bar_x, int bar_y, int percentage){
  if(percentage > 100)
    percentage = 100;
  else if(percentage < 0)
    percentage = 0;
      
  int y_start = bar_y + (100-percentage)*bar_height/100;
  int fill_height = bar_height + bar_y - y_start;
  rect(bar_x, y_start, bar_width, fill_height);
}
