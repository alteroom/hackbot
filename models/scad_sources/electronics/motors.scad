// Motors
include <../config.scad>
// NEMA17 
// https://www.thingiverse.com/thing:67561
NEMA17();

module NEMA17(){
    color(MOTORS_COLOR)
        import("Motor_NEMA17.stl", convexity=1);
}
