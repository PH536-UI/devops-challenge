#!/bin/bash
echo "Gerando token de autenticação..."

# Captura o token e verifica se deu erro
export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token \
    --domain meu-dominio \
    --domain-owner 123456789012 \
    --query authorizationToken \
    --output text 2> /dev/null)

# Se o comando acima falhar, o status de saída será diferente de 0
if [ $? -eq 0 ]; then
    echo "Token gerado com sucesso!"
else
    echo "ERRO: Falha ao gerar o token. Verifique o domain-owner (12 dígitos) ou suas credenciais."
    exit 1
fi
