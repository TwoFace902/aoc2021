chuck = readmatrix('rinput.txt');
sum = [0;0];
%Calc part 1
middle = median(chuck,'all');
floorer = abs(chuck - floor(middle));
for i = 1:size(floorer,2)
    sum(1) = sum(1) + floorer(i);
end
ceiler = abs(chuck - ceil(middle));
for i = 1:size(ceiler,2)
    sum(2) = sum(2) + ceiler(i);
end
fprintf("Part 1 soln: %d\n",min(sum));

%Calc part 2
sum = [0;0];
meany = mean(chuck,'all');
floorer = abs(chuck - floor(meany));
for i = 1:size(floorer,2)
    sum(1) = sum(1) + ((floorer(i) * (floorer(i) + 1)) / 2);
end
ceiler = abs(chuck - ceil(meany));
for i = 1:size(ceiler,2)
    sum(2) = sum(2) + ((ceiler(i) * (ceiler(i) + 1)) / 2);
end
fprintf("Part 2 soln: %d\n",min(sum));