######## Distribuicao Binomial ########

# Uma variavel aleatoria tem Distribuição Binomial quando o experimento ao 
# qual esta relacionada apresenta apenas 2 resultados: sucesso e fracasso.

# Vamos imaginar que nosso experimento seja contar quantos clientes que entram em uma loja de celulares, 
# adquirem um plano pos-pago.

# Para este experimento, temos 2 possibilidades para cada observacao: adquirir ou nao adquirir o plano.

# Como podemos ter apenas 2 resultados possiveis, este e chamado um Experimento Binomial.

# Vamos imaginar agora, que historicamente, 10% dos clientes que entram na loja, adquirem um plano pos-pago.
# Portanto, a probabilidade de sucesso (que vamos chamar de p) para cada observação e 0.10.
# E a probabilidade de falha (que vamos chamar de q) para cada observacao e 0.90. 

# Ou seja: p = 1 – q 

# p = probabilidade de sucesso
# q = probabilidade de fracasso 

# Outra caracteristica da distribuicao binomial, e que cada observacao e independente das outras. 

# Dessa forma, um Experimento Binomial consiste de um numero fixo de observacoes, 
# indicado por n e contamos o numero de sucessos, indicado por x.

# A Media de uma Distribuição Binomial, representa a media de longo prazo de sucessos esperados, 
# baseado no numero de observações.

# A Variancia de uma Distribuicao Binomial, representa a variacao que existe no numero de sucessos (p) 
# sobre um numero (n) de observações.



# Exemplo: A probabilidade de um paciente com um ataque cardiaco morrer do ataque é de 0.04 
# (ou seja, 4 de 100 morrem do ataque). Suponha que tenhamos 5 pacientes que sofrem um ataque cardiaco, 
# qual e a probabilidade de que todos sobrevivam? 

# Para este exemplo, vamos chamar um sucesso um ataque fatal (p = 0.04). 
# Temos n = 5 pacientes e queremos saber a probabilidade de que todos sobrevivam ou, em outras palavras, 
# que nenhum seja fatal (0 sucessos).

# X = Numero de sobreviventes ao ataque
# p = 0.04
# n = 5
# dbinom(X, n, p)
?dbinom
a <- dbinom(0, 5, 0.04)
print(a)

# Desenhando a distribuicao de probabilidades
graph <- function(n,p){
  x <- dbinom(0:n, size = n, prob = p)
  barplot(x,ylim=c(0,1),names.arg=0:n,
          main=sprintf(paste('Distribuicao Binomial (n,p) ',n,p,sep='|')))
}
graph(5,0.04)


# Criando o grafico de uma distribuicao binomial
x <- seq(0,50,by = 1)
y <- dbinom(x,50,0.5)
png(file = "dbinom.png")
plot(x,y)
dev.off()


######## Distribuicao Poisson ########

# A Distribuicao Poisson e muito util para calcular a probabilidade de um certo numero de eventos 
# que ocorrera em um especifico intervalo de tempo ou espaço. 

# Nos poderiamos usar este tipo de distribuição para determinar a probabilidade de 10 clientes 
# entrarem em uma loja nos proximos 30 minutos ou a probabilidade de 2 acidentes de carro ocorrerem 
# em um determinado cruzamento no proximo mes. 

# A Distribuicao Poisson e um modelo para o numero de eventos observados numa unidade de tempo ou de espaco, 
# dado que a taxa de eventos por unidade e constante e os eventos ocorrem de modo independente. 

# O unico parametro da Poisson e λ (lambda), que representa a taxa de eventos por unidade.

# Distribuição Binomial, o numero de sucessos observados e limitado ao numero de possibilidades. 
# Distribuição Poisson, o numero de resultados pode ser qualquer um.

# A Distribuicao Poisson nao conta o numero de sucessos, como na distribuição binomial.
# A Distribuicao Poisson conta o número de ocorrencias de um evento particular sobre um intervalo 
# especifico de tempo ou espaco. 


# Exemplo: Considere um processo que tem uma taxa de 0,5 defeitos por unidade. 
# Qual a probabilidade de uma unidade apresentar dois defeitos? E nenhum defeito?
?dpois
dpois(2, 0.5)
dpois(0, 0.5)


######## Distribuicao Normal ########

# A Distribuicao Normal, ou Gaussiana, e a mais importante distribuicao continua. 
# Isso por conta de varios fatores, entre eles, o teorema central do limite, o qual e um resultado essencial 
# em aplicações praticas e teoricas, pois garante que, mesmo que os dados nao sejam distribuidos segundo uma normal, 
# a media dos dados converge para uma distribuicao normal conforme o numero de dados aumenta.

# O R inclui funcionalidades para operacoes com distribuicoes de probabilidades. 
# Para cada distribuicao ha 4 operacoes basicas indicadas pelas letras:

# d: calcula a densidade de probabilidade f(x) no ponto
# p: calcula a funcao de probabilidade acumulada F(x) no ponto
# q: calcula o quantil correspondente a uma dada probabilidade
# r: retira uma amostra da distribuicao

# Para utlizar as funcoes combina-se uma das letras acima com uma abreviatura do nome da distribuicao 
# Por exemplo, para calcular probabilidades usamos: pnorm para normal, pexp para exponencial, 
# pbinom para binomial, ppois para Poisson e assim por diante.

# x <- rnorm(n, mean, sd)
# Onde n e o tamanho da amostra e mean e sd sao parametros opcionais relacionados a media e desvio padrao, 
# respectivamente.

# Distribuicao Normal
?rnorm
x <- rnorm(100)
hist(x)

# Densidade
# # Observe que o grafico gerado assemelha-se a uma Gaussiana e nao apresenta assimentria. 
# Quando o grafico da distribuicao possui tal forma, ha grandes chances de se tratar de uma distribuicao normal.
x <- seq(-6, 6, by=0.01)
y <- dnorm(x)
plot(x, y, type="l")






