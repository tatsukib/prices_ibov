library(GetDFPData2)
library(tidyverse)
library(openxlsx)
library(quantmod)

tickers = c('^BVSP','VALE3.SA','GOAU4.SA','SUZB3.SA','VIVT3.SA','MELI34.SA','QUAL3.SA','PRIO3.SA','MGLU3.SA','BPAC11.SA','BRDT3.SA','LIGT3.SA','HYPE3.SA',
            'KLBN11.SA','WEGE3.SA','RENT3.SA','ENEV3.SA','ENGI11.SA','TRPL4.SA','FLRY3.SA','CPFE3.SA','B3SA3.SA','LREN3.SA','TOTS3.SA','RADL3.SA')

# pega os pre?os dos papeis e seleciona somente o pre?o de fechamento
dataEnv <- new.env()
getSymbols(tickers, src='yahoo', from=Sys.Date()-5, to= Sys.Date() , env = dataEnv)
plist <- eapply(dataEnv, Ad)

# merge de todos os papeis
fechamento <- do.call(merge, plist)

# transforma o xts em dt
options(OutDec = ',')
dt <- data.frame(date=index(fechamento), coredata(fechamento))
dt <- dt[nrow(dt),]
dt <- t(dt)


# escreve num arquivo xlsx
write.xlsx(dt,"C:\\Users\\55119\\OneDrive\\Área de Trabalho\\Datasets\\Mercado\\Ibov.xlsx", col.names = F,row.names=T)


#chartSeries(TRPL4.SA, subset = 'last 3 months')
