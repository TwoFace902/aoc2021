fileID = fopen("input.txt");
n = fgetl(fileID);
chuck = split(n,",");
chuck = string(chuck);
chuck = str2double(chuck);
days = 256;
for i = 1:days
    for j = 1:size(chuck)
        chuck(j) = chuck(j) - 1;
    if(chuck(j) == -1)
        chuck(j) = 6;
        chuck = [chuck;8];
    end
    end
    i
end
size(chuck)