
##### Quartis #####

# Quartis sao valores que dividem um conjunto de dados em quatro partes iguais. 
# O primeiro quartil sera o termo que tera 25% dos dados antes dele, 
# o segundo quartil tambem seguira a mesma logica e ira coincidir com a mediana, 
# o terceiro quartil sera o termo com 75% dos valores do conjunto de dados antes dele 
# e o quarto quartil sera o ultimo termo do conjunto com 100% dos dados antes dele.

# Exemplo: O horario de funcionamento de um banco ja esta se esgotando, para adiantar o atendimento dos clientes o 
# gerente decide para de chamar individualmente e passa a chamar em grupos de 1/4 da quantidade total de clientes na fila. 
# A partir dos numeros das fichas dos clientes, determine os grupos das 4 chamadas.
num_fichas = c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
?quantile
quantile(num_fichas)

quantile(num_fichas)[3]

# Ou seja, a primeira chamada contemplara os clientes com as fichas de 54 ate 56, 
# a segunda de 57 ate 58, a terceira de 59 ate 60 e a quarta de 61 ate 63.


##### Percentis #####

# Os percentis sao os valores que separam um conjunto de dados em 100 partes iguais. 
# O percentil 10 representa o decimo percentil e tera 10% dos dados antes dele, 
# a logica se seguira para todo percentil.

# Exemplo: Considerando os dados do exemplos anterior, calcule o percentil 10, 80 e 98.
num_fichas = c(54, 55, 56, 57, 58, 59, 60, 61, 62, 63)
quantile(num_fichas, c(.10))
quantile(num_fichas, c(.80))
quantile(num_fichas, c(.98))

# Ou seja, o cliente que esta com pouco mais do que 98% da fila a frente dele tera a ficha 63, 
# o que esta com pouco menos do que 80% da fila a frente dele tera a ficha 61 
# e o que esta com pouco mais do que 10% da fila a frente dele tera a ficha 55.






