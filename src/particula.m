% Derivadas na pr�tica: simula��o de fen�meno descrito por equa��o dif.
% Autor: Josenalde Oliveira - Matem�tica Aplicada II


% A velocidade do corpo no tempo � associada � taxa de varia��o do espa�o
% percorrido em fun��o do tempo, ou seja, v(t) = ds/dt
% Problema: tem-se dispon�vel a rela��o desta taxa de varia��o, mas n�o
% sabemos como a part�cula se desloca no tempo
% Solu��o: resolver a equa��o diferencial



% intervalo de simula��o (integra��o)

h = 0.01; % segundos

% amostra inicial - instante discreto: t = k

k = 2;

tMax = 10;

t = 0;

% condicao inicial (cm)

s(1) = 10;

while (t <= tMax)
  
  % taxa de varia��o do espa�o percorrido no tempo
  dsdt = 6*(t^2) -10*t + 3;% taxa de varia��o do espa�o percorrido no tempo 
    
  s(k) = s(k - 1) + h*(dsdt);
   
   % atualizacoes
   
   s(k - 1) = s(k);
   k = k + 1;
   t = t + h;
   
end

% Plotar grafico

% vetor do tempo (eixo X)

t = 0:h:tMax+h;

% Fun��o anal�tica que descreve o movimento da part�cula
sreal = 2.*t.^3 - 5.*t.^2 + 3.*t + 4;

%plot(t, s);
plot(t,s, 'b', t, sreal, 'r'); legend('Estimado', 'Anal�tico');
title('Movimento de uma part�cula');
xlabel('tempo (s)');
ylabel('cm');


