#!/bin/bash
DATA_FILE="passwords.txt"
echo "パスワードマネージャーへようこそ！"

# ★ここから while ループを開始（条件を true にして無限に繰り返す）
while true; do

    echo "次の選択肢から入力してください(Add Password/Exit)："
    read -p "選択：" choice

    case "$choice" in
        "Add Password")
            read -p "サービス名を入力してください：" service_name
            read -p "ユーザー名を入力してください：" user_name
            read -p "パスワードを入力してください：" password

            echo "${service_name}:${user_name}:${password}" >> "$DATA_FILE"
            echo "パスワードの追加が完了しました。"
            echo "" # 画面を見やすくするために空行を入れる
            ;;

        "Exit")
            echo "Thank you!"
            # ★ここ重要！ Exit が選ばれたら break で while ループを脱出する
            break
            ;;

        *)
            echo "入力が間違えています。Add Password または Exit から入力してください。"
            echo ""
            ;;
    esac

# ★ここで while ループの終わりを指定
done