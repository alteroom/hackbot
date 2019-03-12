// Mechanics/Screw
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;

M3SPACER();
MOV(X(10)) M3SPACER_L();
module M3SCREW(length){
    
}

module M3SPACER(){
    color(ROD_COLOR)
    difference(){
        cylinder(d=7,h=0.6);
        MOV(Z(-0.1)) cylinder(d=3.5,h=0.8);
    }
}

module M3SPACER_L(){
    color(ROD_COLOR)
    difference(){
        cylinder(d=9,h=0.9);
        MOV(Z(-0.1)) cylinder(d=3.5,h=1.1);
    }
}


module M3NUT(){
    
}