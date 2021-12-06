days = 256;
chuck = readmatrix('input.txt');
sneed = zeros(9,1);
for i = 1:size(chuck,2)
    sneed(chuck(i)+1,1) = sneed(chuck(i)+1,1) + 1;
end
%Matrix columns are for each of the potential delays (0->8)
%Matrix rows are when a child will be spawned.
%Exponential growth means we can get the total number that a single parent
%   would make (e.g. after exponentiating by 'days' we get how many fish
%   would be spawned by one parent. Matrix mult by count of how many
%   parents' delays exist (sneed) to get a vector that when summed
%   gives us the total amount.
%
%Operation is actually O(1) i think??? so O(n) since we read input.
childSpawner = [
    0,1,0,0,0,0,0,0,0;
    0,0,1,0,0,0,0,0,0;
    0,0,0,1,0,0,0,0,0;
    0,0,0,0,1,0,0,0,0;
    0,0,0,0,0,1,0,0,0;
    0,0,0,0,0,0,1,0,0;
    1,0,0,0,0,0,0,1,0;
    0,0,0,0,0,0,0,0,1;
    1,0,0,0,0,0,0,0,0];
n = childSpawner ^ days * sneed;
sum = 0;
for i = 1:size(n,1)
    sum = sum + n(i);
end
fprintf("%d\n",sum);