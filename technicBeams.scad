
//Technic params.
    $fn=128;

    eps = 0.05;
    
    Pitch = 8;
    Radius1 = 4.8 / 2;
    Radius2 = 6.1 / 2;
    Height = 7.8;
    Depth = 0.8;
    Width = 7.5;
    MidThickness = 2;


module technicHolePunch(){
    union(){
        translate([0,0,-eps]) cylinder(r=Radius2,h=Depth+eps);
        translate([0,0,-eps]) cylinder(r=Radius1,h=Height+2*eps);
		translate([0,0,Height-Depth]) cylinder(r=Radius2,h=Depth+eps);
        }
}

module technicHole(midSupport=false){

    Length = Pitch;
    
    difference(){
        union() {
            cylinder(r=Width/2, h=Height);
            if (midSupport==true)
            {
                translate([-Pitch/2, -Width/2, Height/2-MidThickness/2]) cube([Pitch, Width, MidThickness]);
            }
        }
        technicHolePunch();
    }
}


module technicBeam(NrOfHoles){
    
    Length = (NrOfHoles - 1) * Pitch;
	Thickness = (Width - 2 * Radius2) / 2;
    
    translate([0,-Width/2,0]){
    
    difference(){
    union() {
        cube([Length, Thickness, Height]);
        translate([0, Width-Thickness,0]) cube([Length, Thickness, Height]);
        translate([0, 0, Height/2-MidThickness/2]) cube([Length, Width, MidThickness]);
        
        for(i = [1:NrOfHoles]){
            translate([(i-1)*Pitch, Width/2,0]){
                technicHole();
            }
        }
    }
        for(i = [1:NrOfHoles]){
            translate([(i-1)*Pitch, Width/2,0]){
                technicHolePunch();
            }
        }
    }
}
}

module technicSolidBeam(NrOfHoles){
    Length = (NrOfHoles - 1) * Pitch;
	Thickness = (Width - 2 * Radius2) / 2;
    
    difference(){
        union(){
            translate([0,,0]){
                technicHole();
            }
            translate([Length,,0]){
                technicHole();
            }
            translate([0,-Width/2,0]){
                cube([Length,Width,Height]);
            }
        }
        union(){
            for(i = [1:NrOfHoles]){
                translate([(i-1)*Pitch, 0,0]){
                    technicHolePunch();
                }
            }
        }
        
    }
    
}

//technicSolidBeam(3);
//technicBeam(6);