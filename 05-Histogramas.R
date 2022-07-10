##### Histograma #####

# Um histograma e um modelo de grafico que representa uma distribuicao de frequencias 
# atraves de um agrupamento de classes, de forma que se pode contabilizar as ocorrencias dos 
# dados em cada classe. 

# Possibilita visualizar a distribuição de medidas, a dispersao, simetria dos dados e tendencias centrais.

# Os conceitos de Frequencia Absoluta e Frequencia Relativa são importantes na construção de um histograma. 

# Por frequencia absoluta, entende-se o numero de observacoes correspondente a cada classe. 

# A frequencia relativa, por sua vez, diz respeito ao quociente entre a frequencia absoluta da classe 
# correspondente e a soma das frequencias absolutas. 

# A soma das areas de todos os retangulos do histograma deve ser igual a 1.

# Exemplo: Os seguintes dados representam o numero de acidentes diarios em um complexo industrial 
# (colocados em ordem crescente), durante o periodo de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

dados

?hist
hist(dados, main = "Numero de Acidentes Diarios", xlab = "Acidentes", ylab = "Frequencia")
hist(dados, main = "Numero de Acidentes Diarios - B6", xlab = "Acidentes", ylab = "Frequencia", breaks = 6)
hist(dados, main = "Numero de Acidentes Diarios - B5", xlab = "Acidentes", ylab = "Frequencia", breaks = 5) 
# O interpretador verificar que nao e possivel trabalhar com 5 classe e automaticamente arredonda para 6







