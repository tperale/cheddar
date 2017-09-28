$fs = 0.02;
$fa = 0.1;

// datasheet:
pins = 2;
width = (pins-1)*2.5 + 2 * 2.45;
depth = 5.75;
height = 7;
pin_offset_depth = 2.35;
pin_offset_width = 2.45;
raster_width = 2.5;
pin_depth = 3.4;

// measured (also down below in the code)
inner_height = 4.85;
pin_width = 0.63;

// technical stuff
r = "both";

translate([(pins-1)*raster_width, 0, 0])rotate([0, 0, 180])translate([-pin_offset_width, -pin_offset_depth, 0]){
    if (r != "pins"){
        housing();
    }
    if (r != "housing"){
        pins();
    }
}

module housing(){
    color([1, 1, 1])union(){
        difference(){

            // outer
            cube([width, depth, height]);

            // inner
            translate([0.8, 0.7, height-inner_height])cube([width-0.8*2, depth-0.7*2, inner_height]);

            // bits bottom
            for(i=[0:pins-1]){
                translate([pin_offset_width + i*raster_width, 0, 0])bits_bottom();
            }

            // side bits
            translate([0, 0.7, height-3])difference(){
                cube([width, 1, 3]);
                difference(){
                    cube([width, 1, 1]);
                    translate([0, 1, 1])rotate([0, 90, 0])cylinder(width, 1);
                }
            }

            // frontside bits
            bits_frontside();
            translate([width, 0, 0])mirror([1, 0, 0])bits_frontside();

            if(pins == 2)translate([(width-0.8)/2, 0, height-3.75])cube([0.8, 1, 3.75]);
        }

        translate([width/2, 0, 1])rotate([90, 0, 0]){
            linear_extrude(0.1)text("H JST", 2, "serif:style=italic", halign="center", valign="baseline");
            if(pins > 2)translate([0, height-1.5, 0])linear_extrude(0.1)text(str(pins), 2, "serif", halign="center", valign="top");
        }

    }
}

module pins(){
    // pins
    for(i=[0:pins-1]){
        translate([pin_offset_width + i*raster_width, pin_offset_depth, 0])pin();
    }
}



module bits_frontside(){
    translate([1.9, 0, height-3.75])difference(){
        cube([1.5, 1, 3.75]);
        difference(){
            translate([0, 0, 0])cube([1, 1, 1]);
            translate([1, 1, 1])rotate([90, 0, 0])cylinder(1, 1);
        }
        translate([-0.5, 0, 3.0])rotate([0, 45, 0])cube([0.5, 1, 0.5]);
    }
}

module bits_bottom(){
    translate([1.7/2, depth, 0])rotate([90, 0, -90])linear_extrude(1.7)polygon([
        [0, 0], [depth, 0], [depth, 0.5],
        [depth-pin_offset_depth+1, 0.25],
        [depth-pin_offset_depth-1, 0.25],
        [0, 1],
    ]);
}

module pin(){
    color([0.5, 0.5, 0.5])translate([0, 0, -pin_depth]){
        translate([pin_width/-2, pin_width/-2, 0.5])cube([pin_width, pin_width, height-0.5+pin_depth-1]);
        pin_bottom();
        translate([0, 0, height-0.5+pin_depth])mirror([0, 0, 1])pin_bottom();
    }
}
module pin_bottom(){
    rotate([0, 0, 45])cylinder(0.5, 0.2, pin_width/sqrt(2), $fn=4);
}
