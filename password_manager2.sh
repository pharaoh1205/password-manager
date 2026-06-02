#!/bin/bash
DATA_FILE="passwords.txt"
echo "パスワードマネージャーへようこそ！"

# ★ここから新しく追加
echo "次の選択肢から入力してください(Add Password/Exit)："
read -p "選択：" choice

case "$choice" in
    "Add Password")
        # ★ここに、さっきまで使っていたステップ1の処理を入れます
        read -p "サービス名を入力してください：" service_name
        read -p "ユーザー名を入力してください：" user_name
        read -p "パスワードを入力してください：" password

        echo "${service_name}:${user_name}:${password}" >> "$DATA_FILE"
        echo "パスワードの追加が完了しました。"
        ;;

    "Exit")
        # ★Exit と打たれたら、Thank you! と言って終わる
        echo "Thank you!"
        ;;

    *)
        # ★予定外の文字（あ、とか 123 とか）が打たれた場合
        echo "入力が間違えています。Add Password または Exit から入力してください。"
        ;;
esac