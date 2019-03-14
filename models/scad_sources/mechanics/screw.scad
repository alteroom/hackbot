// Mechanics/Screw
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;

M3SPACER();
MOV(X(10)) M3SPACER_L();
MOV(X(20)) M3NUT();
MOV(X(30)) M3SCREW(12);
MOV(X(40)) M3SPACER_PRINT(12);

module M3SCREW(length){
    color(SCREW_COLOR)
        union(){
            cylinder(d=M3_D,h=M3_H,$fn=6);
            cylinder(d=3,h=length+M3_H);
        }
}

module M3SPACER_PRINT(height){
    color(PRINT_COLOR)
        difference(){
            cylinder(d=M3_SPACER_D,h=height);
            MOV(Z(-0.1)) cylinder(d=3.5,h=height+0.2);
        }
}


module M3SPACER(){
    color(SCREW_COLOR)
        difference(){
            cylinder(d=M3_SPACER_D,h=M3_SPACER_H);
            MOV(Z(-0.1)) cylinder(d=3.5,h=M3_SPACER_H+0.2);
        }
}

module M3SPACER_L(){
    color(SCREW_COLOR)
        difference(){
            cylinder(d=M3_SPACER_L_D,h=M3_SPACER_L_H);
            MOV(Z(-0.1)) cylinder(d=3.5,h=M3_SPACER_L_H+0.2);
        }
}


module M3NUT(){
    color(SCREW_COLOR)
        difference(){
            cylinder(d=M3_D,h=M3_H,$fn=6);
            MOV(Z(-0.1)) cylinder(d=3,h=M3_D+0.2);
        }
}