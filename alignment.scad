$fn=128;

module alignment(Sz,s){
    x = Sz[0];
    y = Sz[1];
    z = Sz[2];

    
    //Constant Stride
    // /*
    
    stride = y;
    steps = (x/stride);
    
    // */
    union(){
    for(i = [0:steps]){

        translate([(i)*stride,0,0]){
            cylinder(h=z,r1=y/3,r2=y/2*s);
        }
    }
    }
    
}

module alignmentA(Sz){
    alignment(Sz,0.90);
}
module alignmentB(Sz){
     z= Sz[2];
//    translate([0,0,z]){
//    rotate([180,0,0]){
        alignment(Sz,1);
//    }
//    }
}


//difference()
{
    translate([0,0,5]){
        alignmentB([32,5,3]);
    }
alignmentA([32,5,3.01]);
}