function S = simpsons(func, n, interval)
    a = interval(1);  
    b = interval(2);  
    
    if mod(n, 2) ~= 0
        error('n måste vara jämnt för Simpsons metod.');
    end
    
    h = (b - a) / n;  
    x = linspace(a, b, n+1);  % n+1 punkter
    y = func(x);  
    
    % Simpsons formel: h/3 * (f0 + 4*f1 + 2*f2 + 4*f3 + 2*f4 + ... + fN)
    S = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
end

function T = trapets(func, n, interval)

    a = interval(1);  
    b = interval(2);  
    h = (b - a) / n;  
    x = linspace(a, b, n+1);       
    y = func(x);      
    
    T = h * (sum(y) - (y(1) + y(end)) / 2);  % Trapetsformeln
end

f = @(x,beta) (exp(beta * x) + 8) / (1 + (x / 5).^3);
f02 = @(x) f(x,0.2);

% Trapetsregeln
V_trapets = pi * trapets(f02, 100, [0 20]);

% Simpsons metod
V_simpsons = pi * simpsons(f02, 100, [0 20]);

disp(['Resultat av trapetsregeln: ', num2str(V_trapets)])
disp(['Resultat av Simpsons metod: ', num2str(V_simpsons)])