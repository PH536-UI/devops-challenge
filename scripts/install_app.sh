#!/bin/bash
echo "=== [CodeDeploy] AfterInstall: instalando app ==="

APP_DIR="/opt/webapp"
S3_BUCKET="devops-codeartifact-store"
JAR_NAME="webapp-1.0-SNAPSHOT.jar"

# Criar diretório de instalação
mkdir -p "$APP_DIR"
mkdir -p "$APP_DIR/logs"

# Baixar artifact do S3 (LocalStack)
echo "Baixando artifact do S3..."
aws s3 cp s3://$S3_BUCKET/webapp/latest-webapp.jar \
    $APP_DIR/$JAR_NAME \
    --endpoint-url=http://localhost:4566

echo "Artifact instalado em: $APP_DIR/$JAR_NAME"
ls -lh "$APP_DIR/$JAR_NAME"
