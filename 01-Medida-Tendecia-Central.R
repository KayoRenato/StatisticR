##### Medidas de Tendencia Central #####

# As medidas de tendencia central sao valores representativos da distribuicao 
# em torno da qual as outras medidas se distribuem. 

# Duas medidas sao as mais utilizadas: a media aritmetica e a mediana.


##### Media #####

# A media aritmetica de um conjunto de n valores, como o proprio nome indica, e obtida somando-se 
# todas as medidas e dividindo-se a soma por n. 

# Exemplo: A lista abaixo possui as notas de 10 alunos de um curso de graduacao no exame final. Calcule a media.
notas = c(6.4, 7.3, 9.8, 7.3, 7.9, 8.2, 9.1, 5.6, 8.5, 6.8)
notas
?mean
mean(notas)  
print(mean(notas))


##### Mediana #####

# A mediana e uma medida alternativa a media aritmetica para representar o centro da distribuicao, 
# muito usada em estatistica descritiva. 

# Em outras palavras, 50% das medidas ficam abaixo da mediana e 50% acima.

# Exemplo: Os dados da lista abaixo são tempos de vida (em dias) de 8 lampadas. Calcule a media e a mediana.
tempos = c(400, 350, 510, 550, 690, 720, 750, 2000)
mean(tempos)
?median
median(tempos) 



##### Moda #####

# A moda de uma distribuicao e o valor que ocorre mais frequentemente, 
# ou o valor que corresponde ao intervalo de classe com a maior frequencia. 

# A moda, da mesma forma que a mediana, nao e afetada por valores extremos.

# Uma distribuicao de frequencia que apresenta apenas uma moda e chamada de unimodal. 
# Se a distribuicao apresenta dois pontos de alta concentração ela e chamada de bimodal. 

# Distribuições bimodais ou multimodais podem indicar que na realidade a distribuição de frequencia 
# se refere a duas populações cujas medidas foram misturadas. 

# Exemplo: Uma loja de calcados quer saber qual o tamanho mais comprado em um dia de vendas. 
# A partir dos dados coletados a seguir, determine o tamanho mais pedido. 
tamanhos = c(38, 38, 36, 37, 38, 40, 39, 36, 35, 36)
mean(tamanhos)  
median(tamanhos)

moda = function(dados) {
  vetor = table(as.vector(dados))
  names(vetor)[vetor == max(vetor)]
}

?table
?as.vector
tamanhos
class(tamanhos)
class(as.vector(tamanhos))

vec = table(tamanhos)
vec

moda(tamanhos)


##### Valores Maximo e Minimo #####

# Representam os valores maximos e minimos da distribuicao de dados

# Exemplo: Quais sao os valores maximo e minimo dos tamanhos de sapatos do item anterior.
tamanhos = c(38, 38, 36, 37, 36, 36, 40, 39, 36, 35, 36)
max(tamanhos)
min(tamanhos)


##### Amplitude #####

# A amplitude e a diferenca entre o maior e menor valor de um conjunto de dados qualquer.

# Exemplo: Bob quer aprender a voar com asa delta, e ele quer saber qual a amplitude maxima que um voo pode ter. 
# A partir dos dados de outros praticantes de voo livre, determine qual a amplitude. 
dados = c(28, 31, 45, 58, 22, 33, 42, 68, 24, 37)
range(dados)
diff(range(dados))
















