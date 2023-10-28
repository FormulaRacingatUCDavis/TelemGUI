import java.util.Arrays;
import processing.serial.*;

Sensor apps1 = new Sensor("APPS1");
Sensor apps2 = new Sensor("APPS2");
Sensor brake = new Sensor("BRAKE");

Serial myPort;

int state = 0x03;
int front_rads = 0;
int rear_rads = 0;
int bms_status = 0;

void setup(){
  size(400, 500);
  frameRate(20);
  
  myPort =  new Serial(this, Serial.list()[0], 38400);
}

void draw(){
  background(0);
   
  apps1.draw_sensor(50, 54);
  apps2.draw_sensor(150, 54);
  brake.draw_sensor(250, 54);
  
  print_state(20, 250);
  draw_voltages(350, 40);

  fill(255);  
  textSize(20);
  textAlign(LEFT);
  text("BMS STATE:", 200, 250);
  print_bms_state(200, 270);
  
  fill(255); 
  text("MTR Temp: " + str(motor_temp) + "C", 20, 300);
  text("MC Temps: " + str(mc_tempa) + "C " + str(mc_tempb) + "C " + str(mc_tempc) + "C " + str(mc_temp_gate) + "C", 20, 320);
  text("MTR AIR IN/OUT: " + str(mtr_air_in_temp) + "C/" + str(mtr_air_out_temp) + "C", 20, 340);
  text("MC AIR IN/OUT: " + str(mc_air_in_temp) + "C/" + str(mc_air_out_temp) + "C", 20, 360);
  text("MC WTR IN/OUT: " + str(mc_in_temp) + "C/" + str(mc_out_temp) + "C", 20, 380);
  text("MTR WTR IN/OUT: " + str(mtr_in_temp) + "C/" + str(mtr_out_temp) + "C", 20, 400);
  text("FWS: " + str(front_rads) + "mph", 20, 420);
  text("RWS: " + str(rear_rads), 20, 440);
  text("BMS Temp: " + str(bms_temp) + "C", 20, 460);
  
  
}
