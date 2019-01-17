BOTTOM_X=30;
BOTTOM_Y=28;
BOTTOM_Z=9;

TOP_X=30;
TOP_Y=13;
TOP_Z=17;

LOOSE_M3_HOLE=3.9;
TIGHT_M3_HOLE=2.9;

LEADSCREW_HOLE=9;

LEADSCREW_NUT_Z=2;
LEADSCREW_NUT_HOLE=10.60;

//=============
$fn=64;

module round_cube(size, r=[1, 1, 1, 1])
{
    difference()
    {
        cube(size);

        if (r[0] > 0)
        {
            translate([r[0], r[0], 0]) rotate([0, 0, 180]) difference()
            {
                cube([r[0] * 2, r[0] * 2, size[2]]);
                cylinder(h = size[2], d = r[0] * 2);
            }
        }

        if (r[1] > 0)
        {
            translate([r[1], size[1] - r[1], 0]) rotate([0, 0, 90]) difference()
            {
                cube([r[1] * 2, r[1] * 2, size[2]]);
                cylinder(h = size[2], d = r[1] * 2);
            }
        }

        if (r[2] > 0)
        {
            translate([size[0] - r[2], size[1] - r[2], 0]) rotate([0, 0, 0]) difference()
            {
                cube([r[2] * 2, r[2] * 2, size[2]]);
                cylinder(h = size[2], d = r[2] * 2);
            }
        }

        if (r[3] > 0)
        {
            translate([size[0] - r[3], r[3], 0]) rotate([0, 0, 270]) difference()
            {
                cube([r[3] * 2, r[3] * 2, size[2]]);
                cylinder(h = size[2], d = r[3] * 2);
            }
        }
    }
}

difference()
{
    union()
    {
        round_cube([BOTTOM_X, BOTTOM_Y, BOTTOM_Z], [1, 1, 1, 1]);

        translate([0, 0, BOTTOM_Z])
        {
            round_cube([TOP_X, TOP_Y, TOP_Z], [1, 0, 0, 1]);
        }
    }

    // 리드 스크류 구멍
    translate([(TOP_X / 2), TOP_Y, 0])
    {
        translate([0, 0, LEADSCREW_NUT_Z])
        {
            cylinder(h=(TOP_Y + BOTTOM_Y), d=LEADSCREW_HOLE);
        }
        translate([0, 0, LEADSCREW_NUT_Z])
        {
            minkowski()
            {
                cylinder(h=1, d=LEADSCREW_NUT_HOLE - 5);
                sphere(d=5);
            }

        }
        cylinder(h=LEADSCREW_NUT_Z, d=LEADSCREW_NUT_HOLE);
        translate([-8, 0, 0])
        {
            cylinder(h=BOTTOM_Z, d=TIGHT_M3_HOLE);
        }
        translate([8, 0, 0])
        {
            cylinder(h=BOTTOM_Z, d=TIGHT_M3_HOLE);
        }
        translate([0, -8, 0])
        {
            cylinder(h=BOTTOM_Z, d=TIGHT_M3_HOLE);
        }
        translate([0, 8, 0])
        {
            cylinder(h=BOTTOM_Z, d=TIGHT_M3_HOLE);
        }

    }

    // 바디 결합 M3 나사 구멍
    translate([TOP_X / 2, 0, BOTTOM_Z + TOP_Z / 2])
    {
        translate([10.75, 0, 0])
        {
            rotate([-90, 0, 0])
            {
                cylinder(h=TOP_Y, d=LOOSE_M3_HOLE);
            }
        }

        translate([-10.75, 0, 0])
        {
            rotate([-90, 0, 0])
            {
                cylinder(h=TOP_Y, d=LOOSE_M3_HOLE);
            }
        }
    }
}