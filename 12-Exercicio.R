# Pacotes
#install.packages("dplyr")
#install.packages('nycflights13')
library('ggplot2')
library('dplyr')
library('nycflights13')
View(flights)
?flights

# Problema de Negócio - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)


# Passo 1 - Construa o dataset pop_data com os dados de voos das 
# companhias aéreas UA (United Airlines) e DL (Delta Airlines). 
# O dataset deve conter apenas duas colunas, nome da companhia e atraso nos voos de chegada.
# Os dados devem ser extraídos do dataset flights para construir o dataset pop_data
# Vamos considerar este dataset como sendo nossa população de voos
?sample_n
?slice_sample

pop_data <- na.omit(flights) %>%
  filter(carrier == 'UA' | carrier == 'DL', arr_delay >= 0) %>%
  select(carrier, arr_delay) %>%
  group_by(carrier) %>%
  sample_n(17000) %>%
  ungroup()

View(pop_data)

# Passo 2  - Crie duas amostras de 1000 observações cada uma a partir do 
# dataset pop_data apenas com dados da companhia DL para amostra 1 e apenas dados 
# da companhia UA na amostra 2

# Dica: inclua uma coluna chamada sample_id preenchida com número 1 para a primeira 
# amostra e 2 para a segunda amostra

sample1 <- na.omit(pop_data) %>%
  filter(carrier == 'DL') %>%
  mutate(sample_id = 1) %>%
  sample_n(1000)

View(sample1)


sample2 <- na.omit(pop_data) %>%
  filter(carrier == 'UA') %>%
  mutate(sample_id = 2) %>%
  sample_n(1000)

View(sample2)


# Passo 3 - Crie um dataset contendo os dados das 2 amostras criadas no item anterior. 

samples <- rbind(sample1, sample2)
View(samples)




# Passo 4 - Calcule o intervalo de confiança (95%) da amostra1

# Usamos a fórmula: erro_padrao_amostra1 = sd(amostra1$arr_delay) / sqrt(nrow(amostra1))

# Esta fórmula é usada para calcular o desvio padrão de uma distribuição da média amostral
# (de um grande número de amostras de uma população). Em outras palavras, só é aplicável 
# quando você está procurando o desvio padrão de médias calculadas a partir de uma amostra de 
# tamanho n, tirada de uma população.

# Digamos que você obtenha 10000 amostras de uma população qualquer com um tamanho de amostra de n = 2.
# Então calculamos as médias de cada uma dessas amostras (teremos 10000 médias calculadas).
# A equação acima informa que, com um número de amostras grande o suficiente, o desvio padrão das médias 
# da amostra pode ser aproximado usando esta fórmula: sd(amostra) / sqrt(nrow(amostra))

# Deve ser intuitivo que o seu desvio padrão das médias da amostra será muito pequeno, 
# ou em outras palavras, as médias de cada amostra terão muito pouca variação.

# Com determinadas condições de inferência (nossa amostra é aleatória, normal, independente), 
# podemos realmente usar esse cálculo de desvio padrão para estimar o desvio padrão de nossa população. 
# Como isso é apenas uma estimativa, é chamado de erro padrão. A condição para usar isso como 
# uma estimativa é que o tamanho da amostra n é maior que 30 (dado pelo teorema do limite central) 
# e atende a condição de independência n <= 10% do tamanho da população.

# condicao 1 -> n = 1000 > 30 - ok
# condicao 2 -> n = 1000 < 34.000 * 0.10 = 3.400 - ok

# Erro padrão
erro_padrao_amostra1 = sd(sample1$arr_delay) / sqrt(nrow(sample1))
erro_padrao_amostra1

erro_padrao_amostra2 = sd(sample2$arr_delay) / sqrt(nrow(sample2))
erro_padrao_amostra2


# Limites inferior e superior
# 1.96 é o valor de z score para 95% de confiança
mean(sample1$arr_delay)

lower_1 <- mean(sample1$arr_delay) - 1.96 * erro_padrao_amostra1
lower_1

