// Motors
include <../config.scad>
use <../utils.scad>;
// NEMA17 
// https://www.thingiverse.com/thing:67561
MOTOR_X1();

module NEMA17(){
    color(MOTORS_COLOR)
        import("Motor_NEMA17.stl", convexity=1);
}

module MOTOR_X1(){
    NEMA17();
    MOTOR_X1_MOUNT();
}

module MOTOR_X1_MOUNT(){
    difference(){
        MOV([0,0,MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5])
            cube([MOTOR_MOUNT_L+MOTOR_MOUNT_W*2, MOTOR_MOUNT_L+MOTOR_MOUNT_W*2+MOTOR_BELT_REG, MOTOR_MOUNT_W], center = true);
        
        MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R-MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R+MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5-0.5])
            cube([3.5,MOTOR_BELT_REG,MOTOR_MOUNT_W+2], center=true);
        
        MOV([-MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R-MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([-MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R+MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([-MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5-0.5])
            cube([3.5,MOTOR_BELT_REG,MOTOR_MOUNT_W+2], center=true);
        
        MOV([MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R-MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R+MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5-0.5])
            cube([3.5,MOTOR_BELT_REG,MOTOR_MOUNT_W+2], center=true);
        
        MOV([-MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R-MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([-MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R+MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
            cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
        MOV([-MOTOR_MOUNT_SCREW_R, -MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5-0.5])
            cube([3.5,MOTOR_BELT_REG,MOTOR_MOUNT_W+2], center=true);
    }
    //cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
    
    MOV([0,-MOTOR_MOUNT_L*0.5-MOTOR_BELT_REG*0.5-MOTOR_MOUNT_W*0.5,MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_L*0.5-MOTOR_BELT_REG*0.5])
            cube([80, MOTOR_MOUNT_W, MOTOR_MOUNT_L+MOTOR_MOUNT_W*2+MOTOR_BELT_REG], center = true);
}

module MOTOR_X2(){
    NEMA17();
}

module MOTOR_Y(){
    NEMA17();
}

module MOTOR_Z(){
    NEMA17();
}

module MOTOR_E0(){
    NEMA17();
}

module MOTOR_E1(){
    NEMA17();
}