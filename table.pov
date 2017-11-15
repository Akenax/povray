camera {
	location<2,2,2>
	look_at<0,1,0>
}

light_source {
	<10,10,10>
	rgb<1,1,1>
}

plane {
    y
    0
    pigment { rgb <1,1,0> }

}

union {
	

//planche
box {
	<-2,1,-2>
	<0,1.2,0>
	pigment { rgb<1,0,0> }
}
//pieds
box{
	<-1.98,0,-1.98>
	<-1.78,1,-1.78>
	pigment { rgb<0,1,1> }
}
box{
	<-1.98,0,-0.2>
	<-1.78,1,0>
	pigment { rgb<0,1,1> }
}
box{
	<-0.2,0,-0.2>
	<0,1,0>
	pigment { rgb<0,1,1> }
}
box{
	<-0.2,0,-1.98>
	<0,1,-1.78>
	pigment { rgb<0,1,1> }
}

//modification de la table
	translate<0,0,0>
	scale<1,1,1>
}
