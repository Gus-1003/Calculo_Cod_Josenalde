% script lista3 q1 - obter modelo que aproxima rela��o entre os dados x e y
% por polin�mio c�bico

% Prof. Josenalde Oliveira - Matematica Aplicada II TADS 04.04.2014

clear all; % limpar variaveis de ambiente para evitar lixo

x = [0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5]; % x = 0:0.05:0.5;
y = [1.1400 1.2592 1.3127 1.3198 1.2998 1.2720 1.2557 1.2702 1.3348 1.4688 1.6913];

% diferenca finita de primeira ordem

for i = 1:(length(x)-1)
  delta1(i) = (y(i+1) - y(i)) / (x(i+1) - x(i));
end

% diferenca finita de segunda ordem

for i = 1:length(delta1)-1
  delta2(i) = (delta1(i+1) - delta1(i)) / (x(i+1) - x(i));
end

% diferenca finita de terceira ordem

for i = 1:length(delta2)-1
  delta3(i) = (delta2(i+1) - delta2(i)) / (x(i+1) - x(i));
end

% Montar TABELA completa dos dados

% Antes deixar todos os vetores delta do mesmo tamanho

delta1 = [zeros(1,(length(x)-length(delta1))) delta1];
delta2 = [zeros(1,length(x)-length(delta2)) delta2];
delta3 = [zeros(1,length(x)-length(delta3)) delta3];

 
tabDados = [x' y' delta1' delta2' delta3'];

disp(tabDados)

disp('Logo a terceira varia��o � constante, o pequeno erro no �ltimo elemento n�o interfere no resultado')
disp('Para fun��o c�bida ax^3 + bx^2 + cx + d, o coeficiente do termo de maior grau � dado por a = delta3/6')

a = delta3(4) / 6; % porque os tres primeiros elementos foram definidos em 0 (se for quadr�tico divide por 2)
disp('a:')
disp(a)

% Para obter os outros coeficientes (b, c e d) escolhe-se arbitrariamente
% tres pares x,y quaisquer da tabela de dados x e y
% Por exemplo (0.15, 1.3198), (0.25, 1.2720), (0.35, 1.2702) substitui cada
% par no polin�mio e resolve-se o sistema Ax = b

%f(0.15) = 25.733*(0.15)^3 + (0.15)^2*b + 0.15*c + d
%f(0.25) = 25.733*(0.25)^3 + (0.25)^2*b + 0.25*c + d
%f(0.35) = 25.733*(0.35)^3 + (0.35)^2*b + 0.35*c + d

% ou seja

%0.0225b + 0.15c + d = 1.233
%0.0625b + 0.25c + d = 0.86992
%0.1225b + 0.35c + d = 0.1669

% Resolver o sistema linear Ax = b, cujo vetor x (com os coeficientes)
%x=[b c d] e o vetor b de termos independentes [1.233 0.86992 0.1669]

A = [0.0225 0.15 1; 0.0625 0.25 1; 0.1225 0.35 1];
b = [1.233 0.86992 0.1669];

x = inv(A)*b';

disp('b:')
disp(x(1))
disp('c:')
disp(x(2))
disp('d:')
disp(x(3))

disp('De posse dos coeficientes e portanto do polin�mio c�bico, deriva-se para encontrar pontos cr�ticos, m�ximos, m�nimos e inflex�o')
% Plotar a fun��o c�bica encontrada para a faixa x utilizada

ax = [0:0.01:0.5];
fx = a.*ax.^3 + x(1).*ax.^2 + x(2).*ax + x(3);
plot(ax,fx, 'k','LineWidth', 2); title('Densidade Volum�trica do solo'); ylabel('mg/m^3');xlabel('alturas (m)');






