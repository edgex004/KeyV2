// the point of this file is to be a sort of DSL for constructing keycaps.
// when you create a method chain you are just changing the parameters
// key.scad uses, it doesn't generate anything itself until the end. This
// lets it remain easy to use key.scad like before (except without key profiles)
// without having to rely on this file. Unfortunately that means setting tons of
// special variables, but that's a limitation of SCAD we have to work around

use <src/key.scad>

include <src/settings.scad>
include <src/key_sizes.scad>
include <src/key_profiles.scad>
include <src/key_types.scad>
include <src/key_transformations.scad>
include <src/key_helpers.scad>

    $double_sculpt_radius =1000;


module lilykey(row,col,width=1){
  $key_bump = (row ==2 && (col == 1 || col==4) );
  $stem_support_height = .5;

  u(width) choc(.1) flared_support()  tined_stem_support() low_profile()
    loprolilly_row(row,col) key();
}

module thumb_skinny(){
lilykey(0,-1);
}

module thumb_square() {
    lilykey(0,0);

}
   
module row2() {
        lilykey(2,0);
}

module row1() {
    lilykey(1,0);
}

// module layer_key() {
//     lilykey(0,0);
// }

module num_key() {
    lilykey(5,0);
}

module bump_key() {
    lilykey(2,1);

}
module escape() {
     $double_sculpted= true;

    lilykey(5,5);

}
module col5() {
   $double_sculpted= true;

    lilykey(1,5);

}
module test_print () {
  lilykey(0,-1);
  translate([20,0,0]) 
    lilykey(5,0);
  translate([40,0,0]) 
    lilykey(2,1);
  translate([60,0,0]) 
  {
    $double_sculpted= true;
    $double_sculpted_hack = true;
    lilykey(5,5);
  }
  for ( i = [0 : 2] ){
    translate([80+20*i,0,0]) 
      lilykey(i,0);
  }
}

module test_double_skulpt () {
  escape();
  for ( i = [0 : 3] ){
    translate([20+20*i,0,0]) 
      col5();
  }
  for ( i = [0 : 5] ){
    translate([20*i,20,0]) 
      num_key();
  }
}

module full_layout () {

    translate([20,5,0]) 
      thumb_skinny();
    translate([20,35,0]) 
      thumb_skinny();

    translate([20,60,0]) 
    row2();

    translate([20,80,0]) 
num_key();

    translate([120,0,0]) 
    row2();

    translate([140,0,0]) 
    row1();

//  translate([40,-40,0]) 

for ( i = [0 : 3] ){
  translate([40+20*i,0,0]) 
    thumb_square();
}

//  translate([40,0,0]) 
//    layer_key();

// for ( i = [0 : 4] ){
//  translate([40+20*i,20,0]) 
//    row1();
// }

  translate([40+0,20,0]) 
    row1();

  translate([40+20,20,0]) 
    row1();

  translate([40+40,20,0]) 
    row1();
  translate([40+60,20,0]) 
    row1();
  translate([40+80,20,0]) 
    row1();
for (j=[0:1]){
for ( i = [0 : 4] ){
    
    if(j==0 && (i==1 || i==4)){
  translate([40+20*i,40+20*j,0]) 
    bump_key();
    }else{
          translate([40+20*i,40+20*j,0]) 
    row2();
    }
}
}

for ( i = [0 : 4] ){
  translate([40+20*i,80,0]) 
    num_key();
}

for ( i = [0 :2] ){
  translate([140,20+20*i ,0]) 
    col5();
}

for ( i = [0 :3] ){
  translate([140,80 ,0]) 
    escape();
}
}
  // {
  //   $double_sculpted_hack = true;
  //   $double_sculpt_radius =1000;
  //   lilykey(5,5);
  // }
// test_print();
test_double_skulpt();
//  full_layout();

// translate ([20,0,0]) lilykey(2,1,1);
// lilykey(1,0,1);
