#include "colors.inc"     
#include "textures.inc"

#declare Font="cyrvetic.ttf";
light_source{
	<4,4,4>
	color White

}
light_source{
	<0,0,0>
	color White

}

camera{
	location<3,2,4>
	look_at<0,1,3>
	sky <0,0,1>
	right<-image_width/image_height,0,0>
}

background { White}

plane{
    z,0
    texture{    Jade }
}

	
blob{
	threshold 0.3
	sphere{
		<0,1,1.5>
		 1.5
		 1
		 pigment{ color Pink}
	}
	sphere{
		<0,1,3>
		 1.25
		 1
		 pigment{ color Pink}
	}
}

#macro lapin(xYeux,DecaleYeux)	//les yeux sont décaler de chaque côté de DecaleYeux*Y
						//xYeux=profondeur des yeux

	sphere{
		<1.25*0.7+xYeux,1-DecaleYeux,3>

		 0.2
		 scale <1,0.7,1.25>
		 translate<-0.05,0.3,-0.7>	//translation dû au scale (pour y)
		 pigment{ color White}
	}
	sphere{
		<1.25*0.7+xYeux+0.2,1-DecaleYeux+0.07,3+0.07>
	
		 0.05
		 //scale <1,0.7,1.25>
		 translate<0,0,0>
		 pigment{ color Black}
	}

	sphere{
			<1.25*0.7+xYeux,1+DecaleYeux,3>
			//<1,-1,1>
			 0.2
			 scale <1,0.7,1.25>
			 translate<-0.05,0.3,-0.7>	//translation dû au scale (pour y)
			 pigment{ color White}
	}
	sphere{
		<1.25*0.7+xYeux+0.2,1+DecaleYeux-0.07,3+0.07>
	
		 0.05
		 //scale <1,0.7,1.25>
		 translate<0,0,0>
		 pigment{ color Black}
	}
	
#end
intersection{
		torus{
			1.25
			0.05
			rotate<90,0,0>
			translate<-0.5,1,2.5>
			pigment {color Black}
		}
		sphere{
			<0,1,3>
			 1
			 pigment{ color Pink}
		}
}
lapin(-0.1,0.25)

/*cylinder{
	<0,1,0>
	<0,1,1.5*0.3>
	1
	}*/




#macro fleche(A,S,Coul1,Coul2,alph,rCyl,rCon,text1,sca,rot,trans)


	# local B=A*alph+S*(1-alph);



	cylinder{
	A B rCyl
	 	pigment{
			color Coul1
		}
	}
	cone {
		B rCon S 0
		pigment{
			color Coul2
		}
	} 
	text {
                ttf Font  
                text1
	        0.1, 0    
	        pigment{
			    color Coul1
		    }
                scale sca 
                rotate rot
                translate trans   
    } 


#end



#macro repereortho()
	fleche(<0,0,0>,<1,0,0>,Red,Red,0.3,0.1,0.15,"X",<0.3,0.3,0.3>,<90,0,0>,<0.5,0,0.2>)
	fleche(<0,0,0>,<0,1,0>,Cyan,Cyan,0.3,0.1,0.15,"Y",<0.3,0.3,0.3>,<90,0,90>,<0,0.5,0.2>)
	fleche(<0,0,0>,<0,0,1>,Green,Green,0.3,0.1,0.15,"Z",<0.3,0.3,0.3>,<90,0,90>,<0,0.2,0.5>)
	
#end

repereortho()
