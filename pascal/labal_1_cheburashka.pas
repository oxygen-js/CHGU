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
  
  
  // EAR (Ухо П)  
//  var ear_r_x, ear_r_y: integer;
//  ear_r_x := 50;
//  ear_r_y := 50;
//  Circle(eye_l,eye_l,5);
//  FloodFill(eye_l,eye_l, clBlue);
  
  // BODY (Тело)
//  var cheb_body_x, cheb_body_y: integer;
//  cheb_body_x := 100;
//  cheb_body_y := 150;
//  Circle(eye_l,eye_l,5);
//  FloodFill(eye_l,eye_l, clBlue);
  
  // FOOT (Нога Л)
//  var foot_l_x, foot_l_y: integer;
//  foot_l_x := 100;
//  foot_l_y := 150;
//  Circle(eye_l,eye_l,5);
//  FloodFill(eye_l,eye_l, clBlue);
  
  
//  // FOOT (Нога Л)
//  var foot_r_x, foot_r_y: integer;
//  foot_r_x := 100;
//  foot_r_y := 150;
//  Circle(eye_l,eye_l,5);
//  FloodFill(eye_l,eye_l, clBlue);
  
end.
