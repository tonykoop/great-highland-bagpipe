// Great Highland Bagpipe parametric starter.
// This is a visual/layout master, not a replacement for measured reed-seat CAD.

$fn = 72;

chanter_len = 14.5;
chanter_top_od = 0.88;
chanter_bell_od = 1.25;

tenor_bottom_len = 8;
tenor_top_len = 9;
bass_bottom_len = 8;
bass_middle_len = 15;
bass_top_len = 9;

inch = 25.4;

module pipe_section(len_in, od_in, bore_in, label_offset=0) {
  difference() {
    cylinder(h=len_in*inch, d=od_in*inch);
    translate([0,0,-1]) cylinder(h=len_in*inch+2, d=bore_in*inch);
  }
}

module chanter() {
  difference() {
    cylinder(h=chanter_len*inch, d1=chanter_bell_od*inch, d2=chanter_top_od*inch);
    translate([0,0,-1]) cylinder(h=chanter_len*inch+2, d1=0.800*inch, d2=0.157*inch);
  }
}

module tenor_drone() {
  pipe_section(tenor_bottom_len, 0.95, 0.344);
  translate([0,0,tenor_bottom_len*inch + 8])
    pipe_section(tenor_top_len, 0.95, 0.563);
}

module bass_drone() {
  pipe_section(bass_bottom_len, 1.05, 0.375);
  translate([0,0,bass_bottom_len*inch + 8])
    pipe_section(bass_middle_len, 1.05, 0.438);
  translate([0,0,(bass_bottom_len+bass_middle_len)*inch + 16])
    pipe_section(bass_top_len, 1.05, 0.625);
}

translate([-80,0,0]) chanter();
translate([0,0,0]) tenor_drone();
translate([45,0,0]) tenor_drone();
translate([95,0,0]) bass_drone();
