// parameters
groups = 4;
char_width = 10;
char_height = char_width * 2;

/*
        /\
       /  \
       /  \
      /  o \
      /    \
     / u    \
     --------
        ||
        ||
*/

module trunk_profile() {
    square([1*char_width, 2*char_height]);
}

module group_profile(i, length) {
    translate([0,(length - i)*char_height*2]) {
        polygon([
            [0,0],
            [i*char_width, 0],
            [(i+1+1)*char_width, -1 * (2*char_height)],
            [0, -1 * (2*char_height)],
        ]);
    }
}

module group_profiles(length) {
    for (i = [0:length-1]) {
        group_profile(i, length);
    }
}

module tree_profile() {
    trunk_profile();
    translate([0, 2*char_height]) {
        group_profiles(groups);
    }
}

module hello_xmas() {
    rotate_extrude(angle=360) {
        tree_profile();
    }
    cylinder(h=10, r1=40, r2=35);
}

$fn=300;
hello_xmas();