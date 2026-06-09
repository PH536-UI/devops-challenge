#!/bin/bash
echo "=== [CodeDeploy] ApplicationStart: iniciando app ==="

APP_DIR="/opt/webapp"
JAR_NAME="webapp-1.0-SNAPSHOT.jar"
PID_FILE="$APP_DIR/app.pid"
LOG_FILE="$APP_DIR/logs/app.log"

# Iniciar a aplicacao Java em background
nohup java -jar "$APP_DIR/$JAR_NAME" \
    --server.port=8080 \
    > "$LOG_FILE" 2>&1 &

APP_PID=$!
echo $APP_PID > "$PID_FILE"

sleep 3

# Verificar se subiu
if kill -0 "$APP_PID" 2>/dev/null; then
    echo "App iniciado com sucesso! PID=$APP_PID"
    echo "Log: $LOG_FILE"
else
    echo "ERRO: App nao iniciou. Verificar log:"
    cat "$LOG_FILE"
    exit 1
fi
