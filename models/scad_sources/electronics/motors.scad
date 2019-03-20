// Motors
include <../config.scad>
use <../utils.scad>;
// NEMA17 
// https://www.thingiverse.com/thing:67561
MOTOR_X2();

module NEMA17(){
    color(MOTORS_COLOR)
        import("Motor_NEMA17.stl", convexity=1);
}

module MOTOR_X1(){
    NEMA17();
    MOTOR_MOUNT();
    MOV_ROT([7, -7, 24], Y(-90)) 
        GT2PULLEY20();
}

module GT2PULLEY20(){
    //https://www.thingiverse.com/thing:436038
    color(BEARING_COLOR)
        import("GT2_20.stl", convexity=1);
    
}

module MOTOR_MOUNT(){
    color(PRINT_COLOR)
    union(){
    
        difference(){
            MOV([0,0,MOTOR_MOUNT_Z*0.5])
                cube([MOTOR_MOUNT_X, MOTOR_MOUNT_Y, MOTOR_MOUNT_W], center = true);
            
            MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R-MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
                cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
            MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R+MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
                cylinder(d=3.5, h=MOTOR_MOUNT_W*2);
            MOV([MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_SCREW_R, MOTOR_MOUNT_Z*0.5-0.5])
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
            
            MOV([0, -MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
                cylinder(d=MOTOR_MOUNT_D, h=MOTOR_MOUNT_W*2);
            MOV([0, MOTOR_BELT_REG*0.5, MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_W*0.5])
                cylinder(d=MOTOR_MOUNT_D, h=MOTOR_MOUNT_W*2);
            MOV([0, -0, MOTOR_MOUNT_H*0.5+MOTOR_MOUNT_W*0.5-0.5])
                cube([MOTOR_MOUNT_D, MOTOR_BELT_REG, MOTOR_MOUNT_W+2], center=true);
        }
        difference(){
            MOV([0,-MOTOR_MOUNT_L*0.5-MOTOR_BELT_REG*0.5-MOTOR_MOUNT_W*0.5,MOTOR_MOUNT_H*0.5-MOTOR_MOUNT_L*0.5-MOTOR_BELT_REG*0.5])
                cube([MOTOR_MOUNT_X, MOTOR_MOUNT_W, MOTOR_MOUNT_L+MOTOR_MOUNT_W*2+MOTOR_BELT_REG], center = true);
            for(x=[-2:2:2], z=[-3:2:1]){
                MOV_ROT([x*10, -MOTOR_MOUNT_Y*0.5+MOTOR_MOUNT_W*0.5, z*10], X(90))
                    cylinder(d=4, h=MOTOR_MOUNT_W*2, center=true);
            }
        }
        
        difference(){
            union(){
                MOV([-MOTOR_MOUNT_X*0.5, -MOTOR_MOUNT_Y*0.5, -MOTOR_MOUNT_L*0.5-MOTOR_MOUNT_W*2-MOTOR_BELT_REG])
                    cube([MOTOR_MOUNT_W, MOTOR_MOUNT_Y, MOTOR_MOUNT_L+MOTOR_MOUNT_W*2+MOTOR_BELT_REG]);
                MOV([MOTOR_MOUNT_X*0.5-MOTOR_MOUNT_W, -MOTOR_MOUNT_Y*0.5, -MOTOR_MOUNT_L*0.5-MOTOR_MOUNT_W*2-MOTOR_BELT_REG])
                    cube([MOTOR_MOUNT_W, MOTOR_MOUNT_Y, MOTOR_MOUNT_L+MOTOR_MOUNT_W*2+MOTOR_BELT_REG]);
            }
            MOV_ROT([0, MOTOR_MOUNT_X*0.5, -MOTOR_MOUNT_X*0.5], X(45))
                cube([MOTOR_MOUNT_Y, MOTOR_MOUNT_Y*2, MOTOR_MOUNT_Y], center=true);
        }
        
    }
}

module MOTOR_X2(){
    NEMA17();
    MOTOR_MOUNT();
    MOV_ROT([-7, -7, 40], Y(90)) 
        GT2PULLEY20();
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