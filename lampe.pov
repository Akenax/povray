camera {
	location<2,1,2>
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
cylinder {
	<0,2,0>
	<0,3,0>
	0.05
	pigment{ rgb<0,1,1> }
}
cylinder {
	<0,1.5,0>
	<0,2,0>
	0.05
	pigment{ rgb<1,1,1> }
}

difference {
	cone {
		<0,1.70,0>
		0.75
		<0,2,0>
		0.05
		pigment{ rgb<0,0,1> }		
	}
	cone {
		<0,1.70,0>
		0.7
		<0,2,0>
		0.04
		pigment{ rgb<0,0,1> }		
	}
}

	rotate<30,0,45>

}
