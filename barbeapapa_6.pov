#include "colors.inc"     
#include "textures.inc"

#declare Font="cyrvetic.ttf";

#declare tps=clock;
//#declare tps=0.99;

light_source{
	<4,4,4>
	color White

}
light_source{
	<1,-1,1>
	color White

}

camera{   //en face du barbapapa
	location<6,1,3>
	look_at<0,1,2>
	sky <0,0,1>
	right<-image_width/image_height,0,0>
}

/*camera{         //sur le côté
	location<1,-3,3>
	look_at<0,1,2>
	sky <0,0,1>
	right<-image_width/image_height,0,0>
}*/

background { White}

plane{
    z,0
    texture{    Jade }
}

	
blob{
	threshold 0.3-0.1*tps
	sphere{
		<0,0,0>
		 1.5-tps*0.45
		 1
		 pigment{ color Pink}
		 scale<1+0.1*tps,1,1-0.1*tps> //pb avec y=0?
		 translate <0,1,1.5>
		 translate<0,0,0.2-tps*0.2>
	}
	sphere{
		<0,1,2.36>
		 0.8
		 1
		 pigment{ color Pink}
	}
	sphere{
		<0,0,0>
		 1.25
		 1
		 pigment{ color Pink}
		 scale <1,1-0.1*tps,1>
		 translate <0,1,3>
	}
}

//bouche barbapapa
intersection{
      		torus{
      			1.25
      			0.05
      			rotate<90,0,0>
      			translate<-0.45,1,2.5>
      			pigment {color Black}
      		}
      		sphere{
            		<0.3,1,3>
            		 0.7
            		 pigment{ color Pink}
            		 translate <0.07,0,0+0.5*tps>
            	}
}

//bouche lapin crétin
union{
      intersection{	//bouche et visage afin qu'ils ne se percutent pas.
            difference{	//pour faire la bonne forme
                  box{  //CDEF
                        <0,0,0>
                        <1.25*0.8,1.2,-0.6> //distance entre F et D
                        pigment{ color Brown}
                        //scale<0+tps,0+tps,0+tps>
                        translate <0,0.4,3+0.6-0.6*tps>   //coordonnées de F
                  }
                  sphere{
                        <0,0,0>
                        0.6
                        scale <1,1,0.30>
                        translate<1.25*0.8,1,3> //A
                  }
                   sphere{
                        <0,0,0>
                        0.6
                        scale <1,1,0.30>
                        translate<0.55,1,2.4>     //H
                  }
                  box{	// pour l'animation, pour faire descendre la bouche sans que cela se voit
                  		<-0.2,-0.2,01>
                        <1.26*0.8,1.3,-0.7> //distance entre F et D
                        pigment{ color Pink}
                        //scale<0+tps,0+tps,0+tps>
                        translate <0,0.4,3+0.6>   //coordonnées de F
                        
                  }
            }
            sphere{
            		<0,0,0>
            		 1.25*0.8
            		 pigment{ color Black}
            		 scale <1,0+0.9,1>
            		 translate <0,1,3>
      	}
      	
      }
      intersection{	//pour pas que les dents dépassent: bouche et dents
            union{	//les dents
                  box{
                        <0,0,0>
                        <0.1,0.2,0.2>
                        pigment{ color White}
                        translate <1.25*0.8,0.9-0.2,2.9-0.2*tps>
                  }
                  box{
                        <0,0,0>
                        <0.1,0.2,0.2>
                        pigment{ color White}
                        translate <1.25*0.8,0.9+0.2,2.9-0.2*tps>
                  }
            }
            difference{		//bouche pour intersection avec les dents
                  box{  //CDEF
                        <0,0,0>
                        <1.25*0.8,1.2,-0.6> //distance entre F et D
                        pigment{ color White}
                        translate <0,0.4,3>   //coordonnées de F
                  }
                  sphere{
                        <0,0,0>
                        0.6
                        scale <1,1,0.30>
                        translate<1.25*0.8,1,3> //A
                  }
                   sphere{
                        <0,0,0>
                        0.6
                        scale <1,1,0.30>
                        translate<0.55,1,2.4>     //H
                  }
            }
       }
      
}

