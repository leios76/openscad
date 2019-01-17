$fn=64;
CLEARANCE=0.0001;

module M3_hole(x, y, height)
{
    translate([x, y, 0]) union()
    {
        cylinder(d=3.8, h= 3);  // M4 나사 홀
        translate([0, 0, 3]) cylinder(d=5.7, h=height - 3);    // M4 머리
    }    
}

module M4_hole(x, y, height)
{
    translate([x, y, 0]) union()
    {
        cylinder(d=4.5, h= 3);  // M4 나사 홀
        translate([0, 0, 3]) cylinder(d=8, h=height - 3);    // M4 머리
    }    
}

module SC8UU_hole(x, y, height)
{
    M4_hole(x + 4, y + 4, 9);
    M4_hole(x + 18 + 4, y + 4, 9);

    M4_hole(x + 4, y + 24 + 4, 9);
    M4_hole(x + 18 + 4, y + 24 + 4, 9);

}

BODY_X=35;
BODY_Y=86;
BODY_Z=7;

difference()
{
    union()
    {
        cube([BODY_X, BODY_Y, BODY_Z]);      // 바디
        translate([32.5, 20.1 + 5, 0]) rotate([90, 0, 0])
        {
            difference()
            {
                cube([36, 14, 5]);
                translate([8.25 + 3.8/2, 5.1 + 3.8/2, 0]) cylinder(d=3.8, h=5);
                translate([26.25 + 3.8/2, 5.1 + 3.8/2, 0]) cylinder(d=3.8, h=5);
            }
        }
        translate([0, 26.4, 39]) rotate([0, 90, 0])
        {
            difference()
            {
                cube([38, 14, 6]);
                translate([2.45 + 3.8/2, 3.65 + 3.8/2, 0]) cylinder(d=3.8, h=6);
                translate([26.45 + 3.8/2, 3.65 + 3.8/2, 0]) cylinder(d=3.8, h=6);
            }
        }
        translate([0, 76, 0]) cube([6, 10, 20]);
    }

    SC8UU_hole(7, 2, BODY_Z);
    SC8UU_hole(7, 48, BODY_Z);

    M3_hole(11.87, 38.52, BODY_Z);
    M3_hole(23.87, 38.52, BODY_Z);

}