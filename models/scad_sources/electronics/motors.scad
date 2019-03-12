// Motors
include <../config.scad>
// NEMA17 
// https://www.thingiverse.com/thing:67561
NEMA17();

module NEMA17(){
    color(MOTORS_COLOR)
        import("Motor_NEMA17.stl", convexity=1);
}

module MOTOR_X1(){
    NEMA17();
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