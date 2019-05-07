%the p gets the length of line in grid
function segs = calLength(P1,P2)

segs.length = [];
segs.index_x = [];
segs.index_y = [];
segs.index = [];

P1_x = P1(1);
P1_y = P1(2);
P2_x = P2(1);
P2_y = P2(2);

xmin = min(P1_x,P2_x);
ymin = min(P1_y,P2_y);
xmax = max(P1_x,P2_x);
ymax = max(P1_y,P2_y);

if (P1_x == P2_x) && (round(P1_x) == P1_x)...
        || (P1_y == P2_y) && (round(P1_y) == P1_y)
    return;
end

pos = reshape(1:100,10,10);

if (P1_x == P2_x) && (round(P1_x) ~= P1_x)
    SP = unique([ymin,ymax,ceil(ymin):floor(ymax)]);
    for t = 1 : size(SP,2)-1
        segs(t).length = SP(t+1)-SP(t);
        segs(t).index_x = ceil(P1_x);
        segs(t).index_y = max(ceil(SP(t+1)),ceil(SP(t)));
        segs(t).index = pos(segs(t).index_x, segs(t).index_y);
    end
end

if (P1_x ~= P2_x)
    K = polyfit([P1_x,P2_x],[P1_y,P2_y],1);
    xpx = []; xpy = [];
    for i = ceil(xmin):floor(xmax)
        xpx(i-ceil(xmin)+1) = i;
        xpy(i-ceil(xmin)+1) = K(1)*i+K(2);
    end

    ypx = []; ypy = [];
    for j = ceil(ymin):floor(ymax)
        ypy(j-ceil(ymin)+1) = j;
        syms x;
        ypx(j-ceil(ymin)+1) = double(solve(K(1)*x + K(2) - j, x));
    end

    SP = unique([P1_x,P2_x,xpx,ypx;P1_y,P2_y,xpy,ypy]','rows');

    L = @(x) sqrt((SP(x+1,1) - SP(x,1)).^2 + (SP(x+1,2) - SP(x,2)).^2);

    for t = 1 : size(SP,1)-1
        segs(t).length = L(t);
        segs(t).index_x = max(ceil(SP(t+1,1)),ceil(SP(t,1)));
        segs(t).index_y = max(ceil(SP(t+1,2)),ceil(SP(t,2)));
        segs(t).index = pos(segs(t).index_x, segs(t).index_y);
    end
end

n = [];
for i = 1 : size(segs,2)
    if segs(i).length < eps
        n = [n i];
    end
end
segs(n) = [];
