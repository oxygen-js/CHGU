Program Cheburashka;
uses GraphABC;
begin

  // HEAD
  var head_x, head_y: integer;
  head_x := 320;
  head_y := 160;
  Circle(320,160,50);
  FloodFill(320, 160, clKhaki);
  
  
  // EYE (Глаз Л)
  var eye_l_x, eye_l_y: integer;
  eye_l_x := 300;
  eye_l_y := 150;
  Circle(eye_l_x, eye_l_y, 7);
  FloodFill(eye_l_x, eye_l_y, clBlue);
  
  // EYE (Глаз П)  
  var eye_r_x, eye_r_y: integer;
  eye_r_x := 340;
  eye_r_y := 150;
  Circle(eye_r_x,eye_r_y, 7);
  FloodFill(eye_r_x,eye_r_y, clBlue);
  
  // Nose
  var nose_x1, nose_x2, nose_y1, nose_y2: integer;
  nose_x1 := 317;
  nose_x2 := 325;
  nose_y1 := 160;
  nose_y2 := 180;
  Ellipse(nose_x1, nose_y1, nose_x2, nose_y2);
    
  // EAR_L (Ухо Л)  
  var ear_L_x1, ear_L_x2, ear_L_y1, ear_L_y2: integer;
  ear_L_x1 := 200;
  ear_L_x2 := 272;
  ear_L_y1 := 90;
  ear_L_y2 := 220;
  Ellipse(ear_L_x1, ear_L_y1, ear_L_x2, ear_L_y2);
  
  // EAR_R (Ухо П)  
  var ear_R_x1, ear_R_x2, ear_R_y1, ear_R_y2: integer;
  ear_R_x1 := 370;
  ear_R_x2 := 442;
  ear_R_y1 := 90;
  ear_R_y2 := 220;
  Ellipse(ear_R_x1, ear_R_y1, ear_R_x2, ear_R_y2);
  
  // Body (Тело)  
  var body_x1, body_x2, body_y1, body_y2: integer;
  body_x1 := 280;
  body_x2 := 365;
  body_y1 := 210;
  body_y2 := 360;
  Ellipse(body_x1, body_y1, body_x2, body_y2);
  
  // Arm_L (Рука Л)  
  var arm_L_x1, arm_L_x2, arm_L_y1, arm_L_y2: integer;
  arm_L_x1 := 230;
  arm_L_x2 := 282;
  arm_L_y1 := 260;
  arm_L_y2 := 270;
  Ellipse(arm_L_x1, arm_L_y1, arm_L_x2, arm_L_y2);
  
  // Arm_R (Рука П)  
  var arm_R_x1, arm_R_x2, arm_R_y1, arm_R_y2: integer;
  arm_R_x1 := 363;
  arm_R_x2 := 415;
  arm_R_y1 := 260;
  arm_R_y2 := 270;
  Ellipse(arm_R_x1, arm_R_y1, arm_R_x2, arm_R_y2);
  
  // Foot_L (Нога Л)  
  var foot_L_x1, foot_L_x2, foot_L_y1, foot_L_y2: integer;
  foot_L_x1 := 230;
  foot_L_x2 := 282;
  foot_L_y1 := 360;
  foot_L_y2 := 380; 
  Ellipse(foot_L_x1, foot_L_y1, foot_L_x2, foot_L_y2);
  
  // Foot_L (Нога П)  
//  var foot_R_x1, foot_R_x2, foot_R_y1, foot_R_y2: integer;
//  foot_R_x1 := 230;
//  foot_R_x2 := 282;
//  foot_R_y1 := 260;
//  foot_R_y2 := 270;
//  Ellipse(foot_L_x1, foot_L_y1, foot_L_x2, foot_L_y2);
  
  
end.
