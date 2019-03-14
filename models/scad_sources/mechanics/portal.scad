// Mechanics/Portal
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;
use <../mechanics/bearing.scad>;
use <../mechanics/screw.scad>;

PORTAL();

module M3STACK(inner){
    MOV_ROT(Z(inner+M3_H+M3_SPACER_H), X(180)) 
        M3SCREW(M3_SPACER_H*2+M3_H*2+inner);
    MOV_ROT(Z(inner+M3_SPACER_H), X(180)) 
        M3SPACER();
    MOV_ROT(Z(-M3_SPACER_H), X(0)) 
        M3SPACER();
    MOV_ROT(Z(-M3_SPACER_H-M3_H), X(0)) 
        M3NUT();
}

module M3_SPACER_STACK(top, inner, bottom){   
    M3STACK(top+inner+bottom); 
    MOV_ROT(Z(bottom), X(0)) 
        M3SPACER_PRINT(inner);
}

module F623_TOP_STACK(top, inner, bottom){   
    M3STACK(top+inner+bottom); 
    MOV_ROT(Z(inner+bottom), X(180)) 
        M3SPACER();
    MOV_ROT(Z(inner+bottom-M3_SPACER_H), X(180)) 
        F623ZZ();
    MOV_ROT(Z(inner+bottom-F623_H-M3_SPACER_H), X(180)) 
        M3SPACER();
     MOV_ROT(Z(inner+bottom-F623_H*2-M3_SPACER_H*2), X(0)) 
        F623ZZ();
    MOV_ROT(Z(bottom), X(0)) 
        M3SPACER_PRINT(inner-2*M3_SPACER_H-2*F623_H);
}

module F623_BOTTOM_STACK(top, inner, bottom){    
    M3STACK(top+inner+bottom); 
    MOV_ROT(Z(bottom), X(0)) 
        M3SPACER();
    MOV_ROT(Z(bottom+M3_SPACER_H), X(0)) 
        F623ZZ();  
    MOV_ROT(Z(bottom+F623_H+M3_SPACER_H), X(0)) 
        M3SPACER();
     MOV_ROT(Z(bottom+F623_H*2+M3_SPACER_H*2), X(180)) 
        F623ZZ();
    MOV_ROT(Z(bottom+2*M3_SPACER_H+2*F623_H), X(0)) 
        M3SPACER_PRINT(inner-2*M3_SPACER_H-2*F623_H);
}

module PORTAL(){
    MOV_ROT([0, 0, 0],[0,-90,180]) CORNER40402(FRAME_X, w=PORTAL_H);
    MOV([20+RAIL_X_OFFSET, -20-RAIL_W*0.5, 2]) MGN9(RAIL_X);
    MOV([FRAME_X*0.25, -20-MGN9C_Y*0.5, MGN9C_H+2]) MGN9C();
    MOV([FRAME_X*0.75, -20-MGN9C_Y*0.5, MGN9C_H+2]) MGN9C();
    MOV_ROT([MGN9C_Y, -MGN9C_X*0.5-20, PORTAL_H], Z(90)) MGN9C();
    MOV_ROT([FRAME_X, -MGN9C_X*0.5-20, PORTAL_H], Z(90)) MGN9C();
    
    MOV([PORTAL_CORE_X1, -20]) 
        M3_SPACER_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([PORTAL_CORE_X2, -6]) 
        F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([PORTAL_CORE_X2, -20])
        F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([PORTAL_CORE_X2, -34])
        F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);

    MOV([FRAME_X-PORTAL_CORE_X1, -20]) 
        M3_SPACER_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([FRAME_X-PORTAL_CORE_X2, -6]) 
        F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([FRAME_X-PORTAL_CORE_X2, -20])
        F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    MOV([FRAME_X-PORTAL_CORE_X2, -34])
        F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_H);
    
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