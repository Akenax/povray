#include "colors.inc"     
#include "textures.inc"

#declare Font="cyrvetic.ttf";
light_source{
	<4,4,4>
	color White

}
light_source{
	<2.5,2,0.5>
	color White

}

camera{
	location<4,4,4>
	look_at<3,2,0>
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
      
        blob{
            threshold 0.3
            
                sphere{
                  <1,2,0>
                  1
                  4
                  pigment {color White}
                }
                    
                cylinder{
		          <2,2,0>
		          
		          <3,2,0>
		          2      
		          1
		          pigment {color Blue}
                }
                sphere{
		          <4.5,2,0>
		          1
		          6
		          pigment {color Yellow}
                }
        }      
          
         /*lathe{
            linear_spline
           	2,
            <0.7,0.7>,
            <1,1.5>
            
            pigment {color Pink}
		rotate <0,0,90>
		translate <5,2,0>
        }*/
        
        
        
        
        
            
    }                           
    
    union{
        
        blob{
            threshold 0.2
            sphere{
                <1,2,0>
                0.7
                4       //force blob
                pigment {color White}
            }       
            cylinder{
                <2,2,0>
                <3,2,0>
                1.7     
                1      //force blob
                pigment {color White}
            }
           /* cylinder{
                <2.5,2,0>
                <3.5,2,0>
                1
                1
                pigment {color White}
            }*/  
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
