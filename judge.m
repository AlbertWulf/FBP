%judge wether the line and the grid is connected
function [flag,pointy1,pointy2] = judge(x,y,rho,theta)
      a = 0;
      flag = 0;
      theta = theta*pi/180;
      if (x>0) && (y>0)
          x1 = x-1;
          x2 = x;
          y1 = y-1;
          y2 = y;
      elseif (x>0) && (y<0)
          x1 = x-1;
          x2 = x;
          y1 = y;
          y2 = y+1;
      elseif (x<0) && (y>0)
          x1 = x;
          x2 = x+1;
          y1 = y-1;
          y2 = y;
      else
          x1 = x;
          x2 = x+1;
          y1 = y;
          y2 = y+1;
      end
      kk = 1;
      pointx=zeros(1,2);
      if(theta~=0) && (theta~=90)
          py1 = (rho-x1*cos(theta))/sin(theta);
          if(py1<=y2) && (py1>=y1)
              a=a+1;
              pointx(1,kk) = py1;
              kk = kk+1;
          end
          py2 = (rho-x2*cos(theta))/sin(theta);
           if(py2<=y2) && (py2>=y1)
               a=a+1;
               pointx(1,kk) = py2;
               kk = kk+1;
          end
          px1 = (rho-y1*sin(theta))/cos(theta);
          if(px1<=x2) && (px1>=x1)
               a=a+1;
               pointx(1,kk) = y1;
               kk = kk+1;
          end
          px2 = (rho-y2*sin(theta))/cos(theta);
          if(px2<=x2) && (px2>=x1)
               a=a+1;
               pointx(1,kk) = y2;
               kk = kk + 1;
          end
         
     
      elseif theta==0
          if(rho>=x-1) && (rho<=x)
              a=2;
          end
      else 
          if(rho>=y-1) && (rho<=y)
              a = 2;
          end
      end
      if a>=2
          flag = 1;
      end
      pointy1 = pointx(1,1);
      pointy2 = pointx(1,2);
      
      
          
          
          
              
          
      
    
          
  
       