##### Coeficiente de Variação #####

# O coeficiente de variacao indica a quantidade de variação de um conjunto de dados em relação a media. 
# O valor e dado por uma relação direta do quociente entre o desvio com a media da amostra.

# O coeficiente de variacao (CV), mede o desvio padrao em termos de percentual da media. 
# Um CV alto, indica alta variabilidade dos dados, ou seja, menos consistencia dos dados. 
# Um CV menor, indica mais consistencia dentro do conjunto de dados.

# Quando comparamos a consistencia entre 2 conjuntos de dados em relação a suas medias, 
# e melhor feito quando utilizamos coeficiente de variação. 


# Exemplo: Imagine que um investidor esta decidindo se compra acoes da Nike ou Adidas na bolsa de valores. 
# O valor medio da acao de cada empresa e o desvio padrao, sao dados a seguir. 
# Qual deve ser a escolha do investidor?

# Nike ==> Valor medio da acao = $55.62 / desvio padrao = $5.10 
# Adidas ==> Valor medio da acao = $24.86 / desvio padrao = $3.60 

# CV = (desvio/media) * 100
CV_Nike   = (5.10/55.62) * 100
CV_Adidas = (3.60/24.86) * 100

print(CV_Nike)
print(CV_Adidas)

# Conclusao

# Um investidor se sentiria mais seguro em adquirir acoes da Nike, pois o preco das acoes 
# teria uma variação menor, podendo assim evitar perdas e permitindo ao investidor ter 
# um investimento mais seguro.


