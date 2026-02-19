/*
    Magnet-Tag Generator
    ------------------------
    https://github.com/nirastich/magnet-tag
 
    by Christian Leroch
    www.Leroch.net
    
    License: Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)
    https://creativecommons.org/licenses/by-nc/4.0/
 
    You may remix, adapt, and build upon this work non-commercially, as long as you credit the original creator.
*/

// preview[view:south, tilt:top]

/* [Tag] */

// Text
input = "Custom Text";
// Bold text
bold = true; // [true, false]
// Height of the text (mm)
text_size = 10; // [0.1:0.1:25]
// Cut text into tag instead of extruding out
text_invert = false; // [true, false]
// Text depth (mm)
text_depth = 0.4; // [0.1:0.1:3]
// Margin (mm)
margin = 3; // [0:0.1:10]
// Radius of tag corners (mm)
tag_radius = 3; // [0:0.1:5]
// Magnet diameter (mm)
magnet_diameter = 6; // [1:0.5:20]
// Magnet height (mm)
magnet_height = 2; // [1:0.1:10]
// Magnet tolerance (mm)
magnet_tolerance = 0.4; // [0:0.05:1]

/* [Advanced] */

// Thickness under magnet (mm)
magnet_under = 0.4; // [0:0.1:5]
// Thickness above magnet (mm)
magnet_above = 0.6; // [0:0.1:5]
// Font width factor (calibrate to font)
font_factor = 0.8;
// Max spacing between magnet holes (mm)
magnet_max_spacing = 30;

// Tag color
tag_color = "white";
// Text color
text_color = "black";

/* [Hidden] */

font = bold
    ? "Liberation Mono:style=Bold"
    : "Liberation Mono:style=Regular";

function text_width(str, size = 10, factor = 0.6) =
    len(str) * size * factor;

magnet_height_tol = magnet_height + 0.1;
magnet_diameter_tol = magnet_diameter + magnet_tolerance;

tag_width  = text_width(input, text_size, font_factor) + margin * 2;
tag_height = text_size + margin * 2;
tag_depth  = text_invert ? magnet_height_tol + magnet_under + magnet_above + text_depth : magnet_height_tol + magnet_under + magnet_above;

eps = 0.01;

nametag();

module nametag() {
    if (text_invert) {
        difference() {
            base_tag();
            translate([0, 0, tag_depth / 2 - text_depth / 2 + eps])
                text_extrude(text_depth + eps * 2);
        }
    } else {
        base_tag();
        color(text_color)
            translate([0, 0, tag_depth / 2])
                text_extrude(text_depth);
    }
}

module text_extrude(depth) {
    linear_extrude(depth, center = true)
        text(input,
             size   = text_size,
             halign = "center",
             valign = "center",
             font   = font);
}

module base_tag() {
    difference() {
        color(tag_color)
            rounded_box(tag_width, tag_height, tag_depth, tag_radius);
        magnet_holes();
    }
}

module rounded_box(w, h, d, r) {
    hull() {
        for (x = [-(w/2 - r), w/2 - r],
             y = [-(h/2 - r), h/2 - r])
            translate([x, y, 0])
                cylinder(d, r, r, center = true, $fn = 50);
    }
}

module magnet_holes() {
    min_spacing = magnet_diameter_tol;
    usable_width = tag_width - magnet_diameter_tol * 2;

    total_needed = max(1, floor(usable_width / magnet_max_spacing) + 1);
    total_fits = max(1, floor(usable_width / min_spacing) + 1);

    total = min(total_needed, total_fits);

    if (total <= 1) {
        magnet_hole();
    } else {
        spacing = usable_width / (total - 1);
        for (i = [0 : total - 1])
            translate([i * spacing - usable_width / 2, 0, 0])
                magnet_hole();
    }
}

module magnet_hole() {
    translate([0, 0, (magnet_height_tol) / 2 - tag_depth / 2 + magnet_under])
        cylinder(magnet_height_tol, d = magnet_diameter_tol, center = true, $fn = 50);
    // Visual indicator for magnets
    %translate([0, 0, magnet_under / 2 - tag_depth / 2 - eps])
        cylinder(magnet_under, d = magnet_diameter_tol, center = true, $fn = 50);
}
