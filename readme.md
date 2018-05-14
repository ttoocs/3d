Some 3D-stuff

Provided under Creative Commons.

#What are .scad?
 * They're openSCAD files. openSCAD is free and cross-platform, and can just be installed locally.

#What is here?
 * A simple parametric raft, using simple spacing. (Better than the default UP3D one)
 * A simple parametric Lego technic bar. (Also has a raft edition, using the above raft file)



# How to nicely balance the Up3D printer.
  * This is going to be tedious, and this is just how I how to do it after finicking about it for 2-3 hours. I have no idea if this is a good or bad method.
  * I just do this every time now, and I balance it with a print-bed on it so that it more accurate for the upcoming print.

  1. Getting something to run across the top that doesn't mess things up:  In up3d software, I get it to extrude a little bit of the filament. (Maintenance -> extrude -> wait till it warms to ~265C -> it will then extrude -> let it extrude abit -> hit the 'stop all'. At which point, you should now have a strand (or a loop) of plastic hanging from the nozzle. (I form it to a loop, so there's no catch at the bottom. I also have it about 1cm / (1/2)inch below the nozzle). Tada, you now have something that isn't the nozzle itself that you can drag around and it doesn't break things. (In theory, you may be thinking you can use the nozzle itself, besides the fact that this makes it hit things constantly, when it hits the bed, the bed kinda shifts, and makes balancing it this way way harder.)
 2. Set it to a height that the plastic almost touches the bed, but you can still see some tiny gap between the plastic and the bed.
 3. Try moving it about, see where the highest and lowest points are (In regards to the 4 corners)
 4. Fiddle screws: The key idea I found here, is that each two screws form a line, and hence the third screw pivots the platform about it. It's the normal righty-tighty lefty-loosey, but is facing away from you if you look down at the platform, so that can be confusing at times.
 5. Goto 2 until actually level.


# Not-up3d rafts.
 * It's coded in OpenSCAD, and simply takes a (X,Y,Z), where Z is height, and half of the Z is used for a solid-medium, and the other half is half-filled (this can be changed inside the raft file). I find using Z=2 is pretty effective, and with the current spacing config it seems pretty easy to remove the object from the raft (I use the big metal flat thing, and just put it between the object/raft, but for smaller ones you can usually just twist it off). Update: It was only easy for a few smaller objects, on a larger object I was printing it became a pain.
 * To actually use it, you will need to import a generic object into openSCAD, an example is included. 
 * **You will need to have the raft larger than the object, otherwise it's just as hard to remove**


# Resuming a print
 * This is gonna be tedious if you need to do this.
 * The up3d software has no support what-so-ever for this.
 * Don't merge objects in the up3d software for printing multiple objects... if you do this, you cannot easily pull positions out again and crop the bottoms off. Rather, merge them somewhere else. (OpenSCAD does this, albeit.. it's lack of object-centering (or putting them on the same Z-axis) will probably lead to unnecessary _fun_.
 * Aaand I did the above, so I have no idea, but I'd just crop the bottom off  via eye-balling it, or maybe count the layers multiply by the print height.

# To not running out of filament during a print
 * It seems that the printer doesn't have enough power to pull the filament fully if it tightly wrapped around, however if you loosen the filament, it seems to work better.
