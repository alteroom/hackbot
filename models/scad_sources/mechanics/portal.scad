// Mechanics/Portal
include <../config.scad>
use <../frame/profile.scad>
use <../utils.scad>;
use <../mechanics/bearing.scad>;
use <../mechanics/screw.scad>;

PORTAL();


module PORTAL(){
    MOV(Y(20)){
        difference(){
            MOV_ROT([0, 0, 0],[0,-90,180]) CORNER40402(FRAME_X, w=PORTAL_H);
            MOV([-1, -3, 4]) cube([21, 4, PORTAL_H-3]);
            MOV([FRAME_X-20, -3, 4]) cube([21, 4, PORTAL_H-3]);
            MOV([20+RAIL_X_OFFSET, -20-MGN9C_Y-2, -1]) cube([RAIL_X, 20-MGN9C_Y*0.5+2, 4]);
        }
        
        MOV([20+RAIL_X_OFFSET, -20-RAIL_W*0.5, 2]) MGN9(RAIL_X);
        
        CARET_X1(X_MIN + X1_POS);
        CARET_X2(X_MIN + X2_POS);
        
        MOV_ROT([MGN9C_Y, -MGN9C_X*0.5-20, 2], Z(90)) MGN9C();
        MOV_ROT([FRAME_X, -MGN9C_X*0.5-20, 2], Z(90)) MGN9C();
        
        MOV([PORTAL_CORE_X1, -20]) 
            M3_SPACER_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([PORTAL_CORE_X2, -20+PORTAL_CORE_Y]) 
            F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([PORTAL_CORE_X2, -20])
            F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([PORTAL_CORE_X2, -20-PORTAL_CORE_Y])
            F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);

        MOV([FRAME_X-PORTAL_CORE_X1, -20]) 
            M3_SPACER_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([FRAME_X-PORTAL_CORE_X2, -20+PORTAL_CORE_Y]) 
            F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([FRAME_X-PORTAL_CORE_X2, -20])
            F623_TOP_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        MOV([FRAME_X-PORTAL_CORE_X2, -20-PORTAL_CORE_Y])
            F623_BOTTOM_STACK(PORTAL_CORE_TOP, PORTAL_CORE_H, PORTAL_CORE_BOTTOM+2);
        
        MOV([PORTAL_CORE_X1, -20, 2]) 
            PORTAL_CORE(PORTAL_CORE_BOTTOM);
        MOV([PORTAL_CORE_X1, -20, 2+PORTAL_CORE_H+PORTAL_CORE_BOTTOM]) 
            PORTAL_CORE(PORTAL_CORE_TOP);
        MOV_ROT([FRAME_X-PORTAL_CORE_X1, -20, 2], Z(180)) 
            PORTAL_CORE(PORTAL_CORE_BOTTOM);
        MOV_ROT([FRAME_X-PORTAL_CORE_X1, -20, 2+PORTAL_CORE_H+PORTAL_CORE_BOTTOM], Z(180)) 
             PORTAL_CORE(PORTAL_CORE_TOP);
    }
}

//BELT_X2(30, 50, FRAME_X-30, -50, 20, 0, 20);
//BELT_X1(30, 50, FRAME_X-30, -50, 20, 0, 10);

module BELT_X1(left, top, right, bottom, x, y, z){
    color(BELT_X1_COLOR){
        MOV([left-BELT_D*0.5, bottom, z])
            cube([BELT_W, top-bottom, BELT_H]);
        
        MOV([left+BELT_D*0.5-2, bottom, z])
            cube([BELT_W, y-bottom-PORTAL_CORE_Y, BELT_H]);
        MOV([left+BELT_D*0.5-2, y+PORTAL_CORE_Y, z])
            cube([BELT_W, top-y-PORTAL_CORE_Y, BELT_H]);
        MOV([PORTAL_CORE_X2, y+PORTAL_CORE_Y*0.5-1, z])
            cube([FRAME_X-PORTAL_CORE_X2*2, BELT_W, BELT_H]);
        MOV([PORTAL_CORE_X2, y-PORTAL_CORE_Y*0.5-1, z])
            cube([FRAME_X-PORTAL_CORE_X2*2, BELT_W, BELT_H]);
        
        MOV([left, top, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, -BELT_D*0.5,-0.1]) cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
            }
        }
        MOV([left, bottom, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, 0,-0.1]) cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
            }
        }
        MOV([FRAME_X-PORTAL_CORE_X2, y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, -BELT_D*0.5,-0.1]) cube([BELT_D*0.5, BELT_D, BELT_H+0.2]);
            }

        }

        MOV([PORTAL_CORE_X2, y+PORTAL_CORE_Y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, 0, -0.1]) 
                    cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
                MOV([0, -BELT_D*0.5,-0.1]) 
                    cube([BELT_D*0.5, BELT_D*0.5+0.1, BELT_H+0.2]);
            }
        }

        MOV([PORTAL_CORE_X2, y-PORTAL_CORE_Y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5-0.1, -BELT_D*0.5-0.1, -0.1]) 
                    cube([BELT_D+0.2, BELT_D*0.5+0.2, BELT_H+0.2]);
                MOV([-0.1, -0.1,-0.1]) 
                    cube([BELT_D*0.5+0.2, BELT_D*0.5+0.2, BELT_H+0.2]);
            }
                
        }

        
    }
}

