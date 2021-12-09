file = fopen("input.txt");
n = fgetl(file);
chuck = zeros(1,1);
index = 1;
while(n ~= -1)
    for i = 1:size(n,2)
        chuck(index,i) = n(i) - 48;
    end
    index = index + 1;
    n = fgetl(file);
end
bools = zeros(1,1);
array = ones(size(chuck,1)+2,size(chuck,2)+2)*9;
for i = 2:size(chuck,1)+1
    for j = 2:size(chuck,2)+1
        array(i,j) = chuck(i-1,j-1);
    end
end
array
basindex = 1;
sum = 0;
for i = 2:size(chuck,1)+1
    for j = 2:size(chuck,2)+1
        if(min(array,i,j))
            sum = sum + array(i,j) + 1;
            num = walkUp(0,array,i,j);
            basinSizes(basindex) = num;
            basindex = basindex + 1;
        end
    end
end
fprintf("Silver: %d\n",sum);
basinSizes = sort(basinSizes,'descend');
pt2 = 1;
for i = 1:3
    pt2 = pt2 * basinSizes(i);
end
fprintf("Cope: %d\n",pt2);


function ismin = min(array,row,col)
    ismin = false;
    if(array(row,col) < array(row+1,col) && array(row,col) < array(row,col+1) && array(row,col) < array(row-1,col) && array(row,col) < array(row,col-1))
        ismin = true;
    end
end

function [chad array] = walkUp(chad,array,i,j)  
    if(array(i,j) == 9)
        return
    end
    array(i,j) = 9;
    chad = chad + 1;
    up = i + 1;
    down = i - 1;
    right = j + 1;
    left = j - 1;
    [chad array] = walkUp(chad,array,up,j);
    [chad array] = walkUp(chad,array,down,j);
    [chad array] = walkUp(chad,array,i,right);
    [chad array] = walkUp(chad,array,i,left);
end
