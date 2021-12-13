m = readmatrix("testin.txt");
lens = max(m)+1
lens
sneed = zeros(lens(2)+1,lens(1)+1);
for i = 1:size(m,1)
    cur = m(i,:);
    sneed(cur(2)+1,cur(1)+1) = 1;
end
size(sneed)
% sneed = xFold(sneed,30);
% size(sneed)
sneed = yFold(sneed,27);
size(sneed)
sneed = yFold(sneed,13);
size(sneed)
sneed = yFold(sneed,6);
size(sneed)
sneed

function sneed = yFold(sneed,num)
    for i = num+1:size(sneed,1)
        dist = i - num - 1;
        chad = num - dist + 1;
        for j = 1:size(sneed,2)
            if(sneed(i,j) == 1)
                sneed(chad,j) = 1;
            end
        end
    end
    sneed = sneed(1:num,:);
end

function sneed = xFold(sneed,num)
    for i = num+1:size(sneed,2)
        dist = i - num - 1;
        chad = num - dist + 1;
        for j = 1:size(sneed,1)
            if(sneed(j,i) == 1)
                sneed(j,chad) = 1;
            end
        end
    end
    sneed = sneed(:,1:num);
end

function num = countOnes(sneed)
    num = 0;
    for i = 1:size(sneed,1)
        for j = 1:size(sneed,2)
            if(sneed(i,j) == 1)
                num = num + 1;
            end
        end
    end
end