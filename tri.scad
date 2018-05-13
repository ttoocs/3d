module tri(center=false){
    
    if(center == false){
        /* //Made it via poly, apprently not a thing?
        polyhedron(points=
        [[0,0,0],[sin(60),cos(60),0],[0,1,0],
         [0,0,1],[sin(60),cos(60),1],[0,1,1]],
        faces=[[0,1,2],[3,4,5],[0,3,4,1],[4,1,2,5],[2,5,3,0]]);
        // */
        
        scale([2,2,1]){
        difference()
        {
            cube([1,1,1]);

            union(){
                translate([0,0,-0.2]){
            rotate([0,0,-60]){
                cube([1,2,1.5]);
            }}
            translate([sin(60),0,-0.2]){
            rotate([0,0,60]){

                cube([1,2,1.5]);
                }
            }
            }
        }
        }
    } //End non-center.
    else
    {   //Surprise, just move it.
        translate([-sin(60)/3,-.5,0]){
            tri(center=false);
        }
    }
}

//tri();
//tri(center=true);