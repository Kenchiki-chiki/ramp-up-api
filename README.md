## Ramp Up


## 技術スタック

#### 言語・フレームワーク
- Ruby 2.6.6
- Rails 6.0.3.4

#### データベース
- Postgresql

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

