# README

# 環境構築 以下のコマンドを実行してください

1 clone this repository
```
$git clone https://github.com/itotoma/Vocablary-app.git
```


2 環境変数設定
.envに以下を記述してください

```
S3_REGION = "S3のRegion"
S3_BUCKET = "S3のバケット名"
S3_HOST = "S3の'xxxxx.mp3'の直全までのURL/" ( 例: https://s3-ap-northeast-1.amazonaws.com/test-vocablary-app/uploads/vocab-app/ )
APP_HOST = "このアプリのホスト名(URL)"" ( 例: https://vocablaryapp.heroku.com/")
```

3 以下のコマンドを実行
```
$bundle install --withoout production
$yum install mysql-devel
$sudo !!
$sudo service mysqld start
$rails db:create
$rails db:migrate
```

4 Heroku app を作り、URLを教えてください
```
SNSログインの設定に必要です。設定はこちらで行います。
```