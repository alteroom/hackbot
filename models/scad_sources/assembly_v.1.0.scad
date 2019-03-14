// Assembly v 1.0
// Config
include <config.scad>;
// Utils
use <utils.scad>;
// Frame
use <frame/profile.scad>
// Mechanics
use <mechanics/bearing.scad>;
use <mechanics/rods.scad>;
use <mechanics/table.scad>;
use <mechanics/portal.scad>;

// Electronics
use <electronics/motors.scad>;


FRAME();
X_AXIS_PARTS();
Y_AXIS_PARTS();
Z_AXIS_PARTS();

MOV([(FRAME_X-TABLE_X)*0.5, FRAME_Y-10, FRAME_Z*0.2]) TABLE();

module X_AXIS_PARTS(){
    MOV([0, FRAME_Y*0.5, FRAME_Z-20-PORTAL_H]) PORTAL();
}

module Y_AXIS_PARTS(){
    MOV_ROT([10+RAIL_W/2, 20, FRAME_Z-20-RAIL_H], Z(90)) MGN9(FRAME_Y-40);
}


module Z_AXIS_PARTS(){
    MOV([(FRAME_X-TABLE_X)*0.5+20, FRAME_Y-20-TABLE_ROD_D*0.5-TABLE_ROD_MOUNT_W, 0]) TABLE_ROD();
    MOV([(FRAME_X+TABLE_X)*0.5-20, FRAME_Y-20-TABLE_ROD_D*0.5-TABLE_ROD_MOUNT_W, 0]) TABLE_ROD();
    MOV([FRAME_X*0.5, FRAME_Y-20-Z_SCREW_D*0.5-Z_SCREW_MOUNT_W, 0]) Z_SCREW();
}

module FRAME(){
    // Z PROFILE
    MOV(X(10)+Y(10)) PROFILE4020(FRAME_Z);
    MOV(X(FRAME_X-30)+Y(10)) PROFILE4020(FRAME_Z);
    MOV(X(10)+Y(FRAME_Y-10)) PROFILE4020(FRAME_Z, FRAME_Z-20);
    MOV(X(FRAME_X-30)+Y(FRAME_Y-10)) PROFILE4020(FRAME_Z-20, FRAME_Z);
    // X PROFILE
    MOV_ROT([40,10,10],Y(90)) PROFILE2020(FRAME_X-80);
    MOV_ROT([40,FRAME_Y-10,10],Y(90)) PROFILE2020(FRAME_X-80);
    MOV_ROT([40,10,FRAME_Z-10],Y(90)) PROFILE2020(FRAME_X-80);
    MOV_ROT([40,FRAME_Y-10,FRAME_Z-30],Y(90)) PROFILE2020(FRAME_X-80);
    // Y PROFILE
    MOV_ROT([10,20,10],X(-90)) PROFILE2020(FRAME_Y-40);
    MOV_ROT([FRAME_X-10,20,10],X(-90)) PROFILE2020(FRAME_Y-40);
    MOV_ROT([10,20,FRAME_Z-10],X(-90)) PROFILE2020(FRAME_Y-40);
    MOV_ROT([FRAME_X-10,20,FRAME_Z-10],X(-90)) PROFILE2020(FRAME_Y-40);

}


