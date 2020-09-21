function enfezamento

% Variaveis usadas nas equa��es diferenciais

h = 0.1; % intervalo de simula��o
t = 50; % tempo de simula��o em dias
n = 0; % vari�vel para contagem do tempo
tempo(1) = 0;

% ENFEZAMENTO PALIDO

%b_linha = ; % b_linha (b') � a taxa de visitas que a planta recebe por cigarrinha
p_linha = 0.835; % p_linha (p') � a probabilidade de transmiss�o de molicutes da cigarrinha para a planta
%b_estrela = ; % b_estrela (b*) � a taxa de visitas que a cigarrinha realiza por planta, logo b'=b*
p = 0.46; % � a probabilidade de aquisi��o de molicutes pela cigarrinha
t_estrela = 25; % � o per�odo de lat�ncia (incuba��o) da infec��o na cigarrinha (contribui��o dos autores do artigo)
mi = 0.129; % � a taxa de mortalidade/natalidade da cigarrinha
N1 = 1; % � a popula��o total de plantas
N2 = 1; % � a popula��o total de cigarrinhas
% N2/N1 = 1; como N2/N1 = 1, N2=N1, estamos usando no exemplo, N2=N1=1;
b = 2;
%OBS: b' = b* = b/N1

% Equa��es Diferenciais

% M1 = � a propor��o de plantas infectadas
%dM1/dt = (N2/N1)*b*p'*I2*(1-M1)

% I1 = � a propor��o de cigarrinhas com infec��o (molicutes) em per�odo de lat�ncia
%dI1/dt = b*p*(1-I2-I1)*M1 - (1/t*)*I1 - mi*I1

% I2 = � a propor��o de cigarrinhas infectadas
%dI2/dt = (1/t*)*I1 - mi*I2

% Inicializa��o (est�gio inicial da doen�a)

M1(1) = 0; % Nenhuma planta infectada
I1(1) = 0; % Nenhuma cigarrinha com molicutes em per�odo de lat�ncia
I2(1) = 0.01; % Propor��o de cigarrinhas infectantes

k = 1;

% Para simular as equa��es diferenciais, vamos usar a aproxima��o de Euler
% para derivadas (aproxima��o para frente - forward)
% dx/dt = (x(k+1) - x(k)) / h, onde h � o intervalo de simula��o, e pode
% ser escolhido t�o pequeno quanto se queira. O detalhe � que, quanto
% menor o h, mais lento ser� o processamento.

while (n<=t)
    
    % Simula��o das equa��es diferenciais
    
    M1(k+1) = M1(k) + h*((N2/N1)*b*p_linha*I2(k)*(1-M1(k)));
    I1(k+1) = I1(k) + h*(b*p*(1 - I2(k) - I1(k))*M1(k) - mi*I1(k));
    I1(k+1) = I1(k) + h*(b*p*(1 - I2(k) - I1(k))*M1(k) - (1/t_estrela)*I1(k) - mi*I1(k));
    I2(k+1) = I2(k) + h*(- mi*I2(k));
    I2(k+1) = I2(k) + h*((1/t_estrela)*I1(k) - mi*I2(k));
    
    tempo(k+1) = n; % armazena no vetor tempo os valores de n, para o eixo x
    
    
    % Atualiza��es
    n = n + h; % intervalo entre dois pontos � h
    M1(k) = M1(k+1);
    I1(k) = I1(k+1);
    I2(k) = I2(k+1);
    k = k + 1;
    
    
    
end

% Plotagem dos gr�ficos

% Desenhar o gr�fico M1 x t

plot(tempo, M1); title('Popula��o das plantas infectadas - taxa inicial 1% - Enfezamento P�lido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');
pause;
plot(tempo, I1); title('Propor��o de cigarrinhas com infec��o em per�odo de lat�ncia - Enfezamento P�lido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');
pause;
plot(tempo, I2); title('Propor��o de cigarrinhas infectantes - Enfezamento P�lido');
xlabel('t (dias)'); ylabel('Proporcao de individuos (%) valor*100');

end

