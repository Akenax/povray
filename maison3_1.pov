#include "colors.inc"     
#include "textures.inc"

#declare Font="cyrvetic.ttf";
light_source{
	<-3,0,0>
	color White

}
light_source{
	<0,4,0>
	color White

}
light_source{
	<5.87,-6.5,6>
	color White

}
light_source{
	<10,-10,10>
	color White

}

camera{
	location<-10,-10,20>
	look_at<0,0,0>
	sky <0,0,1>
	right<-image_width/image_height,0,0>
}

background { White}

plane{
    z,0
    //texture{    Jade }
    pigment{color PaleGreen}
}


difference{	//permet de creuser la maison
      union{
            blob{
                  threshold 0.2
                  sphere{
                        <5,-5,3>
                        3
                        1
                        pigment{color White}
                  }
                  sphere{
                        <5,-8,3>
                        3
                        1
                         pigment{color White}
                  }
                  sphere{
                        <7.6,-6.5,3>
                        3
                        1
                        pigment{color White}
                  }
                  sphere{
                        <5.87,-6.5,6>
                        3
                        2
                        pigment{color White}
                  }
            
            }
            
            
            
      }
      union{	// creux dans la maison
             blob{
                  threshold 0.2
                  sphere{
                        <5,-5,3>
                        2.5
                        1
                        pigment{color Green}
                  }
                  sphere{
                        <5,-8,3>
                        2.5
                        1
                         pigment{color Red}
                  }
                  sphere{
                        <7.6,-6.5,3>
                        2.5
                        1
                        pigment{color Yellow}
                  }
                  sphere{
                        <5.87,-6.5,6>
                        2.5
                        2
                        pigment{color Brown}
                  }
            }
      sphere{	//la petite fenêtre
            <2.4,-6.5,3>
            2
            pigment{color Red}
      }
    
}
intersection{	// le sol de la maison
      box{  //GJKL
            <2,-2,1>
            <10.6,-11,2>
            pigment{ Pink_Granite } 
      
      }
      
      blob{
                  threshold 0.2
                  sphere{
                        <5,-5,2>
                        2.5
                        1
                        pigment{color Green}
                  }
                  sphere{
                        <5,-8,2>
                        2.5
                        1
                         pigment{color Red}
                  }
                  sphere{
                        <7.6,-6.5,2>
                        2.5
                        1
                        pigment{color Yellow}
                  }
       }
            
      
}
//#declare H=<1.5,3.48>;
lathe{ //IHGD
            linear_spline
           2,
            
             <2.31,0.66>,
            <1.5,3.48>
            /*<1.08,5.33>,
            <0.2*1,0.2*6> 
            rotate <90,0,0>*/
           // translate <5.87,-6.5,6>
            
            pigment{color White}
 }
     


blob{	//la fumée au-dessus de la maison
      threshold 0.05
      #for (i,0,3)
            sphere{
                  <0.5,0.5,0.5+i*0.5>
                  0.5
                  0.5
                  pigment{color Silver}
            }      
            
            sphere{
                  <0.5,1,0.75+i*0.5>
                  0.5
                  0.5
                  pigment{color Silver}
            }
            sphere{
                  <0.75,0.75,0.75+i*0.5>
                  0.5
                  0.5
                  pigment{color Silver}
            }
      #end
      scale <4,4,5>
      translate <4,-9,11>
      
      
}

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
