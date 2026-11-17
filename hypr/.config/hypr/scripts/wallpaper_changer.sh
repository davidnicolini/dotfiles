#!/bin/bash

# Diretório onde seus wallpapers estão salvos
WALLPAPER_DIR="$HOME/Imagens/Wallpapers"

# Tempo entre as trocas em segundos (ex: 300 = 5 minutos)
INTERVAL=300

# Inicializa o daemon do swww se não estiver rodando
swww query || swww init

while true; do
    # Seleciona uma imagem aleatória do diretório
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)
    
    # Aplica o wallpaper com uma transição aleatória
    swww img "$WALLPAPER" \
        --transition-type random \
        --transition-step 90 \
        --transition-fps 60
    
    # Aguarda até a próxima troca
    sleep $INTERVAL
done
