//normal states
final int LV = 0x00;
final int PRECHARGE = 0x01;
final int HV = 0x02;
final int DRIVE = 0x03;

//fault states
final int DRV_FRM_LV = 0x81;
final int PRE_TIME_OUT = 0x82;
final int BR_NOT_PRS = 0x83;
final int HV_DIS_WHILE_DRV = 0x84;
final int SENSOR_DISCREPANCY = 0x85;
final int SOFT_BSPD = 0x86;
final int SHUTDOWN_OPEN = 0x87;
final int UNCALIBRATED = 0x88;
final int HARD_BSPD = 0x89;
final int MC_FAULT = 0x8A;

// BMS states
final int NO_ERROR = 0x0000;
final int CHARGEMODE = 0x0001;
final int PACK_TEMP_OVER = 0x0002;
final int FUSE_BLOWN = 0x0004;
final int PACK_TEMP_UNDER = 0x0008;
final int LOW_SOC = 0x0010;
final int CRITICAL_SOC = 0x0020;
final int IMBALANCE = 0x0040;
final int COM_FAILURE = 0x0080;
final int SPI_FAULT = 0x0400;
final int CELL_VOLT_OVER = 0x0800;
final int CELL_VOLT_UNDER = 0x1000;
final int CHARGE_HAULT = 0x2000;
final int FULL = 0x4000;

void print_state(int x, int y){
  String s = "";
  switch (state){
    case LV:
      s = "LV";
      break;
    case PRECHARGE:
      s = "PRECHARGE";
      break;
    case HV: 
      s = "HV";
      break;
    case DRIVE:
      s = "DRIVE"; 
      break;
    case DRV_FRM_LV: 
      s = "DRIVE FROM LV";
      break;
    case PRE_TIME_OUT:
      s = "PRECHARGE TIMOUT";
      break;
    case BR_NOT_PRS:
      s = "BRAKE NOT PRESSED";
      break;
    case HV_DIS_WHILE_DRV:
      s = "HV DISABLED WHILE DRIVING";
      break;
    case SENSOR_DISCREPANCY:
      s = "SENSOR DISCREPANCY";
      break;
    case SOFT_BSPD: 
      s = "SOFT BSPD TRIPPED";
      break;
    case HARD_BSPD:
      s = "HARD BSPD TRIPPED";
      break;
    case SHUTDOWN_OPEN: 
      s = "SHUTDOWN CIRCUIT OPEN";
      break;
    case UNCALIBRATED:
      s = "PEDALS NOT CALIBRATED";
      break;
    case MC_FAULT:
      s = "MC FAULT";
      break;
    default:
      s = "UNKNOWN STATE";
  }
  
  fill(255);
  textSize(20);
  textAlign(LEFT);
  text("VCU STATE:", x, y);
 
  if((state & 0x80) != 0)
    fill(255, 0, 0);
  else
    fill(0, 255, 0);
  
  text(s, x, y+20);
}

void print_bms_state(int x, int y){
   int status = bms_status;
   if(status == NO_ERROR){
      fill(0, 255, 0);
      text("Normal :)", x, y);
    } else {
      //FAULTS
      fill(255, 0, 0);
      if((status & PACK_TEMP_OVER) != 0) text("Pack overtemp!", x, y);
      if((status & FUSE_BLOWN)  != 0) text("Fuse blown!", x, y);
      if((status & PACK_TEMP_UNDER)  != 0) text("Pack undertemp!", x, y);
      if((status & CRITICAL_SOC)  != 0) text("Critical SOC!", x, y);
      if((status & SPI_FAULT)  != 0) text("SPI Fault!", x, y);
      
      //WARNINGS
      fill(255, 255, 0);
      if((status & LOW_SOC)  != 0) text("Low SOC!", x, y);
      if((status & CHARGEMODE) != 0) text("Charge mode", x, y);
      if((status & IMBALANCE)  != 0) text("Imbalance!", x, y); 
     
    }
}
