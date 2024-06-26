height = 12.0;
thickness = 2.0;
fudge = 0.1;
width = 38.5;
depth = 30.50;

cavity_width = width - (2 * thickness);
cavity_depth = depth - (2 * thickness);
cavity_height = height - thickness + fudge;

hole_radius = 7.0;

slit_width = 4.0;
slit_height = 23.0;

ir_hole_width = 6.75;
ir_hole_height = 5;

// ventilation type - only choose one of these, both false yields a circular hole
ventilation_slats = false;
ventilation_rectangle = false;

// These are slots for pin access, incompatible with slats
dev_slots = true;

// lid
difference() {
    union () {
        translate([-(width / 2.0), 20, 0.0]) cube([width, depth, 2.0]);
        translate([-(cavity_width / 2.0), 22, 2.0]) cube([cavity_width, cavity_depth, 1.5]);
    }

    // ir sensor notch
    translate([-9.5, 48.5, 0 - fudge]) cube([ir_hole_width, thickness + fudge, thickness + (fudge * 2)]);

    if (dev_slots) {
        // slot 1
        rotate([0, 0, 90]) translate([21.9, -12.5, 0 - fudge]) cube([slit_width, slit_height, 10]);
        // slot 2
        rotate([0, 0, 90]) translate([44.6, -12.5, 0 - fudge]) cube([slit_width, slit_height, 10]);
    }

    if (ventilation_slats) {
        // ventilation_slats
        translate([12, 22 + (cavity_depth / 2), 2.5]) cube([1,16,6], center = true);
        translate([9, 22 + (cavity_depth / 2), 2.5]) cube([1,16,6], center = true);
        translate([6, 22 + (cavity_depth / 2), 2.5]) cube([1,16,6], center = true);
        translate([3, 22 + (cavity_depth / 2), 2.5]) cube([1,16,6], center = true);
        translate([0, 22 + (cavity_depth / 2), 2.5]) cube([1,16,6], center = true);
    } else if (ventilation_rectangle) {
        // rectangular hole
        translate([1, 22 + (cavity_depth / 2), 2.5]) cube([11,10,6], center = true);
    } else {
        // circular hole
        translate([1, 22 + (cavity_depth / 2), 2.5]) cylinder(h = 5 + fudge, r1 = hole_radius, r2 = hole_radius, center = true);
    }
}

// base
union() {
    translate([13.5, -(cavity_depth / 2.0), 2]) cube([4.0, cavity_depth, 4.0]);
    translate([-16, -(cavity_depth / 2.0), 2]) cube([4.0, cavity_depth, 2.0]);
    difference () {
        translate([0, 0, height / 2.0]) cube([width, depth, height], center = true);
        translate([0, 0, (cavity_height / 2.0) + thickness]) cube([cavity_width, cavity_depth, cavity_height], center = true);

        // side straight out ir sensor
        translate([-9.5, -16, 7 + fudge]) cube([ir_hole_width, 6, ir_hole_height]);

        // power plug hole
        translate([-20, -6, 1]) cube([3, 12, 8]);
        // reset button hole
        translate([-17.25, 13.0, 4]) cube([7, 3, 4]);

        if (dev_slots) {
            // slot 1
            rotate([0, 0, 90]) translate([9, -12.5, 0 - fudge]) cube([slit_width, slit_height, 5]);
            // slot 2
            rotate([0, 0, 90]) translate([-13, -12.5, 0 - fudge]) cube([slit_width, slit_height, 5]);
        }

        if (ventilation_slats) {
             // ventilation_slats
            translate([12, -13.5 + (cavity_depth / 2), 1]) cube([1,16,2 + fudge], center = true);
            translate([9, -13.5 + (cavity_depth / 2), 1]) cube([1,16,2 + fudge], center = true);
            translate([6, -13.5 + (cavity_depth / 2), 1]) cube([1,16,2 + fudge], center = true);
            translate([3, -13.5 + (cavity_depth / 2), 1]) cube([1,16,2 + fudge], center = true);
            translate([0, -13.5 + (cavity_depth / 2), 1]) cube([1,16,2 + fudge], center = true);
        } else if (ventilation_rectangle) {
            // rectangular hole
            translate([1, 0, thickness / 2.0]) cube([11,8,6], center = true);
        } else {
            // circular hole
            translate([1, 0, thickness / 2.0]) cylinder(h = thickness + fudge, r1 = hole_radius, r2 = hole_radius, center = true);
        }
    }
}
