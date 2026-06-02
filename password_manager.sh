# このファイルをBashというシェルで実行して
#!/bin/bash
DATA_FILE="passwords.txt"
echo "パスワードマネージャーへようこそ！"

# ★ここから while ループを開始（条件を true にして無限に繰り返す）
while true; do

    echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
    read -p "選択：" choice

    case "$choice" in
        "Add Password")
            while true; do
                read -p "サービス名を入力してください：" service_name
                read -p "ユーザー名を入力してください：" user_name
                read -p "パスワードを入力してください：" password

                # 入力値が空かどうかをチェック (-z は「空なら成功」という意味)
                if [ -z "$service_name" ] || [ -z "$user_name" ] || [ -z "$password" ]; then
                    echo "エラー：すべての項目を入力してください。"
                    echo ""
                    # whileの最初に戻って、入力をやり直させる
                    continue
                else
                    # すべて正しく入力されていたら、チェックのループを抜ける
                    break
                fi
            done

            # ここは今まで通り、ファイルへの保存処理
            echo "${service_name}:${user_name}:${password}" >> "$DATA_FILE"
            echo "パスワードの追加が完了しました。"
            echo ""
            ;;

        "Get Password")
            read -p "サービス名を入力してください：" search_name
            
            if grep -q "^${search_name}:" "$DATA_FILE" 2>/dev/null; then
                # 【見つかった場合】
                # 見つかった行をパイプ(|)で次の命令に渡してバラす
                grep "^${search_name}:" "$DATA_FILE" | while IFS=: read -r svc user pwd; do
                    echo "サービス名：$svc"
                    echo "ユーザー名：$user"
                    echo "パスワード：$pwd"
                done
                
            else
                # 【見つからなかった場合】
                echo "そのサービスは登録されていません。"
            fi
            
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