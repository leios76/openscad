$fn=64;

difference()
{
    union()
    {
        cylinder(h = 20, d = 49);
        translate([0, 0, 20])
        {
            linear_extrude(height=11, scale=[0.36, 0.36])
            {
                circle(d = 49);
            }
        }
        translate([0, 0, 30]) cylinder(h = 20, d = 18);

        translate([0, 0, 60]) rotate([0, 180, 0])
        {
            linear_extrude(height=11, scale=[0.36, 0.36])
            {
                circle(d = 49);
            }
        }
        translate([0, 0, 60]) cylinder(h = 20, d = 49);
    }

    union()
    {
        union()
        {
            cylinder(d = 11.1, h = 7);
            translate([0, 0, 7]) linear_extrude(height=3, scale=[0.001, 0.001])
            {
                circle(d = 10);
            }
        }

        translate([0, 0, 80 - 7]) rotate([0, 0, 0])
        {
            union()
            {
                cylinder(d = 11.1, h = 7);
                rotate([0, 180, 0]) linear_extrude(height=3, scale=[0.001, 0.001])
                {
                    circle(d = 10);
                }
            }
        }
    }

}