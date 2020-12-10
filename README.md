## 技術スタック

#### 言語・フレームワーク
- Ruby 2.6.6
- Rails 6.0.3.4

#### データベース
- postgresql

## 環境構築

#### gem

- devise
- devise_token_auth
- rack-cors


#### インストール
```
$ bundle install
```

#### データベース初期設定
```
$ brew install postgresql
$ brew services start postgresql
$ rails db:create
$ rails db:migrate
```

#### 起動
```
$ rails s
http://localhost:3000
```

