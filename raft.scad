
// Size in XYZ, alt W, step-size
module raftSlice(Sz){
    x = Sz[0];
    y = Sz[1];
    z = Sz[2];
    //steps =Sz[3];
    
    //Constant steps
    /*
    steps = 10;
    stride = x/steps;
    // */
    
    //Constant Stride
    // /*
    stride = 0.5;
    steps = x/stride;
    
    // */
    union(){
    for(i = [1:steps]){
        /* //Y-hopps
        for( j = [1:x*steps
        
        */
        translate([(i-1)*stride,0,0]){
            cube([stride/2,y,z]);
        }
    }
    }
    
}


module raft(Sz){
    x = Sz[0];
    y = Sz[1];
    z = Sz[2];
    union(){
        cube([x,y,z/2]);
        translate([0,0,z/2]){
            raftSlice([x,y,z/2]);
        }
    }
}
raft([10,1,1]);