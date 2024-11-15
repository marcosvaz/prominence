#!/bin/bash

echo "Arquivo pós-backup"

if [ "$(ls -1 | wc -l)" -gt 12 ]; then
    ls -t | tail -n +13 | xargs rm -f
    echo "Arquivos antigos excluídos, exceto os 12 mais recentes."
else
    echo "Menos de 12 arquivos no diretório, nada a excluir."
fi