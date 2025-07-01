#!/bin/bash
# device/hp/phobos/generate_dtb.sh

# Converter DTB para imagem formatada
dtc -I dtb -O dtb -o dtb.img tegra114-dalmore.dtb

# Verificar tamanho
DTS_SIZE=$(stat -c%s dtb.img)
MAX_SIZE=4194304 # 4MB

if [ $DTS_SIZE -gt $MAX_SIZE ]; then
  echo "Erro: DTB excede tamanho máximo da partição!"
  exit 1
fi

# Mover para pasta de kernel
mv dtb.img ../phobos/
