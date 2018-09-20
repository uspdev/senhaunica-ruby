class Senhaunica

  def initialize(key,secret,id)
    @key = key
    @secret = secret
    @id = id
  end

  def login

    @consumer = gera_consumidor()
    @request_token = @consumer.get_request_token

    #session[:token] = @request_token.token
    #session[:token_secret] = @request_token.secret
    @@token = @request_token.token
    @@token_secret = @request_token.secret

    return @request_token.authorize_url + '&callback_id=' + @id

  end

  def callback(oauth_verifier)

    @consumer = gera_consumidor()
    hash = { oauth_token: @@token, oauth_token_secret: @@token_secret}
    @request_token  = OAuth::RequestToken.from_hash(@consumer, hash)
    @access_token = @request_token.get_access_token(oauth_verifier: oauth_verifier)
    json_response = @access_token.post("https://uspdigital.usp.br/wsusuario/oauth/usuariousp");
    return JSON.parse(json_response.body)

  end

  def gera_consumidor

    return OAuth::Consumer.new(@key, @secret, {
                                           :site               => "https://uspdigital.usp.br",
                                           :scheme             => :header,
                                           :http_method        => :post,
                                           :request_token_path => "/wsusuario/oauth/request_token",
                                           :access_token_path  => "/wsusuario/oauth/access_token",
                                           :authorize_path     => "/wsusuario/oauth/authorize"
                                       })
  end

end