#macro bras(rotation,cote)     //rotation des bras autour d'un point
      lathe{      //QONP --> coord. inversées
            bezier_spline
            4,
            //<0.1,0.9>,
            <0.1,1.5>,
            <0.15,0.77>,
            <0.29,0.54>,
            <0.45,0.32>
            pigment{ color Pink}
           // rotate rotation
            translate <0,1,2.36-cote>
            
      }
      lathe{      //Q'O'N'P' --> coord. inversées
            bezier_spline
            4,
            <0.1,-1.5>,
            <0.15,-0.77>,
            <0.29,-0.54>,
            <0.45,-0.32>
             //rotate rotation
            pigment{ color Pink}
            translate <0,1,2.36-cote>
          
      }
      
      //main gauche
      superellipsoid {//JLKI
		<0.5,0.8>
		
		pigment { color Pink }
		scale <0.1,0.2,0.2>
		//rotate rotation
		translate  <0,2.58,2.36-cote>
		
		
	}
	
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5,0.5,1>
	      rotate <-30+30*tps,0,0>
	     // rotate rotation
	      translate <0,2.75-0.25*tps,2.53-cote>
	      
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <180-50,0,0>
	      translate <0,2.8-0.3*tps,2.19+(2.53-2.19)*2/3-cote>
	     // rotate rotation
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <60,0,0>
	    //  rotate rotation
	      translate <0,2.8-0.3*tps,2.19+(2.53-2.19)/3-cote>
	      
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	     scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <50+10*tps,0,0>
	    //  rotate rotation
	      translate <0,2.75-0.3*tps,2.19-cote>
	      
	}
	
	//main droite
	superellipsoid {  //J'L'K'I'
		<0.5,0.8>
		pigment { color Pink }
		scale <0.1,0.2,0.2>
	//	rotate rotation
		translate  <0,-0.58,2.36-cote>
		
		
	}
	
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5,0.5,1>
	      rotate <30-30*tps,0,0>
	   //   rotate rotation
	      translate  <0,-0.75+0.25*tps,2.56-cote>
	      
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <180+70,0,0>
	   //    rotate rotation
	      translate <0,-0.80+0.3*tps,2.16+(2.56-2.19)*2/3-cote>
	     
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	      scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <-70,0,0>
	    //  rotate rotation
	      translate <0,-0.80+0.3*tps,2.16+(2.56-2.19)/3-cote>
	      
	}
	sphere{
	      <0,0,0>
	      0.15
	      pigment { color Pink }
	     
	     scale <0.5-0.5*tps,0.5-0.5*tps,1-1*tps>
	      rotate <-50-10*tps,0,0>
	    //  rotate rotation
	      translate <0,-0.78+0.3*tps,2.16-cote+0.1*tps>
	      
	}
	
	
	

	
#end

bras(<20,0,0>,0.55)

#macro Yeux(xYeux,DecaleYeux,zYeux)	//les yeux sont dÃ©caler de chaque cÃ´tÃ© de DecaleYeux*Y
						//xYeux=profondeur des yeux

      	sphere{
      		
                   <0,0,0>
      		 0.2
      		 scale <1,0.7+0.3*tps,1.25-0.25*tps>
      		// translate<-0.05,0.3,-0.7>	//translation dÃ» au scale (pour y)
      		translate <1.25*0.7+xYeux,1-DecaleYeux,3+zYeux>
      		 pigment{ color White}
      	}
      	sphere{
      	      <0,0,0>
      		 0.05
      		 //scale <1,0.7,1.25>
      		 //translate<-0.05,0,0>
      		 
      		translate <1.25*0.7+xYeux+0.2,0.95-DecaleYeux+0.05,3+zYeux>
      		 pigment{ color Black}
      	}
      
      	sphere{
      			<0,0,0>
      			 0.2
      			 scale <1,0.7+0.3*tps,1.25-0.25*tps>
      			 //translate<0,0.3,-0.7>	//translation dÃ» au scale (pour y)
      			 translate <1.25*0.7+xYeux,1+DecaleYeux,3+zYeux>
      			 pigment{ color White}
      	}
      	sphere{
      		<0,0,0>
      		 0.05
      		
      		 //scale <1,0.7,1.25>
      		 translate<1.25*0.7+xYeux+0.2,0.95+DecaleYeux+0.05,3+zYeux>
      	
      		 pigment{ color Black}
      	}

	

      
