<img width="1790" alt="Ramp Up top" src="https://user-images.githubusercontent.com/65106886/107134839-043b9c80-6939-11eb-871c-3a081f507854.png">


# 概要
Ramp Upは、手軽に学習記録や振り返りができる学習管理アプリです。
今後伸ばしていきたいと思っているスキルを設定し、各スキルに対して手軽に学習記録をつけることができます。
また、タスクの管理機能やカレンダー機能、チャートの表示機能などを活用し、短期的・長期的な学習状況の管理ができるようになっています。
“ユーザーがより快適に使える”,“とにかく手軽でシンプル”というコンセプトをもとに設計しました。

# 制作背景

- 毎日なんとなくだらけてしまう
- １日の振り返りが面倒でためらってしまう
- 学習のモチベーションが維持できない

上記のような課題に対して、学習記録をつけるハードルを下げて習慣化を促すことで課題を解決できるようにしたいと考え、作成に至りました。

# URL

# 使用技術

- フロントエンド
    - Vue.js(Nuxt.js) 2.14.7 
    - Javascript
    - HTML / CSS / Vuetify

- **バックエンド**
    - **Ruby 2.6.6**
    - **Rails API 6.0.3.4**
   
- **フロントエンドとバックエンドの繋ぎこみ**
    - **Axios**
    - **Auth Module**
    
# テーブル

## usersテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|email  |string  |null: false  |
|password  |string  |null: false  |
|provider  |string  |default: "email", null: false  |
|uid  |string  |default: "", null: false  |


## skillsテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|user_id  |bigint  |null: false, foreign_key:true  |
|name  |string  |  |

## study_timesテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|skill_id  |bigint  |null: false, foreign_key:true  |
|study_hour  |float  |  |
|studied_on  |date  |  |

## tasksテーブル
|Colmun  |Type  |Options  |
|---|---|---|
|user_id  |bigint  |null: false, foreign_key:true  |
|name  |  |  |


# 機能一覧

- **ユーザー登録関連**(devise_token_auth / auth module / axios/  vuetify)
    - 新規登録機能
    - ログイン、ログアウト機能
    - メールアドレス変更機能
    - トライアル機能(ゲストユーザー登録機能)

- **スキル設定関連**(axios / vuex / vuetify)
    - ユーザーに紐づくスキルの一括登録機能

- **学習記録関連**(axios / vuex /  vuetify)
    - ユーザーのスキルに紐づく学習時間の一括登録機能
    - 学習時間の表示機能

- **スキル編集関連**(axios / vuex / vuetify)
    - スキルの追加、削除機能

- **タスク管理関連**(axios / vuex / vuetify)
    - タスクの書き込み、一括登録機能、一括削除機能
    - タスクの編集機能

- **カレンダー関連**(axios / vuex / vuetify)
    - カレンダー表示機能
    - 学習時間に応じた各日付の背景色の表示機能
    - 各日付の学習時間表示機能

- **チャート関連**(vue-chartjs / axios / vuex / vuetify)
    - 棒グラフの表示機能
        - 月別学習時間の表示
    - 円グラフの表示機能
        - スキル別学習時間の表示
    - スキル別学習時間のランキング表示機能

- **その他**
    - フラッシュメッセージ機能
    - エラーメッセージ機能
    - バリデーション機能
    - ログイン前後のリダイレクト機能

# 使い方

## ユーザー認証
### 新規登録
トップページにある` SIGN UP `ボタンをクリックすると、新規登録画面に遷移します。
### ログイン
トップページにある` SIGN IN `ボタンをクリックすると、ログイン画面に遷移します。
### ログアウト
ログイン後に表示されるユーザーアイコンをクリックし、表示されるメニューから` ログアウト `をクリックすることでログアウトできます。
### メールアドレス変更
ログイン後に表示されるユーザーアイコンをクリックし、表示されるメニューから` アカウント編集 `をクリックするとメールアドレス変更画面に遷移します。
### ゲスト登録
トップページにある` GUEST `ボタンをクリックすると、メールアドレスやパスワードの入力不要でゲストユーザー登録できます。


![re toolbar color](https://user-images.githubusercontent.com/65106886/107144551-32dc6600-697f-11eb-9ba7-9c3882fda918.jpg)

![user icon color](https://user-images.githubusercontent.com/65106886/107144425-6b2f7480-697e-11eb-8047-30dac08ece3a.png)



## スキル設定
新規登録やゲスト登録をするとスキル設定ページに遷移します。このページでは、これから伸ばしていきたいスキルを設定することができます。
![demo](https://gyazo.com/da6274845cb794c677fd702fb159d889/raw)

## 学習記録
各スキルに対して学習時間を入力できます。
1日に複数回入力することも可能です。

![demo](https://gyazo.com/b06a64a43163f61413368c1d518cd3d7/raw)

## スキル編集
必要に応じてスキルの追加や削除ができます。

![demo](https://gyazo.com/c0c93cbeafe850c716bbf8ef969ebdbb/raw)

## タスク管理
タスクを管理するためのメモができます。
書き込んだ内容は一括して保存、削除することが可能です。
タスク1つ1つに対して編集することもできるようになっています。

![demo](https://gyazo.com/6bdb4b962944e5d357c2c6257e06fefb/raw)

## カレンダー
学習時間を確認するためのカレンダーです。
学習時間に応じて各日付の背景色が変わることで、その月にどの程度学習できたかがすぐにわかります。
各日付をクリックすることでその日の学習時間を確認することも可能です。

![demo](https://gyazo.com/5f9bb0eb5b5ab81eae5dc79735a67243/raw)

## チャート
長期的な学習時間を確認することができます。
棒グラフと円グラフを表示し、月別学習時間とスキル別学習時間を表示することができるようになっています。

![demo](https://gyazo.com/20ff34db020f3d0a188753e51e53efb1/raw)
