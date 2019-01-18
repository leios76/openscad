$fn=64;

BODY_X1=24;
BODY_X2=30;
BODY_Y=154;
BODY_Z=11;
UPPER_HOLE=16.5;

BEARING_D=22.7;
BEARING_H=7;

module smooth(r=1)
{

    offset(r=r)
    offset(r=-r)
    children();
}

union()
{
    difference()
    {

        linear_extrude(height=BODY_Z) smooth(r=2) union()
        {
            hull()
            {
                translate([0, BODY_Y - BODY_X2 - BODY_X1/2, 0]) circle(d=BODY_X1);
                translate([0, BODY_X1/2, 0]) circle(d=BODY_X1);
                
            }
            polygon([[BODY_X1/2, BODY_Y - BODY_X2 - BODY_X1/2], 
            [BODY_X1/2, BODY_Y - BODY_X2 - 5], 
            [BODY_X2/2, BODY_Y - BODY_X2], 
            [BODY_X2/2, BODY_Y], 
            [-BODY_X2/2, BODY_Y], 
            [-BODY_X2/2, BODY_Y-BODY_X2], 
            [-BODY_X1/2, BODY_Y-BODY_X2 - 5], 
            [-BODY_X1/2, BODY_Y-BODY_X2 - BODY_X1/2]]);
        }

        translate([0, BODY_X1/2, 0]) linear_extrude(height=BODY_Z) hull()
        {
            translate([0, 5, 0]) circle(d=UPPER_HOLE);
            circle(d=UPPER_HOLE);
        }

        translate([0, 139, 0]) 
        {
            union()
            {
                cylinder(h=(BODY_Z - BEARING_H) / 2, d=BEARING_D - 2.2);
                translate([0, 0, (BODY_Z - BEARING_H) / 2]) cylinder(h=BEARING_H, d=BEARING_D);
                translate([0, 0, (BODY_Z - BEARING_H) / 2 + BEARING_H]) cylinder(h=(BODY_Z - BEARING_H) / 2, d=BEARING_D - 2.2);
            }
        }

    }
}