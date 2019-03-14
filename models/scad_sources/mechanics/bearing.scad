// Bearing
include <../config.scad>
use  <../utils.scad>;

LMK12LUU();

MOV(X(30)) LEAD_SCREW_NUT();

MOV(X(60)) F623ZZ();

module F623ZZ(){
    color(BEARING_COLOR)
        difference(){
            union(){
                cylinder(d=11.5,h=1);
                cylinder(d=F623_D,h=F623_H);
                
            }
            MOV(Z(-0.1))
                cylinder(d=3,h=F623_H+0.2);
            
        }
    
}

module LMK12LUU(){
    color(BEARING_COLOR)
        difference(){
            union(){
                cylinder(d=21,h=57);
                translate([-16, -16, 0])
                    cube([32,32,3.1]);
            }
            MOV(Z(-0.5))
                cylinder(d=12,h=58);
            ROT_MOV(Z(45), X(16))
                cylinder(d=4,h=8, center=true);
            ROT_MOV(Z(135), X(16))
                cylinder(d=4,h=8, center=true);
            ROT_MOV(Z(225), X(16))
                cylinder(d=4,h=8, center=true);
            ROT_MOV(Z(315), X(16))
                cylinder(d=4,h=8, center=true);
        }
}

module LEAD_SCREW_NUT(){
    color(BRONZE_COLOR)
        difference(){
            union(){
                MOV(Z(-1.5)) cylinder(d=10.2,h=15);
                cylinder(d=22,h=3.5);
            }
            MOV(Z(-2))
                cylinder(d=8,h=16);
            ROT_MOV(Z(45), X(8))
                cylinder(d=3.5,h=8, center=true);
            ROT_MOV(Z(135), X(8))
                cylinder(d=3.5,h=8, center=true);
            ROT_MOV(Z(225), X(8))
                cylinder(d=3.5,h=8, center=true);
            ROT_MOV(Z(315), X(8))
                cylinder(d=3.5,h=8, center=true);
        }
}