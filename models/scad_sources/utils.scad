//Utils
include <config.scad>;

module MOV(mov)
{
    translate(mov)
        children();
}

module ROT(rot)
{
    rotate(rot)
        children();
}

module ROT_MOV(rot, mov)
{
    rotate(rot) 
        translate(mov)
            children();
}

module MOV_ROT(mov, rot)
{
    translate(mov)
        rotate(rot) 
            children();
}

function MULT2MV (m, v) = 
[
    m[0][0]*v[0] + m[0][1]*v[1],
    m[1][0]*v[0] + m[1][1]*v[1],
];

function ROTM2(angle) = 
[
    [cos(angle), -sin(angle)],
    [sin(angle), cos(angle)]
];

function X(x) = [x, 0, 0];

function Y(y) = [0, y, 0];

function Z(z) = [0, 0, z];