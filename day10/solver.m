file = fopen("input.txt");
n = fgetl(file);
stack = java.util.Stack();
start = ['[','(','{','<'];
stop = [']',')','}','>'];
valid = ['[',']','(',')','{','}','<','>'];

for i = 1:size(n,2)
    for j = 1:size(start,2)
        if(n(i) == start(j))
            stack.push(start(j));
        end
    end
end
for i = 1:size(n,2)
    if(stack.peek == '[')
        if(n(i) == ']')
            stack = stack.pop;
        end
    end
    if(stack.peek == '(')
        if(n(i) == ')')
            fprintf("Pog\n");
            stack = stack.pop;
        end
    end
    if(stack.peek == '{')
        if(n(i) == '}')
            stack = stack.pop;
        end
    end
    if(stack.peek == '<')
        if(n(i) == '>')
            stack = stack.pop;
        end
    end
end
stack