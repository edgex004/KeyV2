module loprolilly_row(row=3, column = 0) {
  
  $bottom_key_width = 18.16;
    
      //for thumb
  $bottom_key_height = column < 0 ? 18.16*1.5 : 18.16*1;
  $stem_support_height = column < 0 ? 0 : $stem_support_height;

    
  $width_difference = 2;
  $height_difference = 2;
  $top_tilt = 0;
  $top_skew = 0;
  

  // something weird is going on with this and legends - can't put it below 1.2 or they won't show
  $dish_skew_x = 0;
  $dish_skew_y = 0;
  $minkowski_radius = 1.75;
  $key_bump_depth = 2;
  $key_bump_edge =2;  
  // $key_bump_depth = 4;
  // $key_bump_edge =2;
  //also,
  $rounded_key = true;

  $top_tilt_y = side_tilt(column);

  extra_height =  $double_sculpted ? extra_side_tilt_height(column)/5 : 0;

  $total_depth = 2.5 + abs((7 * row-3) * 0.5) + extra_height;

  if(row == 5) {
    //function keys are simple flat tops
    $dish_type = "none";
    $total_depth  =4.5+ extra_height;;
    $top_tilt =  -6.5;

    if (column < 0) {
      rotated() children();
    } else {
      children();
    }
  } else if (column == 5) {
    //function keys are simple flat tops
    $dish_type = "none";
    $total_depth  = 4.5 + extra_height;;
    $top_tilt =  0;

    if (column < 0) {
      rotated() children();
    } else {
      children();
    }
 } else if (row == 1 ){
    $dish_type = "spherical";
    $keytop_thickness =-1;
    $dish_depth = 2.6;
    $total_depth = 2.5 + abs((7 * row-3) * 0.5) + extra_height;

    //  for thumb
    $top_tilt = column < 0 ? 
                  -((row-3) * 7 + 7.5 ): 
                  -((row-3) * 7 + 2.5);

    if (column < 0) {
      rotated() children();
    } else {
      children();
    }
    }
  else if( row == 2 || row == 3 || row == 4 ) {
    $dish_type = "spherical";
    $keytop_thickness =-1;
    $dish_depth = 2.6;
    $total_depth = 4+ extra_height;;

    //  for thumb
    $top_tilt = 0;

    if (column < 0) {
      rotated() children();
    } else {
      children();
    }
  } else {
    //tilted flat top row zero for lilly (thumb row)
        $keytop_thickness =.5;

    $top_tilt =  -6.5;
    $total_depth  =4.5+ extra_height;;
        $dish_type = "none";

    if (column < 0) {
      rotated() children();
    } else {
      children();
    }
  }
}
