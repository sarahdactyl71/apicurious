class  SessionsController < ApplicationController

  def create
    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=5b71ff0d7ddaf4bff8bf&client_secret=c2dfb7094e4b445c815b4ed5c9a7b948acb7eb64&code=#{params["code"]}")

    token = @response.body.split(/\W+/)[1]
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)
    binding.pry
  end
end
