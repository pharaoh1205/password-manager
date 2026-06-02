#!/bin/bash
DATA_FILE="passwords.txt"
echo "パスワードマネージャーへようこそ！"

# ★ここから while ループを開始（条件を true にして無限に繰り返す）
while true; do

    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read -p "選択：" choice

    case "$choice" in
        "Add Password")
            # （ここはさっき作った中身がそのまま入ります）
            read -p "サービス名を入力してください：" service_name
            read -p "ユーザー名を入力してください：" user_name
            read -p "パスワードを入力してください：" password
            echo "${service_name}:${user_name}:${password}" >> "$DATA_FILE"
            echo "パスワードの追加が完了しました。"
            echo ""
            ;;

        "Get Password")
            read -p "サービス名を入力してください：" search_name
            
            echo "--- 検索結果 ---"
            grep "^${search_name}:" "$DATA_FILE"
            echo "----------------"
            echo ""
            ;;

        "Exit")
            echo "Thank you!"
            break
            ;;

        *)
            echo "入力が間違えています。Add Password または Exit から入力してください。"
            echo ""
            ;;
    esac

# ★ここで while ループの終わりを指定
done