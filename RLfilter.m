%design the filter
function dd = RLfilter(d)
      if d == 0
          dd = 0.25;
      elseif (mod(d,2)==0) && (d~=0) 
          dd = 0;
      else
          dd = -1/(pi*pi*d^2);
      end