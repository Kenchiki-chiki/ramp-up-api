## 技術スタック

#### 言語・フレームワーク
- Ruby 2.6.6
- Rails 6.0.3.4

#### データベース
- Postgresql

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

#### 起動
```
$ rails s
http://localhost:3000
```

