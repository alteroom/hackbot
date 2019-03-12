// Rods
include <../config.scad>
use <../utils.scad>;

TABLE_ROD();
MOV(X(20)) Z_SCREW();
MOV(X(40)) Y_ROD();

module TABLE_ROD(){
    color(ROD_COLOR)
        cylinder(d=TABLE_ROD_D, h=TABLE_ROD_H);
}

module Z_SCREW(){
    color(ROD_COLOR)
        cylinder(d=Z_SCREW_D, h=Z_SCREW_H);
}

module Y_ROD(){
    color(ROD_COLOR)
        cylinder(d=Y_ROD_D, h=Y_ROD_H);
}