m = readmatrix("funny.txt");
rng(69);
size(m)
[line,m] = yUnfold(m);
size(m)
outlines = [line];
[line,m] = yUnfold(m);
size(m)
outlines = [outlines line];
[line,m] = yUnfold(m);
size(m)
outlines = [outlines line];
% [line,m] = xUnfold(m);
% size(m)
% outlines = [outlines line];
xs = [];
ys = [];
for i = 1:size(m,1)
    for j = 1:size(m,2)
        if(m(i,j) == 1)
            xs = [xs i-1];
            ys = [ys j-1];
        end
    end
end
file = fopen("testin.txt",'w');
for i = 1:size(xs,2)
    fprintf(file,"%d,%d\n",ys(i),xs(i));
end
outlines

function [line matrix] = yUnfold(sneed)
    sneeder = rand(size(sneed,1),size(sneed,2));
    mirror = zeros(size(sneed,1),size(sneed,2));
    for i = 1:size(sneed,1)
        for j = 1:size(sneed,2)
            if(sneeder(i,j) > 0.5)
                mirror(i,j) = sneed(i,j);
                sneed(i,j) = 0;
            end
        end
    end
    mirror = flipud(mirror);
    returner = zeros(size(sneed,1)*2+1,size(sneed,2));
    returner(1:size(mirror,1),:) = mirror;
    returner((size(mirror,1)+2):size(returner,1),:) = sneed;
    matrix = returner;
    line = size(mirror,1);
end

function [line matrix] = xUnfold(sneed)
    sneeder = rand(size(sneed,1),size(sneed,2));
    mirror = zeros(size(sneed,1),size(sneed,2));
    for i = 1:size(sneed,1)
        for j = 1:size(sneed,2)
            if(sneeder(i,j) > 0.5)
                mirror(i,j) = sneed(i,j);
                sneed(i,j) = 0;
            end
        end
    end
    mirror = fliplr(mirror);
    returner = zeros(size(sneed,1),size(sneed,2)*2+1);
    returner(:,1:size(mirror,2)) = mirror;
    returner(:,(size(mirror,2)+2):size(returner,2)) = sneed;
    matrix = returner;
    line = size(mirror,2);
end