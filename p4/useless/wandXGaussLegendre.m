function [sol_w, sol_X] = WandXGaussLegendre(n)
% Retourne w et X pour G-L avec n
%w = double ( zeros(n+1,1) );
%X = double ( zeros(n+1,1) );

w = sym('w',[n+1 1]);
X = sym('X',[n+1 1]);
eqns = zeros(1, 2n+2);

for j = 0:2:n
   for k = 0:n
      % 1e equation
      eqns(j+1) =  eqns(j+1) + (w(k+1) * X(k+1)^(2j)) ;
      % 2e equation
      eqns(j+2) =  eqns(j+2) + (w(k+1) * X(k+1)^(2j+1)) ;
   end
   eqns(j+1) =  eqns(j+1) - 2/(2j+1);
end

[sol_w, sol_X] = solve(eqns) ;
end

