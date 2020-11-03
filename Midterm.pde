// import Runway library
import com.runwayml.*;
// reference to runway instance
RunwayHTTP runway;


JSONObject data;

void setup(){
  // match sketch size to default model camera setup
  size(1080,720);
  // setup Runway
  runway = new RunwayHTTP(this);


}


void draw(){
  
  background(0,0,0);
  // use the utiliy class to draw PoseNet parts
  //ModelUtils.drawPoseParts(data,g,10);
  draw_poses();
  
  
}

// this is called when new Runway data is available
void runwayDataEvent(JSONObject runwayData){
  // point the sketch data to the Runway incoming data 
  data = runwayData;
}

void draw_poses(){
  if(data != null){
    JSONArray poses = data.getJSONArray("poses");
    print(poses);
    
    for (int i = 0; i < poses.size(); i ++){

      JSONArray the_pose = poses.getJSONArray(i);

      
      ////left wrist
      //JSONArray point = the_pose.getJSONArray(9);
      //float leftwrist_x = point.getFloat(0)*width;
      //float leftwrist_y = point.getFloat(1)*height;
      ////right_wrist
      //JSONArray point1 = the_pose.getJSONArray(10);
      //float rightwrist_x = point1.getFloat(0)*width;
      //float rightwrist_y = point1.getFloat(1)*height;
      //nose
      JSONArray point2 = the_pose.getJSONArray(0);
      float nose_x = point2.getFloat(0)*width;
      float nose_y = point2.getFloat(1)*height;
      //eye_right
      JSONArray point3 = the_pose.getJSONArray(2);
      float righteye_x = point3.getFloat(0)*width;
      float righteye_y = point3.getFloat(1)*height;
      //eye_right
      JSONArray point4 = the_pose.getJSONArray(1);
      float lefteye_x = point4.getFloat(0)*width;
      float lefteye_y = point4.getFloat(1)*height;

      noStroke();

      color c1 = color(0, 143, 48);//green
      color c2 = color(252, 235, 45); //yellow
      
      color c3 = color(41, 184, 255);//blue
      color c4 = color(255, 144, 41);//red
      
      color c5 = color(255, 0, 0);//pink
      color c6 = color(0, 255, 20);///mint
      
      int gradientSteps = 40;
      int gradientStripWidth = width/gradientSteps;
      
      int gradientSteps2 = 30;
      int gradientStripWidth2 = width/gradientSteps2;
      
      int gradientSteps3 = 10;
      int gradientStripWidth3 = width/gradientSteps3;
      
      for(int c = 0; c < gradientSteps; c++){
        float t = map(c,0,gradientSteps,0.0,1.0);
 
        color gradientColor = lerpColor(c1,c2,t);
        fill(gradientColor);
        rect(nose_x, c*gradientStripWidth,nose_y-250,gradientStripWidth);
        
        color gradientColor2 = lerpColor(c3,c4,t);
        fill(gradientColor2);
        rect(righteye_x,c*gradientStripWidth,righteye_y-300,gradientStripWidth);
        
        color gradientColor3 = lerpColor(c5,c6,t);
        fill(gradientColor3);
        rect(lefteye_x-500,c*gradientStripWidth,lefteye_y-150,gradientStripWidth);
        
        color gradientColor5 = lerpColor(c5,c3,t);
        fill(gradientColor5);
        rect(righteye_x-800,c*gradientStripWidth,nose_y-100,gradientStripWidth);
        
        color gradientColor4 = lerpColor(c3,c6,t);
        fill(gradientColor4);
        ellipse(nose_x,c*gradientStripWidth2,lefteye_y-300,gradientStripWidth2);
        
        color gradientColor6 = lerpColor(c2,c3,t);
        fill(gradientColor6);
        ellipse(righteye_x-350,c*gradientStripWidth2,nose_y-280,gradientStripWidth2);
        
        color gradientColor7 = lerpColor(c3,c6,t);
        fill(gradientColor7);
        ellipse(lefteye_x-350,c*gradientStripWidth,nose_x-570,gradientStripWidth);
        
        color gradientColor8 = lerpColor(c3,c5,t);
        fill(gradientColor8);
        rect(nose_y+500,c*gradientStripWidth,lefteye_y-150,gradientStripWidth);
        
        color gradientColor9 = lerpColor(c1,c5,t);
        fill(gradientColor9);
        rect(righteye_y+90,c*gradientStripWidth2,nose_y-450,gradientStripWidth2);
        
        color gradientColor10 = lerpColor(c2,c4,t);
        fill(gradientColor10);
        ellipse(righteye_y+100,c*gradientStripWidth3,nose_y-300,gradientStripWidth3);
} 


    }
  }
}
