select F.fofId,F.x,F.y,F.z,F.np
  from MField..FOF as F
 where F.snapnum=63
 and F.x<400
 and F.y<400
 and F.z<400
 and F.np>500000
