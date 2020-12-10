## Ramp Up
Ramp Upは、学習記録を可視化するアプリです。手軽に学習時間を記録して、振り返りをすることができます。

## 技術スタック

#### 言語・フレームワーク
- Ruby 2.6.6
- Rails 6.0.3.4

#### データベース
- Postgresql

## 機能一覧
- 新規登録・ログイン・ログアウト機能
- スキル(学習項目)設定機能
- 学習時間投稿機能
- 翌日のタスクを書き込む機能
- カレンダー表示機能
- グラフ表示機能
- アカウント編集
- スキル編集


## ER図
<img width="636" alt="ER図(12:9)" src="https://user-images.githubusercontent.com/65106886/101722062-c7942600-3aec-11eb-9f0b-2eb05510379e.png">

## 環境構築

#### gem

- devise
- devise_token_auth
- rack-cors


#### インストール
```
$ bundle install
```

#### Posgresqlの導入
```
$ brew install postgresql
$ brew services start postgresql
```

#### データベース初期設定
```
$ rails db:create
$ rails db:migrate
```

## 起動
```
$ rails s
http://localhost:3000
```

