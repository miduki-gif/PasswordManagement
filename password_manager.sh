#!/bin/bash
while true;do
echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
read choice

case $choice in
	"Add Password") 
		read -p "サービス名を入力してください：" SystemName        
		read -p "ユーザー名を入力してください：" UserName
                read -sp "パスワードを入力してください：" Password
                echo $SystemName:$UserName:$Password >> passwordManeged.txt
		echo "パスワードの追加は成功しました。";;

        "Get Password") 
		echo "サービス名を入力してください："
                read SystemName
	        InsertExists=$(grep -w $SystemName passwordManeged.txt)       
			if [ -z "$InsertExists" ]; then
				echo "そのサービスは登録されていません。"
			else
				echo "サービス名: $SystemName"
				echo "ユーザー名: $UserName"
				echo "パスワード: $Password"
			fi
		        ;;	
                        
	"Exit")
		echo "Thank you!"
	        break;;
	*)
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	esac
done
