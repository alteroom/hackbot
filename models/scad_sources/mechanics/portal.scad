// Mechanics/Portal
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;
use <../mechanics/bearing.scad>;

PORTAL();


module PORTAL(){
    MOV_ROT([FRAME_X, 0, 0],[180,90,0]) CORNER40402(FRAME_X, w=20);
    MOV([20+RAIL_X_OFFSET, -20-RAIL_W*0.5, 0]) MGN9(RAIL_X);
    MOV([FRAME_X*0.25, -20-MGN9C_Y*0.5, MGN9C_H]) MGN9C();
    MOV([FRAME_X*0.75, -20-MGN9C_Y*0.5, MGN9C_H]) MGN9C();
    MOV_ROT([MGN9C_Y, -MGN9C_X*0.5-20, 0], Z(90)) MGN9C();
    MOV_ROT([FRAME_X, -MGN9C_X*0.5-20, 0], Z(90)) MGN9C();
}


module MGN9(length){
    N = floor(length/RAIL_P);
    color(ROD_COLOR)
        difference(){
            cube([length, 9, 6.5]);
            for (i=[0:N-1]) MOV([(i+0.5)*RAIL_P, RAIL_W*0.5, -0.5])cylinder(d=3.5, h=7.5);
        }
    
}

module MGN9C(){
    color(MGN9C_COLOR)
        difference(){
            MOV(DELTA01) cube(MGN9C_SZ-DELTA02);
            MOV([(MGN9C_X-MGN9C_C)*0.5, (MGN9C_Y-MGN9C_B)*0.5, 0]) cylinder(d=3, h=MGN9C_Z);
            MOV([(MGN9C_X+MGN9C_C)*0.5, (MGN9C_Y+MGN9C_B)*0.5, 0]) cylinder(d=3, h=MGN9C_Z);
            MOV([(MGN9C_X-MGN9C_C)*0.5, (MGN9C_Y+MGN9C_B)*0.5, 0]) cylinder(d=3, h=MGN9C_Z);
            MOV([(MGN9C_X+MGN9C_C)*0.5, (MGN9C_Y-MGN9C_B)*0.5, 0]) cylinder(d=3, h=MGN9C_Z);
        }
    
}