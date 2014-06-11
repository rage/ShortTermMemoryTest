module AuthHelper
  def http_login
    username = 'foo'
    password = 'bar'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,password)
  end
end

module AuthRequestHelper
#
# pass the @env along with your request, eg:
#
# GET '/labels', {}, @env
#
  def http_login
    @env ||= {}
    username = 'foo'
    password = 'bar'
    @env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(username,password)
  end
end