#!/bin/bash

# Caminho base
DEVICE_DIR="lineage/device/hp/phobos"

echo "📁 Verificando estrutura em $DEVICE_DIR..."

# Criar arquivos se não existirem
touch_if_missing() {
  FILE="$1"
  if [ ! -f "$DEVICE_DIR/$FILE" ]; then
    echo "➕ Criando: $FILE"
    cat <<EOF > "$DEVICE_DIR/$FILE"
# Auto-generated $FILE for HP Slate 21 (phobos)
EOF
  else
    echo "✔️ Já existe: $FILE"
  fi
}

# Lista de arquivos essenciais
FILES=(
  "init.phobos.rc"
  "init.phobos.usb.rc"
  "ueventd.phobos.rc"
  "recovery.fstab"
  "AndroidProducts.mk"
  "vendorsetup.sh"
)

# Criar diretório sepolicy se não existir
if [ ! -d "$DEVICE_DIR/sepolicy" ]; then
  echo "📁 Criando diretório: sepolicy/"
  mkdir -p "$DEVICE_DIR/sepolicy"
fi

# Gerar arquivos padrão
for f in "${FILES[@]}"; do
  touch_if_missing "$f"
done

# BoardConfigVendor.mk mínimo (só se não existir)
if [ ! -f "$DEVICE_DIR/BoardConfigVendor.mk" ]; then
  echo "➕ Gerando BoardConfigVendor.mk mínimo"
  cat <<EOF > "$DEVICE_DIR/BoardConfigVendor.mk"
# BoardConfigVendor para HP Slate 21 (phobos)
BOARD_USES_GENERIC_AUDIO := true
USE_CAMERA_STUB := true
EOF
fi

echo "✅ Estrutura base criada. Você pode agora revisar os arquivos gerados em $DEVICE_DIR/"

