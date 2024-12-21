#!/bin/bash

# Variáveis para os arquivos de log OLINE e OFFLINE
ONLINE_LOG="/var/log/nginx_monitor/logs/online.log"
OFFLINE_LOG="/var/log/nginx_monitor/logs/offline.log"

# Variável que armazena o nome do serviço
SERVICO="Nginx"

# Variável que armazena data e hora atuais
DATA_HORA=$(date "+%Y-%m-%d %H:%M:%S")

# Verifica o status do serviço e encaminha mensagem de status para os arquivos de log ONLINE e OFFLINE
if systemctl is-active --quiet nginx; then
    STATUS="ONLINE"
    MENSAGEM="$DATA_HORA | Serviço: $SERVICO | Status: $STATUS | Mensagem: O serviço está funcionando normalm>
    echo "$MENSAGEM" >> "$ONLINE_LOG"
else
    STATUS="OFFLINE"
    MENSAGEM="$DATA_HORA | Serviço: $SERVICO | Status: $STATUS | Mensagem: O serviço está fora do ar."
    echo "$MENSAGEM" >> "$OFFLINE_LOG"
fi