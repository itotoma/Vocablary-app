# README

環境構築 以下のコマンドを実行してください

1 clone this repository
```
$git clone https://github.com/itotoma/Vocablary-app.git
```

2 
```
bundle install --withoout production
yum install mysql-devel
sudo !!
```

3
```
sudo service mysqld start
rails db:create
rails db:migrate
```

#環境変数設定
###Facebook, twetter,google,yahooの開発者アカウントを取得し,API_KEY と SECRET_KEY を取得します。 
##.envに以下を記述してください

```
FACEBOOK_KEY = "xxxxxxx"
FACEBOOK_SECRET = "xxxxxxx"
TWITTER_API_KEY = "xxxxxxx"
TWITTER_API_SECRET = "xxxxxxx"
GOOGLE_CLIENT_ID = "xxxxxxx"
GOOGLE_CLIENT_SECRET = "xxxxxxx"
YAHOO_CLIENT_ID = "xxxxxxx"
YAHOO_CLIENT_SECRET = "xxxxxxx"

S3_REGION = "S3のRegion"
S3_BUCKET = "S3のバケット名"
S3_HOST = "S3の'xxxxx.mp3'の直全までのURL/" ( 例: https://s3-ap-northeast-1.amazonaws.com/test-vocablary-app/uploads/vocab-app/ )
APP_HOST = "このアプリのホスト名(URL)"" ( 例: https://vocablaryapp.heroku.com/")
```