module BELT_X2(left, top, right, bottom, x, y, z){
    color(BELT_X2_COLOR){
        MOV([FRAME_X-left+BELT_D*0.5-2, bottom, z])
            cube([BELT_W, top-bottom, BELT_H]);
        
        MOV([FRAME_X-left-BELT_D*0.5, bottom, z])
            cube([BELT_W, y-bottom-PORTAL_CORE_Y, BELT_H]);
        MOV([FRAME_X-left-BELT_D*0.5, y+PORTAL_CORE_Y, z])
            cube([BELT_W, top-y-PORTAL_CORE_Y, BELT_H]);
        MOV([PORTAL_CORE_X2, y+PORTAL_CORE_Y*0.5-1, z])
            cube([FRAME_X-PORTAL_CORE_X2*2, BELT_W, BELT_H]);
        MOV([PORTAL_CORE_X2, y-PORTAL_CORE_Y*0.5-1, z])
            cube([FRAME_X-PORTAL_CORE_X2*2, BELT_W, BELT_H]);
        
        MOV([right, top, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, -BELT_D*0.5,-0.1]) cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
            }
        }
        MOV([right, bottom, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, 0,-0.1]) cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
            }
        }
        MOV([PORTAL_CORE_X2, y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([0, -BELT_D*0.5,-0.1]) cube([BELT_D*0.5, BELT_D, BELT_H+0.2]);
            }

        }

        MOV([FRAME_X-PORTAL_CORE_X2, y+PORTAL_CORE_Y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5, 0, -0.1]) 
                    cube([BELT_D, BELT_D*0.5, BELT_H+0.2]);
                MOV([-BELT_D*0.5, -BELT_D*0.5,-0.1]) 
                    cube([BELT_D*0.5, BELT_D*0.5+0.1, BELT_H+0.2]);    
            }
            
        }

        MOV([FRAME_X-PORTAL_CORE_X2, y-PORTAL_CORE_Y, z]){
            difference(){
                cylinder(d=BELT_D, h=BELT_H);
                MOV(Z(-0.1)) cylinder(d=BELT_D-2*BELT_W, h=BELT_H+0.2);
                MOV([-BELT_D*0.5-0.1, -BELT_D*0.5-0.1, -0.1]) 
                    cube([BELT_D+0.2, BELT_D*0.5+0.2, BELT_H+0.2]);
                MOV([-BELT_D*0.5-0.1, -0.1,-0.1]) 
                    cube([BELT_D*0.5+0.2, BELT_D*0.5+0.2, BELT_H+0.2]);  
            }
               
        }

        
    }
}


module CARET_X1(position){
    MOV([position-CARET_W*0.5, -20-MGN9C_Y*0.5, MGN9C_H+2]) MGN9C();
    
}
module CARET_X2(position){
    MOV([position-CARET_W*0.5, -20-MGN9C_Y*0.5, MGN9C_H+2]) MGN9C();

}


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

module PORTAL_CORE(h){
    pts = [
        [0, 0], 
        [PORTAL_CORE_X2-PORTAL_CORE_X1, -PORTAL_CORE_Y], 
        [PORTAL_CORE_X2-PORTAL_CORE_X1, 0], 
        [PORTAL_CORE_X2-PORTAL_CORE_X1, PORTAL_CORE_Y]
    ]; 
    color(PRINT_COLOR)
        linear_extrude(height=h)
            difference(){
                offset(r=PORTAL_CORE_R)
                    polygon(pts);
                for(i=[0:len(pts)-1])
                    translate(pts[i])
                        circle(d=3);
            }
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