##### Desvio Padrao #####

# O desvio padrao indica o grau de variacao de um conjunto de dados, este conjunto pode ser amostral ou populacional.

# Exemplo: Um engenheiro precisa decidir entre tres modelos de maquinas de corte de alta precisao,
# para isso ele usa como criterio o desvio padrao. A maquina que tiver menor desvio sera a escolhida por ele. 
# A partir dos dados de medida de corte das 3 maquinas, determine qual deve ser a escolhida pelo engenheiro. 
# Maquina 1 (mm), Maquina 2 (mm) e Maquina 3 (mm).

Maq1 = c(181.9, 180.8, 181.9, 180.2, 181.4)
Maq2 = c(180.1, 181.8, 181.5, 181.2, 182.4)
Maq3 = c(182.1, 183.7, 182.1, 180.2, 181.9)

mean(Maq1)
mean(Maq2)
mean(Maq3)

sd(Maq1) 
sd(Maq2)
sd(Maq3)


##### Variancia #####

# A variancia tambem e um importante indicador de variabilidade dos dados. 
# Como a soma dos desvios sempre somarao zero, e necessario usar uma medida de variabilidade que torne 
# os desvios negativos em valores nao negativos, para que a soma dos desvios represente um valor 
# de variabilidade do conjunto de dados diferente de zero.

# A variancia entao e o quadrado do desvio padrao. 

# As medidas amostrais tem n−1 graus de liberdade. 

# Graus de liberdade e a diferença entre 
# a dimensao da amostra (n) e a quantidade de parametros a serem avaliados na populacao. 

# No caso da variancia amostral, e usada como referencia a media da amostra e isso tornaria o 
# valor da variancia amostral menor do que o da variancia populacional, devido aos valores 
# coletados estarem mais proximos da media amostral. 

# Para corrigir isso o divisor perde 1 grau de liberdade e quando se trata das medidas 
# amostrais utilizamos o n−1.

# Calculo da variancia para o exemplo anterior.

var(Maq1) 
var(Maq2)
var(Maq3)







