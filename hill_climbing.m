function [ sol, val ] = hill_climbing(n, a, b, MAX, eps, k)
x = unifrnd(a,b,1,n); % for i = 1:n   x(i) = unifrnd(a(i), b(i)); end;

%valoarea minima curenta
vminc = Ackley(x,n);

it = 1;
gata = 0;
while it <= MAX && ~gata
    Nx = vecini(x, n, eps, k, a, b);
    % Nx este matricea vecinilor cu nrv linii si n coloane.
        % nrv este numarul de vecini.
    %vecinul i: NX(i,:)
    [nrv, ~] = size(Nx);
    valori = zeros(1, nrv);
    for i = 1:nrv
        valori(i) = Ackley(Nx(i,:),n);
    end;
    [valmin, pozmin] = min(valori);
    if valmin < vminc
        x = Nx(pozmin, :);
        vminc = valmin;
        it = it+1;
    else
        gata = 1;
    end
end

sol = x;
val = vminc;

end

