##### Coeficiente de Correlação #####

# Correlacao e uma versao em escala de covariancia que assume valores em [−1,1] 
# com uma correlacao de ± 1 indicando associacao linear perfeita e 0 indicando nenhuma relacao linear. 
# Esse escalonamento torna a correlacao invariante as mudancas na escala das variaveis originais 
# A constante de escala e o produto dos desvios padrao das duas variaveis.

# Portanto, o Coeficiente de Correlacao p mede o grau de correlacao entre duas variaveis.

# Para p = 1, tem-se uma correlacao perfeita entre as duas variaveis. 
# Se p = - 1, ha uma correlacao perfeita entre as variaveis, no entanto, essa correlacao e negativa. 
# Caso p = 0, as duas variaveis nao dependem linearmente uma da outra.

# Exemplo: Analisar a covariacia e correlacao entre as variaveis milhas/galao e peso do veiculo no dataset mtcars.

my_data <- mtcars
View(my_data)

library("ggpubr")

ggscatter(my_data, x = "mpg", y = "wt", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          xlab = "Autonomia", ylab = "Peso do Veiculo")

# Definindo x e y
x = my_data$mpg
y = my_data$wt

# Covariancia
?cov
cov(x, y)

# Correlacao
?cor
cor(x, y)





