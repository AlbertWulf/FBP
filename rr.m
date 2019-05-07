%get length
P = phantom(256);
[N,N] = size(P);
 
thm = 45;
pre = imrotate(P,thm);
[mmax,nmax] = size(pre);
s = 1;
Final = zeros(180/s,nmax);
t = 1;
for theta = 1:s:89
    Protate = imrotate(P,theta);
    Pf = sum(Protate,1);
    [mreal,nreal] = size(Pf);
    if(nmax-nreal)/2-floor((nmax-nreal)/2)==0
        From = floor((nmax-nreal)/2+1);
    else
        From = floor((nmax-nreal)/2+1);
    end
    End = floor((nmax-nreal)/2)+nreal;
    Final(180/s-t,From:End) = Pf;
    t = t+1;
end
R = imrotate(Final,90);
subplot(2,3,3);
imshow(R,[]);
z = 2*ceil(norm(size(P)-floor((size(P)-1)/2)-1))+3;
e = floor((z-N)/2)+2;
R1 = R(e:(N+e-1),:);
[mm,nn] = size(R1);
subplot(2,3,4);
imagesc(R1);
colormap(gray);
colorbar;


        