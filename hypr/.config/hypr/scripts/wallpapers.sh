#!/usr/bin/env bash

# Selecionar um wallpapaer aleatório
NEW_WP=$(ls $HOME/Imagens/Wallpapers | shuf -n l)

# Caminho completo do wallpaper
HYPRPAPER="HOME/Imagens/Wallpapers/$NEW_WP"

# Caminho do arquivo de configuração
HYPRPAPER_CONF="$HOM/.config/hypr/hyprpaper.conf"

# Limpar o arquivo de configuração do hyprpaper
echo " " > $HYPRPAPER_CONF

# Mudar o conteúdo hyprpaper.conf
echo "preload = $WALLPAPER" >> $HYPRPAPER_CONF
echo "wallpaper = eDP-2 $WALLPAPER" >> $HYPRPAPER_CONF
echo "fit_mod = cover" >> $HYPRPAPER_CONF
echo "splah = false" >> $HYPRPAPER_CONF

# Reinicia o hyprpaper
killall hyprpaper
hyprpaper &
