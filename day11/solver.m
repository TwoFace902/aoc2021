%file parsing
file = fopen("input.txt");
n = fgetl(file);
base = zeros(1,1);
index = 1;
while(n ~= -1)
    for i = 1:size(n,2)
        base(index,i) = n(i) - 48;
    end
    index = index + 1;
    n = fgetl(file);
end

%SIRS
array = ones(size(base,1)+2,size(base,2)+2)*-1;
for i = 2:size(base,1)+1
    for j = 2:size(base,2)+1
        array(i,j) = base(i-1,j-1);
    end
end
%Part 1
sum = 0;
orig = array;
for x = 1:100
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            array(i,j) = array(i,j) + 1;
        end
    end
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            if(array(i,j) > 9)
                [num array] = recursiveFlash(i,j,0,array);
                sum = sum + num;
            end
        end
    end
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            if(array(i,j) == -2)
                array(i,j) = 0;
            end
        end
    end
end
fprintf("Silver: %d\n", sum);
array = orig;
%Part 2
iter = 0;
simultaneous = false;
total = (size(base,1) * size(base,2));
while(simultaneous == false)
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            array(i,j) = array(i,j) + 1;
        end
    end
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            if(array(i,j) > 9)
                [num array] = recursiveFlash(i,j,0,array);
                if(num == total)
                    simultaneous = true;
                end
            end
        end
    end
    for i = 2:size(base,1)+1
        for j = 2:size(base,2)+1
            if(array(i,j) == -2)
                array(i,j) = 0;
            end
        end
    end
    iter = iter + 1;
end
fprintf("Gold: %d\n",iter);


function [num array] = recursiveFlash(i,j,num,array)
    if(array(i,j) <= 9)
        return;
    end
    num = num + 1;
    %so we flash only once.
    array(i,j) = -2;
    %lmfao use a for loop instead next time retard
    if(array(i+1,j) > -1)
        array(i+1,j) = array(i+1,j) + 1;
        [num array] = recursiveFlash(i+1,j,num,array);
    end
    if(array(i-1,j) > -1)
        array(i-1,j) = array(i-1,j) + 1;
        [num array] = recursiveFlash(i-1,j,num,array);
    end
    if(array(i,j+1) > -1)
        array(i,j+1) = array(i,j+1) + 1;
        [num array] = recursiveFlash(i,j+1,num,array);
    end
    if(array(i,j-1) > -1)
        array(i,j-1) = array(i,j-1) + 1;
        [num array] = recursiveFlash(i,j-1,num,array);
    end
    if(array(i+1,j-1) > -1)
        array(i+1,j-1) = array(i+1,j-1) + 1;
        [num array] = recursiveFlash(i+1,j-1,num,array);
    end
    if(array(i-1,j-1) > -1)
        array(i-1,j-1) = array(i-1,j-1) + 1;
        [num array] = recursiveFlash(i-1,j-1,num,array);
    end
    if(array(i+1,j+1) > -1)
        array(i+1,j+1) = array(i+1,j+1) + 1;
        [num array] = recursiveFlash(i+1,j+1,num,array);
    end
    if(array(i-1,j+1) > -1)
        array(i-1,j+1) = array(i-1,j+1) + 1;
        [num array] = recursiveFlash(i-1,j+1,num,array);
    end
end