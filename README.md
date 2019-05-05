# README
# reference https://qiita.com/kazuooooo/items/47e7d426cbb33355590e

## クイズ用のモデルは２つに別れています。 Story model と　Quiz model です##

### まず管理者はStorymodelにドラマタイトルと話目を登録します ###
### その後Quiz modelにCSVを登録しますが、Quiz modelは作成されたStory modelのidを外部キーとして参照することで、ストーリーとタイトルとの対応付けが顔ぬになっています ###

