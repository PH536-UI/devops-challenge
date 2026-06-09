#!/bin/bash
echo "=== [CodeDeploy] ValidateService: validando deploy ==="

APP_DIR="/opt/webapp"
PID_FILE="$APP_DIR/app.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 "$PID" 2>/dev/null; then
        echo "SUCESSO: App rodando com PID=$PID"
        echo "Deploy validado!"
        exit 0
    fi
fi

echo "FALHA: App nao esta rodando apos deploy"
exit 1
