chuck = readmatrix('input.txt');
temp = chuck;
sum = 0;
%Calc part 1 sum brute-force.
for i = 1:size(chuck,2)
    sum = 0;
    for j = 1:size(chuck,2)
        sum = sum + (abs(chuck(j) - chuck(i)));
    end
    temp(i) = sum;
end
min(temp)

%Calc part 2 sum brute force.
sneed = zeros(size(chuck,2));
for i = 1:size(chuck,2)
    sum = 0;
    for j = 1:size(chuck,2)
        sum = sum + ((abs(chuck(j) - chuck(i))) * (abs(chuck(j) - chuck(i)) + 1) / 2);
    end
    sneed(i) = sum;
end
sneed = min(sneed);
sneed(1)