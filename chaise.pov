//base
camera {

        location <-2,2,-2>

        look_at <0, 1, 0>

}

 

light_source {

        <30,30,-30>

        rgb <1,1,1>

}

plane {
    y
    0
    pigment {
        rgb <0,0.5,1> 
    }
}


//Chaise
union {
	//~dossier
	superellipsoid {
		<0.2,0.8>
		pigment { rgb <1,0,0> }
		translate <4,2.3,0>
		scale<0.1,0.55,0.5>
	}
	box {
		<0.35,0.5,0.2>
		<0.4,1,0.3>
		pigment { rgb <0,0,1> }
	}
	box {
		<0.35,0.5,-0.2>
		<0.4,1,-0.3>
		pigment { rgb <0,0,1> }
	}
	
		//~coussin
	superellipsoid {
	    <1,0.2>
		pigment { rgb <1,0,0> }
		translate <0,5,0>//pour placer le coussin de la chaise	
		scale<0.5,0.1,0.5>
	}


	//~pieds
	box {
		<-0.45,0,-0.45>
		<-0.38,0.5,-0.38>
		pigment { rgb <0,0,1> }
	}
	box {
		<0.45,0,0.45>
		<0.38,0.5,0.38>
	pigment { rgb <0,0,1> }
	}
	box {
		<0.45,0,-0.45>
		<0.38,0.5,-0.38>
		pigment { rgb <0,0,1> }
	}	
	box {
		<-0.45,0,0.45>
		<-0.38,0.5,0.38>
		pigment { rgb <0,0,1> }
	}

	translate<0,0,0>
	scale<1,1,1>
}
