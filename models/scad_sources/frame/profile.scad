// Profile
include <../config.scad>;
use <../utils.scad>;

PROFILE2020(50);
MOV(Y(50)) PROFILE4020(50, 60);
MOV(Y(-80)) CORNER40402(60);

module CORNER40402(length, w=40, h=40)
{
    color(PROFILE_COLOR)
        union(){
            cube([w, 2, length]);
            cube([2, h, length]);
        }
}


module PROFILE2020(length){
    color(PROFILE_COLOR)
        linear_extrude(height=length, slices=1)
            CONTOUR2020();
    echo (str("PROFILE 20x20x",length));
    
}

module PROFILE4020(length, length2=-1){
    color(PROFILE_COLOR){
        linear_extrude(height=length, slices=1){
            CONTOUR2020();
        }
        linear_extrude(height=(length2<0?length:length2), slices=1){
            MOV(X(20)) CONTOUR2020();
        }
    }
    echo (str("PROFILE 40x20x",(length>length2?length:length2)));
}


module CONTOUR2020(){
    points1 = [
        [3,4],
        [6,7],
        [6,8],
        [3,8],
        [3,9],
        [4,10],
        [9,10],
        [10,9],
        [10,4],
        [9,3],
        [8,3],
        [8,6],
        [7,6],
        [4,3]
    ];
    points2 = [ for(i =[ 0: len(points1) - 1]) MULT2MV(ROTM2(-90), points1[i]) ];
    points3 = [ for(i =[ 0: len(points1) - 1]) MULT2MV(ROTM2(-180), points1[i]) ];
    points4 = [ for(i =[ 0: len(points1) - 1]) MULT2MV(ROTM2(-270), points1[i]) ];
    polygon(concat(points1, points2, points3, points4));
}