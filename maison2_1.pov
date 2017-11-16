#include "colors.inc"     
#include "textures.inc"

#declare Font="cyrvetic.ttf";
light_source{
	<2,2,2>
	color White

}
light_source{
	<-5,2,3>
	color White

}
light_source{
	<-5,12,3>
	color White

}

camera{
	location<10,-7,3>
	look_at <-5,2,3>
	sky <0,0,1>
	right<-image_width/image_height,0,0>
}

background { White}

plane{
    z,0
    texture{    Jade }
}


difference{
      union{
            //difference{
                  cylinder{
                        <-5,10,3>
                        <-5,15,3>
                        3
                        pigment{ color White}
                  }
                  
                 /* cylinder{
                              <-5,9,3>
                              <-5,11,3>
                              2.5
                              pigment{ color Gold}
                  }*/
       //     }
            difference{
                  sphere{
                        <-5,2,3>
                        3
                         pigment{ color Red}
                  }
                  sphere{
                              <-2,2,3>
                              1
                               pigment{ color Green}
                  }
                  /*cylinder{
                        <-5,4,3>
                        <-5,6,3>
                        2.5
                         pigment{ color Yellow}
                  }
                  */
            }
            
            lathe{
                  bezier_spline
                  4,
                  <2.79,1.09>,
                  <2.09,2.89>,
                  <2.02,5.59>,
                  <3,8>
                   pigment{ color Blue}
                   
                   translate <-5,2,3>
            }
      }
      
       union{
            cylinder{
                  <-5,9,3>
                  <-5,16,3>
                  2.5
                  pigment{ color White}
            }
           
            sphere{
                  <-5,2,3>
                  2.5
                  pigment{ color White}
            }
                  
            
            
           
      
      }
  
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
