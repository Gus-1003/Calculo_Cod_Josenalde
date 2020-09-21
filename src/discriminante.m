% Fun��o Discriminante v 1.0 - Classificar ponto cr�tico
% Autor: Josenalde Barbosa de Oliveira 12.05.2014
% No Command Window criar fun��o simb�lica f(x,y)
% syms x y
% fxy = ....
% x0 e y0 s�o os pontos cr�ticos

function D = discriminante(fxy, x0, y0)
    syms x y;
    fx = diff(fxy,x);
    fy = diff(fxy,y);
    
    fxx = diff(fx,x);
    fyy = diff(fy,y);
    fxy = diff(fx,y);
    
    x = x0;
    y = y0;
    fxx_num = eval(fxx);
    fyy_num = eval(fyy);
    fxy_num = eval(fxy);
    
    % Regras DISCRIMINANTE
    
    D = fxx_num*fyy_num - (fxy_num)^2;
    
    if D > 0 && fxx_num < 0
       disp('Ponto de M�ximo Local de f(x,y)')
    elseif D > 0 && fxx_num > 0
       disp('Ponto de M�nimo Local de f(x,y)')
    elseif D < 0
       disp('Ponto de Sela de f(x,y)')
    elseif D == 0
       disp('Nada pode afirmar')
    end