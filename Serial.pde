int ESCAPE_CHAR = 0x05;
int FRAME_START = 0x0A;
int FRAME_END = 0x0B;

boolean escaped = false;        //true if last character was escape
int[] buffer = new int[1000];  //store incoming bytes
int i = 0; 

int data(int i)
{
  return buffer[i+2];
}

void byte_in(int b_in){
  if(b_in < 0 || b_in > 255){
    return;
  } else if(i > 999){
    return;
  }
  
  int b = b_in;
  
  if(escaped){
    if(b == FRAME_START){           //reset buffer
      i = 0;
      //println("frame start");
    } else if(b == FRAME_END){      //buffer is finished, parse data
      parse_buffer();
      //println("frame end");
    } else if(b == ESCAPE_CHAR){    //byte is escape character
      buffer[i] = b;
      i++;
    }
    escaped = false;
    return;
  }
  
  if(b == ESCAPE_CHAR){    //check for escape
    //println("escape");
    escaped = true;
  } else {
    buffer[i] = b;
    i++;
  }
}

//int expected_len = 10;
    
void parse_buffer(){
  //println("LEN: " + str(i));  
  //println("ID: " + str(buffer[0]));
  //println("");
  
  int id = buffer[0] + 256*buffer[1];
  
  switch(id){
    case(0x766):
      println("VCU");
      apps1.percentage = data(1);
      apps2.percentage = data(2);
      brake.percentage = data(3);;
      state = data(4);
      break;
    case(0x0A2):
      motor_temp = (256*data(5) + data(4))/10;
      break;
    case(0x500):
      print("FWS");
      front_rads = (data(1) + 256*data(0));
      break;
    case(0x401):
      print("air temp");
      mc_air_in_temp = data(0);
      mc_air_out_temp = data(1);
      mtr_air_in_temp = data(2);
      mtr_air_out_temp = data(3);
      break;
    case(0x0A5): 
      rear_rads = (data(3)*256 + data(2));
      break;
    case(0xA7): 
      cap_voltage = (256*data(1) + data(0))/10;
      break;
  }
}

void serialEvent (Serial myPort) {
  int b = myPort.read();
  //println(b);
  byte_in(b);
}
