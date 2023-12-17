#!/bin/bash

# присваивается путь к корневому каталогу репозитория
REPO_PATH=$(git rev-parse --show-toplevel)

check_txt_format() {
	# присваивается список измененных файлов, оканчивающихся на .txt
	local files=($(git diff --cached --name-only --diff-filter=ACMRTUXB "$REPO_PATH" | grep '\.txt$'))
	for file in "${files[@]}"; do
	# проверка. Файл должен начинаться с # Название книги
		if ! grep -q '^# Название книги:' "$REPO_PATH/$file"; then
			echo "Ошибка. Файл должен начинаться с '# Название книги:'"
			exit 1
		fi
	done
}

check_txt_format

exit 0
