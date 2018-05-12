
//Technic params.
    $fn=128;

    
    
    technicRescale = 1.00;
    //1.04, good for clippy things, nogood for slidy.
    
    eps = 0.05 * technicRescale;
    
    technicPitch = 8 * technicRescale;
    technicRadius1 = (4.8 / 2)* technicRescale;
    technicRadius2 = (6.1 / 2)* technicRescale;
    technicHeight = 7.8* technicRescale;
    technicDepth = 0.8* technicRescale;
    technicWidth = 7.5* technicRescale;
    technicMidThickness = 2* technicRescale;    

use <raft.scad>

module technicHolePunch(){
    union(){
        translate([0,0,-eps]) cylinder(r=technicRadius2,h=technicDepth+eps);
        translate([0,0,-eps]) cylinder(r=technicRadius1,h=technicHeight+2*eps);
		translate([0,0,technicHeight-technicDepth]) cylinder(r=technicRadius2,h=technicDepth+eps);
        }
}
//technicHolePunch();


module technicHole(midSupport=false){

    Length = technicPitch;
    
    difference(){
        union() {
            cylinder(r=technicWidth/2, h=technicHeight);
            if (midSupport==true)
            {
                translate([-technicPitch/2, -technicWidth/2, technicHeight/2-technicMidThickness/2]) cube([technicPitch, technicWidth, technicMidThickness]);
            }
        }
        technicHolePunch();
    }
}

//technicHole();

module technicBeam(NrOfHoles){
    
    Length = (NrOfHoles - 1) * technicPitch;
	Thickness = (technicWidth - 2 * technicRadius2) / 2;
    
//    translate([0,-technicWidth/2,0])
    translate([technicPitch/2,0,0])
    {
    
    difference(){
    union() {
        cube([Length, Thickness, technicHeight]);
        translate([0, technicWidth-Thickness,0]) cube([Length, Thickness, technicHeight]);
        translate([0, 0, technicHeight/2-technicMidThickness/2]) cube([Length, technicWidth, technicMidThickness]);
        
        for(i = [1:NrOfHoles]){
            translate([(i-1)*technicPitch, technicWidth/2,0]){
                technicHole();
            }
        }
    }
        for(i = [1:NrOfHoles]){
            translate([(i-1)*technicPitch, technicWidth/2,0]){
                technicHolePunch();
            }
        }
    }
}
}

module technicSolidBeam(NrOfHoles){
    Length = (NrOfHoles - 1) * technicPitch;
	Thickness = (technicWidth - 2 * technicRadius2) / 2;
    translate([technicPitch/2,technicWidth/2,0]){
        
    difference(){
        union(){
            translate([0,,0]){
                technicHole();
            }
            translate([Length,,0]){
                technicHole();
            }
            translate([0,-technicWidth/2,0]){
                cube([Length,technicWidth,technicHeight]);
            }
        }
        union(){
            for(i = [1:NrOfHoles]){
                translate([(i-1)*technicPitch, 0,0]){
                    technicHolePunch();
                }
            }
        }
        
    }
    }
    
}

module technicRaft(NrOfHoles){
    Length = (NrOfHoles - 1) * technicPitch + (1.666*technicPitch);
    RaftDepth=2;
    union(){
    translate([-technicPitch/3,-technicWidth/4,0]){
        raft([Length*1,technicWidth*1.5,RaftDepth]);  
        //cube([1,1,2*RaftDepth]); //Re-use old raft
    }
    
     
    
    translate([0,0,RaftDepth]){
        //technicBeam(NrOfHoles);
        technicSolidBeam(NrOfHoles);
    }
    }
}

//technicSolidBeam(3);
//technicRaft(13);
//technicBeam(3);


