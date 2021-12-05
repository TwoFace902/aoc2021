array = sparse(1000000,1000000);
array = rfile(array);
[row, col] = find(array >= 2);
[row,col];
size(row)
size(col)


function array = rfile(array)
    fileID = fopen("input.txt");
    n = fgetl(fileID);
    while(n ~= -1)
        [start,rest] = strtok(n," -> ");
        notstart = strtok(rest," -> ");
        [x1,rest] = strtok(start,',');
        y1 = strtok(rest,',');
        [x2,rest] = strtok(notstart,',');
        y2 = strtok(rest,',');
        x1 = str2num(x1);
        x2 = str2num(x2);
        y1 = str2num(y1);
        y2 = str2num(y2);
        if(abs(x1-x2) == abs(y1-y2))
            if(x1 > x2)
                if(y1 > y2)
                    for i = x2:x1
                       array(i,y2) = array(i,y2) + 1;
                       y2 = y2 + 1;
                   end
                else
                    for i = x2:x1
                       array(i,y2) = array(i,y2) + 1;
                       y2 = y2 - 1;
                   end
                end
            else
                if(y1 > y2)
                    for i = x1:x2
                       array(i,y1) = array(i,y1) + 1;
                       y1 = y1 - 1;
                   end
                else
                   for i = x1:x2
                       array(i,y1) = array(i,y1) + 1;
                       y1 = y1 + 1;
                   end
                end
            end
        elseif(x1 == x2)
            if(y1 > y2)
                for i = y2:y1
                    array(x1,i) = array(x1,i) + 1;
                end
            else
                for i = y1:y2
                    array(x1,i) = array(x1,i) + 1;
                end
            end
        elseif(y1 == y2)
            if(x1 > x2)
                for i = x2:x1
                    array(i,y1) = array(i,y1) + 1;
                end
            else
                for i = x1:x2
                    array(i,y1) = array(i,y1) + 1;
                end
            end
        end
        n = fgetl(fileID);
    end
end