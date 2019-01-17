BODY_X=35;
BODY_Y=86;
BODY_Z=7;


//=========================

$fn=64;

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

difference()
{
    union()
    {
        // SC8UU 결합체
        translate([0 + 1, 0 + 1, 0 + 1]) minkowski()
        {
            cube([BODY_X - 2, BODY_Y - 2, BODY_Z - 2]);      // 바디
            sphere(d=2);
        }
        linear_extrude(height=3) offset(r=1) offset(r=-1) square([BODY_X, BODY_Y]);

        // BL-Touch 홀더
        translate([32.5, 20.1 + 5, 0]) rotate([90, 0, 0])
        {
            difference()
            {
                union()
                {
                    translate([0 + 1, 0 + 1, 0 + 1]) minkowski()
                    {
                        cube([36 - 2, 14 - 2, 5 - 2]);
                        sphere(d=2);
                    }
                    linear_extrude(height=3) offset(r=1) offset(r=-1) square([36, 14]);
                }

                translate([8.25 + 3.8/2, 5.1 + 3.8/2, 0]) cylinder(d=3.8, h=5);
                translate([26.25 + 3.8/2, 5.1 + 3.8/2, 0]) cylinder(d=3.8, h=5);
            }
        }
        translate([32.5, 20.1, 0]) linear_extrude(height=3) offset(r=1) offset(r=-1) square([36, 5]);
        translate([32.5, 20.1 + 2, 0]) cube([36, 3, 3]);

        // E3D V6 노즐 홀더
        translate([0, 26.4, 39]) rotate([0, 90, 0])
        {
            difference()
            {
                translate([0 + 1, 0 + 1, 0 + 1]) minkowski()
                {
                    cube([38 - 2, 14 - 2, 6 - 2]);
                    sphere(d=2);
                }
                translate([2.45 + 3.8/2, 3.65 + 3.8/2, 0]) cylinder(d=3.8, h=6);
                translate([26.45 + 3.8/2, 3.65 + 3.8/2, 0]) cylinder(d=3.8, h=6);
            }
        }

        // End-stop 누름쇠
        translate([0 + 1, 76 + 1, 0 + 1]) minkowski()
        {
            cube([6 - 2, 10 - 2, 20 - 2]);
            sphere(d=2);
        }
    }

    SC8UU_hole(7, 2, BODY_Z);
    SC8UU_hole(7, 48, BODY_Z);

    M3_hole(11.87, 38.52, BODY_Z);
    M3_hole(23.87, 38.52, BODY_Z);
}