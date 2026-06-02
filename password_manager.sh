# このファイルをBashというシェルで実行して
#!/bin/bash


# 保存先ファイルの名前を定義
DATA_FILE="passwords.txt"

echo "パスワードマネージャーへようこそ！"

# ユーザーからの入力を受け取る
read -p "サービス名を入力してください：" service_name
read -p "ユーザー名を入力してください：" user_name
read -p "パスワードを入力してください：" password

# 「サービス名:ユーザー名:パスワード」の形式でファイルに追記保存
echo "${service_name}:${user_name}:${password}" >> "$DATA_FILE"

echo "Thank you!"

