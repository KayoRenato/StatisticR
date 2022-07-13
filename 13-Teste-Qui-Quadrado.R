# Análise, Interpretação do Teste do Qui-Quadrado

# Suposição do teste:
# As variáveis devem ser independentes!

# Carregando o dataset
df = read.csv("dados.csv")

# Visualizando os dados
View(df)

# Dimensões
dim(df)

# Separando x e y
x = df$Tipo_Imovel
unique(x)

y = df$Status_Imovel
unique(y)

# Tabela cruzada
table(x, y)
round(prop.table(table(x, y)), 2)

# Definindo as hipóteses:

# H0 = Não há relação entre x e y
# H1 = x e y estão relacionados

#Nível de Significancia - alpha = 0.05

# Se o valor-p for menor que 0.05 rejeitamos a H0
alph = 0.05

# Teste do Qui-Quadrado
?chisq.test
x2 <- chisq.test(table(x, y))

x2$p.value

resp <- ifelse(x2$p.value*2<=alph, 'Rejeitar H0', 'Não podemos Rejeitar H0')
resp

# Se não considerarmos os imóveis do tipo Apartamento, há diferença no resultado do teste?

# Definindo as hipóteses:

# H0 = Não há relação entre x e y
# H1 = x e y estão relacionados

# Se o valor-p for menor que 0.05 rejeitamos a H0

# Carrega os dados
dados = df
dim(dados)

# Extrai um subset filtrando os dados conforme condição proposta para este exercício
dados = droplevels(subset(dados, Tipo_Imovel != "Apartamento"))
dim(dados)
View(dados)

# Separa as variáveis
x = dados$Tipo_Imovel
y = dados$Status_Imovel

# Tabela cruzada
table(x, y)

# Executa o teste
x2 <- chisq.test(table(x, y))

x2$p.value

resp <- ifelse(x2$p.value*2<=alph, 'Rejeitar H0', 'Não podemos Rejeitar H0')
resp
