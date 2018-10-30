#use este arquivo para fazer a tarefa
#Voce deve usar uma imagem 8-alpine de node
FROM node:8-alpine

#A nodejs roda atualmente na porta 8000
EXPOSE 8000

#crie uma pasta /usr/src/app para guardar seus arquivos 'mkdir -p /usr/src/app'
RUN mkdir -p /usr/src/app

#mude o diretorio para a pasta /usr/src/app
WORKDIR /usr/src/app

#node faz uso de um gerenciador de pacotes chamada npm, para isso ele usa como base
# o arquivo package.json, copie ele para a pasta
COPY package.json .

#execute o comando 'npm install' para instalar os pacotes necessários
#para manter o container limpo e pequeno, use  o comando 'npm cache clean --force'
RUN npm install && npm cache clean --force

#copie o restante dos arquivos usando COPY . .
COPY . .

RUN ls

#para finalizar configure o container para executar npm start
CMD [ "node", "server.js" ]