// Table
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;
use <../mechanics/bearing.scad>;

TABLE();

module TABLE(){
    color(PROFILE_COLOR)
    difference(){
        union(){
            MOV_ROT([40, -TABLE_Y+2, 0],[90,90,180]) CORNER40402(TABLE_Y-4, w=TABLE_Z-2);
            MOV_ROT([TABLE_X-40, 0-2, 0],[90,90,0]) CORNER40402(TABLE_Y-4, w=TABLE_Z-2);
            MOV_ROT([TABLE_X, 0, 2],[180,90,0]) CORNER40402(TABLE_X, w=TABLE_Z);
            MOV_ROT([0, -TABLE_Y, 2],[0,90,0]) CORNER40402(TABLE_X, w=TABLE_Z);
        }
        MOV([20,-20,2])cylinder(d=TABLE_ROD_D+1,h=10, center=true);
        MOV([TABLE_X-20,-20,2]) cylinder(d=TABLE_ROD_D+1,h=10, center=true);
        MOV([TABLE_X*0.5,-20,2]) cylinder(d=Z_SCREW_HOLE+1,h=10, center=true);
    }
    offset = (TABLE_X-BED_X)*0.5;
    MOV([offset, offset-TABLE_Y, 15])HEAT_BED();
    MOV([20,-20,2])LMK12LUU();
    MOV([TABLE_X-20,-20,2])LMK12LUU();
    MOV([TABLE_X*0.5,-20,2]) LEAD_SCREW_NUT();
}

module HEAT_BED()
{
    MOV(Z(BED_Z))color(BED_COLOR)
        cube(BED_SZ);
    MOV(Z(BED_Z*2 + 0.1))
    color(GLASS_COLOR)
        cube(GLASS_SZ);
}