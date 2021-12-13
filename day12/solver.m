file = fopen("rinput.txt");
n = fgetl(file);
caves = [""];
while(n ~= -1)
    [a,b] = strtok(n,"-");
    b = b(2:size(b,2));
    caves = [caves a b];
    n = fgetl(file);
end
uniqueCaves = [caves(2)];
for i = 2:size(caves,2)
    insert = true;
    for j = 2:size(uniqueCaves,2)
        if(caves(i) == uniqueCaves(j))
            insert = false;
        end
    end
    if(insert)
        uniqueCaves = [uniqueCaves caves(i)];
    end
end
uniqueCaves = uniqueCaves(2:size(uniqueCaves,2));
big = zeros(1,size(uniqueCaves,2));
for i = 1:size(big,2)
    cur = char(uniqueCaves(i));
    if(cur(1) < 97)
        big(i) = 3;
    end
end
bruh = graph;
file2 = fopen("rinput.txt");
n = fgetl(file2);
doodoo = graph;
while(n ~= -1)
    [a,b] = strtok(n,"-");
    b = b(2:size(b,2));
    a = convertCharsToStrings(a);
    b = convertCharsToStrings(b);
    for i = 1:size(uniqueCaves,2)
        if (a == uniqueCaves(i))
            numA = i;
        end
        if (b == uniqueCaves(i))
             numB = i;
        end
    end
    doodoo = addedge(doodoo,numA,numB);
    n = fgetl(file2);
end
A = adjacency(doodoo);
doodoo = graph(A,uniqueCaves);
A = full(A);
for i = 1:size(uniqueCaves,2)
    if(uniqueCaves(i) == "start")
        starting = i;
    end
    if(uniqueCaves(i) == "end")
        ending = i;
    end
end
big(starting) = 1;
big(ending) = 4;

counts = zeros(1,size(uniqueCaves,2));
count = 0;
string = "";
cope = [""];
[count,cope,counts] = doShit(A,uniqueCaves,big,starting,string,count,starting,cope, false,counts);
cope = cope(2:size(cope,2));
count
uniqueCaves
big
plot(doodoo);

function [count,cope,counts] = doShit(A,uniqueCaves,big,col,string,count,starting,cope, dont,counts)
    if(uniqueCaves(col) == "end")
        for i = 1:size(big,2)
            if(big(i) == 3)
                counts(i) = 0;
            end
        end
        counts = counts(find(counts==2));
        if(size(counts,2) > 1)
            return;
        end
        count = count + 1;
        fprintf("%s\n",string);
        cope = [cope string];
        return;
    end
    for i = 1:size(A,2)
        if(A(i,col) == 1 && big(i) ~= 2)
            temp = string;
            temp2 = big;
            temp3 = counts;
            string = string + "," + uniqueCaves(col);
            counts(col) = counts(col) + 1;
            if(big(col) <= 1)
                big(col) = big(col) + 1;
            end
            if(big(col) == 2 && col ~= starting)
                for j = 1:size(big,2)
                    if(big(j) == 0)
                        big(j) = 1;
                    end
                end
                dont = true;
            end
            if(big(i) ~= 2)
                [count,cope,counts] = doShit(A,uniqueCaves,big,i,string,count,starting,cope,dont,counts);
            end
            string = temp;
            big = temp2;
            dont = false;
            counts = temp3;
        end
    end
end

