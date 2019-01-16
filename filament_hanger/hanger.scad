$fn=64;

CLEARANCE=0.1;

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

        linear_extrude(height=11) smooth(r=2) union()
        {
            hull()
            {
                translate([0, 124 - 24/2, 0]) circle(d=24);
                translate([0, 24/2, 0]) circle(d=24);
                
            }
            polygon([[12, 124 - 24/2], [12, 124 - 5], [15, 124], [15, 154], [-15, 154], [-15, 124], [-12, 124 - 5], [-12, 124 - 24/2]]);
        }

        translate([0, 24/2, -CLEARANCE]) linear_extrude(height=11 + CLEARANCE * 2) hull()
        {
            translate([0, 5, 0]) circle(d=16.5);
            circle(d=16.5);
        }

        translate([0, 139, 0]) 
        {
            translate([0, 0, -CLEARANCE]) union()
            {
                cylinder(h=2 + CLEARANCE, d=20.4);
                translate([0, 0, 2 + CLEARANCE]) cylinder(h=7, d=22.5);
                translate([0, 0, 9 + CLEARANCE]) cylinder(h=2 + CLEARANCE, d=20.4);
            }
        }

    }
}