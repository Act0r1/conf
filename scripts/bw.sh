#!/usr/bin/env bash
#
# bw-fzf-pass-by-name.sh — поиск по полю "name", даже если login.username пуст
#
#  Шаги:
#    1) Проверяем, что BW_SESSION задано (иначе — error & exit).
#    2) Получаем список всех записей: name<TAB>id<TAB>login.username (или пусто).
#    3) Запускаем fzf, фильтруем по 1-й колонке (name), но показываем ещё и login.username.
#    4) Если не выбрали ни одной строки — пишем "Ничего не найдено" и выходим.
#    5) Если выбрали — берём 2-ю колонку (id), достаём пароль через jq -r и копируем в буфер.
#
# Требования:
#   - bitwarden CLI (bw) ≥ 1.18 (https://bitwarden.com/help/command-line/)
#   - jq ≥ 1.5 (https://stedolan.github.io/jq/)
#   - fzf (https://github.com/junegunn/fzf)
#   - pbcopy (входит в Mac OS)
#
# Предварительно нужно в том же терминале сделать:
#   bw login <ваш-email>
#   export BW_SESSION="$(bw unlock --raw)"
#

# ----------------------------
# 1) Проверка BW_SESSION
# ----------------------------
if [[ -z "$BW_SESSION" ]]; then
  echo "Ошибка: переменная окружения BW_SESSION не задана."
  echo "Сначала выполните:"
  echo "  bw login <ваш-email>"
  echo "  export BW_SESSION=\"\$(bw unlock --raw)\""
  exit 1
fi

# ----------------------------
# 2) Получаем список всех записей через bw list items
# ----------------------------
items_json=$(bw list items --session "$BW_SESSION")
if [[ -z "$items_json" ]]; then
  echo "Не удалось получить список записей из Bitwarden. Проверьте BW_SESSION или соединение."
  exit 1
fi

# Собираем строки "name<TAB>id<TAB>login.username или пусто"
list_for_fzf=$(echo "$items_json" | jq -r '
  .[]
  | select(.name != null)                                    # отбираем все записи, у которых есть name
  | "\(.name)\t\(.id)\t\((.login.username // "") )"           # если login.username отсутствует, подставляем ""
')

if [[ -z "$list_for_fzf" ]]; then
  echo "В Bitwarden нет записей с полем name."
  exit 1
fi

# ----------------------------
# 3) Запускаем fzf (фильтрация по name)
# ----------------------------
# --delimiter=$'\t'   : разделитель табуляция
# --with-nth=1,3      : показываем две колонки:
#                      1) name (чтобы фильтровать), 3) login.username (для подсказки).
# --prompt="Name> "   : приглашение «Name>»
selected_line=$(printf "%s\n" "$list_for_fzf" | \
  fzf --height=40% --reverse --border --delimiter=$'\t' \
      --with-nth=1,3 --prompt="Name> ")

# Если пользователь нажал Esc / Ctrl-C / не выбрал ничего
if [[ -z "$selected_line" ]]; then
  echo "Ничего не найдено."
  exit 1
fi

# ----------------------------
# 4) Парсим ID из выбранной строки
# ----------------------------
# selected_line: "<name>\t<id>\t<login.username or empty>"
item_id=$(printf "%s" "$selected_line" | cut -f2)
if [[ -z "$item_id" ]]; then
  echo "Не удалось извлечь ID записи."
  exit 1
fi

# ----------------------------
# 5) Достаём пароль (jq -r) и копируем в буфер
# ----------------------------
password=$(bw get item "$item_id" --session "$BW_SESSION" \
  | jq -r '.login.password')

if [[ -z "$password" || "$password" == "null" ]]; then
  echo "Пароль не найден или запись не содержит поле login.password."
  exit 1
fi

# Копируем чистый (raw) пароль в буфер
printf "%s" "$password" | pbcopy
echo "Пароль скопирован в буфер обмена."