#end
Yeux(-0.1+0.04*tps,0.25+0.25*tps,0.1*tps)


//Oreilles
difference{
      lathe{      //EJDCHIB
            cubic_spline
            7,
            <0,0.87>,   //E
            <0.16,0.89>,      //J
            <0.25,0.75>,      //D
            <0.27,0.61>,      //C
            <0.26,0.4>,      //H
            <0.23,0.2>,      //I
            <0.18,-0.05>     //B
            pigment{color White}
            scale <1,1.5,1>
           rotate <-120+(65+120)*tps,0,0>
           //rotate <75,0,0>
            translate <0,1+0.30,3+0.45>
            //translate <2,1,1>
      }
        
     box{
            <0,0,0>
            <0.24,2*0.27+0.5,2*0.89>
             scale <1,1.5,1>
            rotate<65,0,0>
            translate <0.2,1+0.7,3+0.4*1.5>
            pigment{color Pink}
      }
}


      
difference{
      lathe{      //EJDCHIB
            cubic_spline
            7,
            <0,0.87>,   //E
            <0.16,0.89>,      //J
            <0.25,0.75>,      //D
            <0.27,0.61>,      //C
            <0.26,0.4>,      //H
            <0.23,0.2>,      //I
            <0.18,-0.05>     //B
            pigment{color White}
            scale <1,1.5,1>
           rotate <-65+(238-65)*(-tps),0,0>
            translate <0,1-0.30,3+0.45>
            //translate <0,1,3>
      }
        
     box{
            <0,0,0>
            <0.24,2*0.27+0.5,2*0.89>
             scale <1,1.5,1>
            rotate<35,0,0>
            translate <0.20,1-0.7,3+0.4*1.5-0.1>
            pigment{color Pink}
      }
}


#macro jambes(rot,hauteur)
	#if(tps<=0.33)		//D'abord les pieds descendent, ensuite ils tournent
		lathe{      //FGHB --> INVERSE
		      bezier_spline
		      4,
		      <0.6,0.59>,
		      <0.45,0.74>,
		      <0.34,0.9>,
		      <0.29,1.02>
		      pigment{color Pink}
		      scale<1,1,0.9>
		      rotate <270,0,0>
		      //translate<0,0.03,0.05>  //D-F
		     // translate<0,1,1.6>
		      translate<0,1.02,2-0.4*tps*3>
		}
		lathe{      //FGHB --> INVERSE
		      bezier_spline
		      4,
		      <0.6,0.59>,
		      <0.45,0.74>,
		      <0.34,0.9>,
		      <0.29,1.02>
		      pigment{color Pink}
		      scale<1,1,0.9>
		      rotate <270,0,0>
		      //translate<0,0.03,0.05>  //D-F
		      //translate <0,1,1.6>
		      translate<0,0.99,2-0.4*tps*3>
		 }
	#else
		lathe{      //FGHB --> INVERSE
		      bezier_spline
		      4,
		      <0.6,0.59>,
		      <0.45,0.74>,
		      <0.34,0.9>,
		      <0.29,1.02>
		      pigment{color Pink}
		      scale<1,1,0.9>
		      rotate <270-rot,0,0>
		      //translate<0,0.03,0.05>  //D-F
		     // translate<0,1,1.6>
		      translate<0,1.02,2-0.4>
		}
		lathe{      //FGHB --> INVERSE
		      bezier_spline
		      4,
		      <0.6,0.59>,
		      <0.45,0.74>,
		      <0.34,0.9>,
		      <0.29,1.02>
		      pigment{color Pink}
		      scale<1,1,0.9>
		      rotate <270+rot,0,0>
		      //translate<0,0.03,0.05>  //D-F
		      //translate <0,1,1.6>
		      translate<0,0.99,2-0.4>
		 }
	#end
#end
jambes(35*tps,0.4)


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
