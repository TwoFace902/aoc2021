fileID = fopen("input.txt");
n = fgetl(fileID);
index = 1;
count1 = 0;
count2 = 0;
while(n ~= -1)
    array(index) = str2num(n);
    n = fgetl(fileID);
    index = index + 1;
end
for i = 1:size(array,2)-1
    if(array(i) < array(i+1))
        count1 = count1 + 1;
    end
end
for i = 1:size(array,2)-3
    if(sum(array(i:i+2)) < sum(array(i+1:i+3)))
        count2 = count2 + 1;
    end
end
count1
count2