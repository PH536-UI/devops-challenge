#!/bin/bash
# Simula o CodeDeploy Agent localmente
# Equivalente ao que o agente faria na EC2 real

set -e

echo ""
echo "================================================"
echo "  CodeDeploy Local Agent"
echo "  $(date)"
echo "================================================"

DEPLOY_DIR="$(dirname "$0")/.."
cd "$DEPLOY_DIR"

echo ""
echo "[1/4] BeforeInstall — parando app anterior..."
bash scripts/stop_app.sh

echo ""
echo "[2/4] AfterInstall — baixando e instalando artifact..."
sudo bash scripts/install_app.sh

echo ""
echo "[3/4] ApplicationStart — iniciando app..."
sudo bash scripts/start_app.sh

echo ""
echo "[4/4] ValidateService — validando deploy..."
bash scripts/validate_app.sh

echo ""
echo "================================================"
echo "  DEPLOY CONCLUIDO COM SUCESSO!"
echo "  App rodando em: /opt/webapp/"
echo "================================================"
