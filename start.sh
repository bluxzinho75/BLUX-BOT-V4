#!/bin/bash

# =============================================
# 🎅✨ BLUX V4 - Versão Ultra Natal Suprema 🎄✨
# =============================================

# Função para exibir mensagens coloridas com brilho natalino 🎁
echo_color() {
    local color="$1"
    local message="$2"
    case "$color" in
        red)     printf "\033[1;31m%s\033[0m\n" "$message" ;;
        green)   printf "\033[1;32m%s\033[0m\n" "$message" ;;
        yellow)  printf "\033[1;33m%s\033[0m\n" "$message" ;;
        blue)    printf "\033[1;34m%s\033[0m\n" "$message" ;;
        magenta) printf "\033[1;35m%s\033[0m\n" "$message" ;;
        cyan)    printf "\033[1;36m%s\033[0m\n" "$message" ;;
        white)   printf "\033[1;37m%s\033[0m\n" "$message" ;;
        *)       printf "%s\n" "$message" ;;
    esac
}

# ✨ Efeito de carregamento mágico com bolinhas natalinas 🎄
loading_effect() {
    local message=${1:-"⏳ Carregando"}
    echo -n "$message"
    for i in {1..5}; do
        echo -n "🎄"
        sleep 0.3
    done
    echo ""
}

# ❄️ Efeito de neve caindo no terminal ⛄
snowfall() {
    for i in {1..15}; do
        local spaces=$((RANDOM % 60))
        printf "%${spaces}s❄️\n" ""
        sleep 0.05
    done
}

# 🌲 Árvore de Natal animada piscando 🎅
arvore_animada() {
    echo_color green "        🎄        "
    sleep 0.2
    echo_color green "       🎄🎄       "
    sleep 0.2
    echo_color green "      🎄🎄🎄      "
    sleep 0.2
    echo_color green "     🎄🎄🎄🎄     "
    sleep 0.2
    echo_color green "    🎄🎄🎄🎄🎄    "
    sleep 0.2
    echo_color green "   🎄🎄🎄🎄🎄🎄   "
    sleep 0.2
    echo_color green "  🎄🎄🎄🎄🎄🎄🎄  "
    sleep 0.2
    echo_color red   "       🎁        "
}

# 💫 Mensagem de Feliz Natal brilhante
mensagem_natal() {
    echo_color magenta "✨🎅✨🎄✨🎁✨🎄✨🎅✨"
    echo_color yellow  "🎅🎄 FELIZ NATAL E UM ANO NOVO CHEIO DE ALEGRIA! 🎁"
    echo_color magenta "✨🎅✨🎄✨🎁✨🎄✨🎅✨"
    sleep 1
}

# 🕯️ Banner principal decorado com luzes e neve
banner() {
    clear
    echo_color red     "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo_color yellow  "  🌟🚀 BEM-VINDO AO BLUX V4 NATALINO SUPREMO 🚀🌟"
    echo_color green   "  🎄 Um toque de magia, tecnologia e Natal no ar 🎅"
    echo_color cyan    "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    snowfall
}

# 🔍 Verifica se há conexão ativa (simulada)
verificar_conexao() {
    [ -f "./database/conexao_ativa.txt" ] && return 0 || return 1
}

# 🔗 Conectar via QR Code ou Código — versão natalina 🎁
conectar() {
    local tipo_conexao=$1
    local parametro=$2
    echo_color blue "🔄 Iniciando conexão mágica via $tipo_conexao... ✨"
    loading_effect
    if [ "$tipo_conexao" == "QR Code" ]; then
        echo_color cyan "📷 Escaneie o QR Code com seu celular e conecte-se 🎄"
    else
        echo_color yellow "🔢 Insira o código gerado para concluir a conexão ✨"
    fi
    node connect.js "$parametro"
}

# 🗑️ Apagar QR Code antigo (com enfeites)
apagar_qr() {
    local dir="./database/bluxnexMart-qr"
    if [ -d "$dir" ]; then
        rm -f "$dir"/*
        echo_color green "✅ Arquivos do QR Code natalino apagados com sucesso!"
    else
        echo_color red "❌ Diretório de QR Code não encontrado!"
    fi
}

# 🎄 MENU PRINCIPAL DECORADO 🎅
menu_natalino() {
    banner
    arvore_animada
    mensagem_natal
    echo_color green "🔹 Escolha uma das opções abaixo 🎅"
    echo_color blue  "────────────────────────────────────────────────────────"
    echo_color cyan  "   [1] ▶ Conectar via QR Code  📱🎄"
    echo_color green "   [2] ▶ Conectar via Código   🧾✨"
    echo_color yellow "   [3] ▶ Instalar Dependências ⚙️🧰"
    echo_color blue  "   [4] ▶ Abrir Canal do YouTube 📺🎅"
    echo_color green "   [5] ▶ Contato do Criador 👑🎁"
    echo_color cyan  "   [6] ▶ Apagar arquivos do QR 🗑️❄️"
    echo_color red   "   [7] ▶ Sair 🚪🎄"
    echo_color blue  "────────────────────────────────────────────────────────"
    echo ""

    read -t 15 -p "➡️ Digite o número da opção desejada : " opcao  
    echo ""  
    if [ -z "$opcao" ]; then  
        echo_color yellow "⏳ Tempo esgotado! Conectando automaticamente via QR Code... 🎄"  
        conectar "QR Code" "não"  
    else  
        case $opcao in  
            1) conectar "QR Code" "não" ;;  
            2) conectar "Código" "sim" ;;  
            3)  
                echo_color green "⚙️ Instalando dependências mágicas..."  
                loading_effect "🔄 Atualizando pacotes natalinos"  
                apt-get update -y  
                apt-get upgrade -y  
                apt install -y nodejs ffmpeg wget git -y  
                echo_color green "✅ Dependências instaladas com sucesso! 🎅"  
                ;;  
            4)  
                xdg-open "https://youtube.com/@bluxmodz" 2>/dev/null  
                ;;  
            5)  
                xdg-open "https://wa.me/558189728863" 2>/dev/null  
                ;;  
            6) apagar_qr ;;  
            7) exit 0 ;;  
            *) echo_color red "❌ Opção inválida!" ;;  
        esac  
    fi
}

# =============================================
# 🎁 Loop principal — espírito natalino eterno 🎁
# =============================================
while true; do
    if verificar_conexao; then
        echo_color green "🔗 Conexão ativa! Iniciando a aplicação 🎄"
        loading_effect
        node start.js
    else
        menu_natalino
    fi
    echo_color magenta "⚠️ O processo foi encerrado! Reiniciando em 5 segundos... 🎅"  
    sleep 5
done