#!/bin/bash
echo "=== [CodeDeploy] BeforeInstall: parando app anterior ==="
PID_FILE="$HOME/webapp/app.pid"
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    if kill -0 "$PID" 2>/dev/null; then
        echo "Parando processo PID=$PID"
        kill "$PID"
        sleep 2
        echo "App parado"
    else
        echo "Processo $PID nao estava rodando"
    fi
    rm -f "$PID_FILE"
else
    echo "Nenhum app em execucao"
fi
