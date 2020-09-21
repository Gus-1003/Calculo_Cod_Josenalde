% Derivadas na pr�tica: simula��o de fen�meno descrito por equa��o dif.
% Autor: Josenalde Oliveira - Matem�tica Aplicada II


% A velocidade do corpo no tempo � associada � taxa de varia��o do espa�o
% percorrido em fun��o do tempo, ou seja, v(t) = ds/dt
% Problema: tem-se dispon�vel a rela��o desta taxa de varia��o, mas n�o
% sabemos como a part�cula se desloca no tempo
% Solu��o: resolver a equa��o diferencial


clear all;
% intervalo de simula��o (integra��o)

h = 0.01; % segundos

% amostra inici%al - instante discreto:t = k


k = 2;

tMax = 10;

t = 0;

% condicao inicial

f(1) = 10;

while (t <= tMax)
  
  % taxa de varia��o
  dfdt = 2*t;% taxa de varia��o do espa�o percorrido no tempo 
    
  f(k) = f(k - 1) + h*(dfdt);
   
   % atualizacoes
   
   f(k - 1) = f(k);
   k = k + 1;
   t = t + h;
   
end

% Plotar grafico

% vetor do tempo (eixo X)

t = 0:h:tMax+h;

% Fun��o anal�tica que descreve o movimento da part�cula
freal = t.^2;

plot(t, f, 'b', t, freal, 'r');legend('Estimado', 'Anal�tico');

title('Exemplo de simulacao');
xlabel('tempo (s)');
ylabel('unidades');


