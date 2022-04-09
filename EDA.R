## Set pwd to the project folder
setwd("~/Desktop/BIOS651/651final/Associations with Clinical Dementia Rating")

## Project choice 2
dementia = read.csv("./dementia/mds_center9661.csv", stringsAsFactors = T)
attributes(dementia)$names
View(dementia)

## Project choice: Demantia
dementia$CDR = as.numeric(dementia$CDR)
dementia$RESIDENC = factor(dementia$RESIDENC)
t1 = data.frame(table(dementia$RESIDENC,dementia$CDR))
colnames(t1)[1:2] = c('Res','CDR')
(x1 = xtabs(data = t1, Freq ~ Res + CDR))
## there is an association between the choice of res. and cdr level
## no information about other, can't do any inference. So delete it.
x1 = x1[-2,]
(ct <- chisq.test(x1, simulate.p.value = TRUE))
ct$residuals
ct$p.value ## not independent

## Based on the statistics and the papers,
## It seems that it might be rewarding to
## look at the skilled vs. private housing

## To better illustrate the trend we might want to assume res be ordinal and use 
## a Cochran Armatage or gamma test.

## In conclusion, we should have res. type in the model. However, including all
## levels of resident types maybe undesirable. I suggest to stratify our model into
## private housing, assisted_living+retirement, and skilled nursing.

## fit then check odds
dementia$RLDEM = c(dementia$RLDEM == T)