upper_1 <- mean(sample1$arr_delay) + 1.96 * erro_padrao_amostra1
upper_1


# Intervalo de confiança
IC_1 = c(lower_1, upper_1)
IC_1



# Passo 5 - Calcule o intervalo de confiança (95%) da amostra2

mean(sample2$arr_delay)

lower_2 <- mean(sample2$arr_delay) - 1.96 * erro_padrao_amostra2
lower_2

upper_2 <- mean(sample2$arr_delay) + 1.96 * erro_padrao_amostra2
upper_2


IC_2 = c(lower_2, upper_2)
IC_2


# Passo 6 - Crie um plot Visualizando os intervalos de confiança criados nos itens anteriores
# Dica: Use o geom_point() e geom_errorbar() do pacote ggplot2

toPLot = summarise(group_by(samples, sample_id), mean = mean(arr_delay) )
toPLot = mutate(toPLot, lower = ifelse(toPLot$sample_id == 1, IC_1[1], IC_2[1]))
toPLot = mutate(toPLot, upper = ifelse(toPLot$sample_id == 1, IC_1[2], IC_2[2]))
toPLot
str(toPLot)

toPLot$sample_id <- as.factor(toPLot$sample_id)

ggplot(toPLot, aes(x = sample_id, y= mean, colour = sample_id)) +
  geom_point() +
  geom_errorbar(aes(ymin= lower, ymax = upper), width =.1)

# Passo 7 - Podemos dizer que muito provavelmente, as amostras vieram da mesma população? 
# Por que?

# Sim. A maior parte dos dados reside no mesmo intervalo de confianca nas duas amostras.


# Passo 8 - Crie um teste de hipótese para verificar se os voos da Delta Airlines (DL)
# atrasam mais do que os voos da UA (United Airlines)

# H0 e H1 devem ser mutuamente exclusivas.

# H0 -> Não há diferença significativa entre os atrasos da DL e UA (diff da média de atraso = 0)
# H1 -> Delta atrasa mais (diff das médias > 0)

# Criar amostras 

DL <- sample_n(filter(pop_data, carrier == 'DL', arr_delay >0), 1000)
UA <- sample_n(filter(pop_data, carrier == 'UA', arr_delay >0), 1000)


# Calcular erro padrao das medias

DL_se <- sd(DL$arr_delay)/sqrt(nrow(DL))
DL_se

DL_mean <- mean(DL$arr_delay)
DL_mean


UA_se <- sd(UA$arr_delay)/sqrt(nrow(UA))
UA_se

UA_mean <- mean(UA$arr_delay)
UA_mean

#Limites inferiores e Superiores  (1.96 p/ 95% confianca )
DL_lower <- DL_mean - 1.96 * DL_se
DL_lower

DL_upper <- DL_mean + 1.96 * DL_se
DL_upper


DL_IC <- c(DL_lower, DL_upper)
DL_IC

UA_lower <- UA_mean - 1.96 * UA_se
UA_lower

UA_upper <- UA_mean + 1.96 * UA_se
UA_upper


UA_IC <- c(UA_lower, UA_upper)
UA_IC



# Teste t

t.test(DL$arr_delay, UA$arr_delay, alternative = 'greater')

# Se o p-value for menor que o nível de significancia (0.05), conclui-se que o correto é rejeitar H0;
# Se o p-value for maior que o nível de significancia (0.05), conclui-se que não podemos rejeitar H0; (Falhamos em rejeitar H0)

# Regra
#Baixo p-value -> Forte evidência empirica contra H0;
#Alto p-value -> Pouca ou nenhuma evidência empirica contra H0;

# Dado que o nossa alpha (Nivel de Significancia) igual a 0.05 (95%)
# E que o p-value foi de 0.1071
# Temos que o p-value é maior que o alpha e logo falhamos em rejeitar H0.

# Assim, não há evidências estatísticas de que a DL atrase mais que a UA;




