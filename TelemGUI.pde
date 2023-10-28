import java.util.Arrays;
import processing.serial.*;

Sensor apps1 = new Sensor("APPS1");
Sensor apps2 = new Sensor("APPS2");
Sensor brake = new Sensor("BRAKE");

Serial myPort;

int state = 0x03;
int front_rads = 0;
int rear_rads = 0;

void setup(){
  size(400, 500);
  frameRate(20);
  
  myPort =  new Serial(this, Serial.list()[0], 38400);
}

void draw(){
  background(0);
  
  /*
  apps1.percentage+=2; 
  apps2.percentage++;
  brake.percentage+=3;
  cap_voltage += 5;
  if(apps1.percentage > 100){
    apps1.percentage = 0;
    apps2.percentage = 0;
    brake.percentage = 0;
    cap_voltage = 0;
  }
  */
  
  
    
  apps1.draw_sensor(50, 54);
  apps2.draw_sensor(150, 54);
  brake.draw_sensor(250, 54);
  
  print_state(20, 250);
  draw_voltages(350, 40);
  
  fill(255);  
  textSize(20);
  textAlign(LEFT);
  text("MTR Temp: " + str(motor_temp) + "C", 20, 300);
  text("MTR Rad Air Temp IN/OUT: " + str(mtr_air_in_temp) + "C/" + str(mtr_air_out_temp) + "C", 20, 330);
  text("MC  Rad Air Temp IN/OUT: " + str(mc_air_in_temp) + "C/" + str(mc_air_out_temp) + "C", 20, 360);
  text("FWS: " + str(front_rads), 20, 390);
  text("RWS: " + str(rear_rads), 20, 420);
}
