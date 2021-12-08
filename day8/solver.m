file = fopen("rinput.txt");
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
    num = figureShitOut(chuck,sneed);
    sum = sum + num;
    n = fgetl(file);
    fprintf("curline: %d\n", i);
    i = i + 1;
end
sum

function charnum = figureShitOut(chuck,sneed)
    succy = dabber(chuck);
    charnum = '';
    for i = 1:size(sneed)
        charnum = [charnum decode(sneed(i),succy) + 48];
    end
    charnum = str2num(charnum);
end

function map = dabber(chuck)
    a = ['a', 'b', 'c', 'd', 'e', 'f', 'g'];
    perm = perms(a);
    map = containers.Map('char','char');
    for i = 1:5040
        tmap = containers.Map('char','char');
        cur = perm(i,1:7);
        tmap(cur(1)) = 'a';
        tmap(cur(2)) = 'b';
        tmap(cur(3)) = 'c';
        tmap(cur(4)) = 'd';
        tmap(cur(5)) = 'e';
        tmap(cur(6)) = 'f';
        tmap(cur(7)) = 'g';
        for j = 1:size(chuck)
            istrue = checkConfigLeft(chuck, tmap);
        end
        if (istrue)
                map = tmap;
                break;
        end
    end
end

function istrue = checkConfigLeft(chuck, map)
    pos = ["abcefg","cf","acdeg","acdfg","bcdf","abdfg","abdefg","acf","abcdefg","abcdfg"];
    for i = 1:size(chuck)
        word = chuck(i);
        word = convertStringsToChars(word);
        charshit = '';
        for j = 1:strlength(word)
            charshit = [charshit;map(word(j))];
            charshit = sort(charshit);
        end
        charshit = convertCharsToStrings(charshit);
        for j = 1:size(pos)
            if (charshit ~= pos)
                istrue = false;
            return;
            end
        end
    istrue = true;
    end
end

function num = decode(word,map)
    pos = ["abcefg","cf","acdeg","acdfg","bcdf","abdfg","abdefg","acf","abcdefg","abcdfg"];
    word = convertStringsToChars(word);
    decodeNum = '';
    for j = 1:strlength(word)
            decodeNum = [decodeNum;map(word(j))];
            decodeNum = sort(decodeNum);
    end
    decodeNum = convertCharsToStrings(decodeNum);
    for j = 1:(size(pos,2))
         if (decodeNum == pos(j))
                num = j - 1;
                return;
         end
    end
    num = 0;
end