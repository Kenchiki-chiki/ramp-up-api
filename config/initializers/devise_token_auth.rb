DeviseTokenAuth.setup do |config|
  # リクエストごとにトークンを更新するか
  config.change_headers_on_each_request = false

  # トークンの有効期間
  config.token_lifespan = 2.weeks

  # headersの名前対応
  config.headers_names = {:'access-token' => 'access-token',
                          :'client' => 'client',
                          :'expiry' => 'expiry',
                          :'uid' => 'uid',
                          :'token-type' => 'token-type' }
end
