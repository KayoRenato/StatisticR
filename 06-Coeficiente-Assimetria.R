##### Coeficiente de Assimetria #####

# O coeficiente de assimetria e o que permite dizer se uma determinada distribuicao e assimetrica ou nao.

# Exemplo: Os seguintes dados representam o numero de acidentes diarios em um complexo industrial 
# (colocados em ordem crescente), durante o periodo de 50 dias. Represente o histograma desses dados.

dados = c(18, 20, 20, 21, 22, 24, 25, 25, 26, 27, 29, 29, 
          30, 30, 31, 31, 32, 33, 34, 35, 36, 36, 37, 37, 
          37, 37, 38, 38, 38, 40, 41, 43, 44, 44, 45, 45, 
          45, 46, 47, 48, 49, 50, 51, 53, 54, 54, 56, 58, 62, 65)

hist(dados, main = "Numero de Acidentes Diarios", xlab = "Acidentes", ylab = "Frequencia")

mean(dados)
sd(dados)
median(dados)

library(moments)
?skewness
SK = skewness(dados)
print(SK)

# Sk ≈ 0: dados simetricos. Tanto a cauda do lado direito quanto a do lado esquerdo da funcao densidade de probabilidade sao iguais.
# Sk < 0: assimetria negativa. A cauda do lado esquerdo da funcao densidade de probabilidade e maior que a do lado direito.
# Sk > 0: assimetria positiva. A cauda do lado direito da funcao densidade de probabilidade e maior que a do lado esquerdo.

# O coeficiente de assimetria e 0.2549279. 
# Como o coeficiente de assimetria e maior que 0, diz-se que a curva apresenta assimetria positiva 
# e a cauda do lado direito da funcao densidade de probabilidade e maior que no lado esquerdo. 
# Ao observar tambem o Histograma, percebe-se que ha maior densidade de dados do lado direito. 

# Outro exemplo
set.seed(1234)
x = rnorm(1000)
hist(x)
skewness(x)





