file = fopen("bigboy.txt");
n = fgetl(file);
count = 0;
i = 1;
sum = 0;
while(n ~= -1)
    [chuck, sneed] = strtok(n,"|");
    chuck = convertCharsToStrings(chuck);
    chuck = split(chuck," ");
    chuck = chuck(1:10);
    sneed = convertCharsToStrings(sneed);
    sneed = split(sneed," ");
    sneed = sneed(2:size(sneed));
    charMap = getMapping(chuck);
    sum = sum + getNum(sneed,charMap);
    n = fgetl(file);
    %fprintf("Line: %d\n", i);
    i = i + 1;
end
fprintf("\nAnswer: %d\n", sum);

%Using the correct mapping, get the 4 digit number for curline.
function num = getNum(sneed,map)
    pos = ["abcefg","cf","acdeg","acdfg","bcdf","abdfg","abdefg","acf","abcdefg","abcdfg"];
    cnum = '';
    for i = 1:size(sneed)
        decode = '';
        word = char(sneed(i));
        for j = 1:strlength(word)
            decode = [decode;map(word(j))];
        end
        decode = convertCharsToStrings(sort(decode));
        for j = 1:(size(pos,2))
            if (decode == pos(j))
                num = j - 1;
            end
        end
        cnum = [cnum num2str(num)];
    end
    num = str2num(cnum);
end

%Deduces mapping using facts and logic
function charMap = getMapping(chuck)
    charMap = containers.Map('char','char');
    %Gets a struct that contains strings by length.
    chad = sortByLength(chuck);
    
    %We are guaranteed to know 1 and 7 via unique lengths.
    one = charToASCII(char(chad.len2));
    seven = charToASCII(char(chad.len3));
    
    %We can get the mapping for a via the difference between 7 and 1
    %segments
    aMap = char(seven - one);
    
    %We get the mapping for g via difference between 4+aMap and 9. There
    %are 3 nums with length 6 (0,6,9) but only 9 should contain 4+aMap.
    sub = sort([char(chad.len4) aMap]);
    for i = 1:size(chad.len6)
        cur = sort(char(chad.len6(i)));
        if (unorderedContained(cur,sub))
            gMap = char((charToASCII(cur) - charToASCII(sub)));
            break;
        end
    end
    
    %We get mapping for e via difference between 8 and 4+aMap+gMap.
    sub = [sub gMap];
    eMap = char((charToASCII(char(chad.len7)) - charToASCII(sub)));
    
    %We get mapping for b via difference between 1+aMap+gMap+eMap and 0.
    %Maybe not the best soln but it works
    sub = sort([char(chad.len2) aMap gMap eMap]);
    for i = 1:size(chad.len6)
        cur = sort(char(chad.len6(i)));
        if (unorderedContained(cur,sub))
            bMap = char((charToASCII(cur) - charToASCII(sub)));
            break;
        end
    end
    
    %dMap is easily gotten now that we know bMap. 1+bMap and 4.
    dMap = char(charToASCII(char(chad.len4)) - charToASCII([char(chad.len2) bMap]));
    
    %Find out fMap using the length 5 strings.
    sub = sort([aMap bMap dMap gMap]);
    for i = 1:size(chad.len5)
        cur = sort(char(chad.len5(i)));
        if (unorderedContained(cur,sub))
            fMap = char((charToASCII(cur) - charToASCII(sub)));
            break;
        end
    end
    
    %cMap easily gotten by elimination. Now we have our correct mapping!
    cMap = char(charToASCII('abcdefg') - charToASCII([aMap bMap dMap eMap fMap gMap]));
    charMap(aMap) = 'a';
    charMap(bMap) = 'b';
    charMap(cMap) = 'c';
    charMap(dMap) = 'd';
    charMap(eMap) = 'e';
    charMap(fMap) = 'f';
    charMap(gMap) = 'g';
    
    
end

%Crappy function to sort everything into a struct.
%We know only len5 and len6 will have multiple entries.
function structChad = sortByLength(chuck)
    structChad = struct;
    structChad.len5 = [];
    structChad.len6 = [];
    for i = 1:size(chuck)
        if (strlength(chuck(i)) == 2)
            structChad.len2 = chuck(i);
        end
        if (strlength(chuck(i)) == 3)
            structChad.len3 = chuck(i);
        end
        if (strlength(chuck(i)) == 4)
            structChad.len4 = chuck(i);
        end
        if (strlength(chuck(i)) == 5)
            structChad.len5 = [structChad.len5;chuck(i)];
        end
        if (strlength(chuck(i)) == 6)
            structChad.len6 = [structChad.len6;chuck(i)];
        end
        if (strlength(chuck(i)) == 7)
            structChad.len7 = chuck(i);
        end
    end
end

%Char to ASCII for difference evals
function charsum = charToASCII(word)
    charsum = sum(double(word));
end

%Checks if the letters of substr are contained in str, where order doesn't
%matter.
function kek = unorderedContained(str,substr)
    count = 0;
    subindex = 1;
    for i = 1:strlength(str)
        if(str(i) == substr(subindex))
            count = count + 1;
            subindex = subindex + 1;
        end
        if(count == strlength(substr))
            kek = true;
            return;
        end
    end
    kek = (count == strlength(substr));
end