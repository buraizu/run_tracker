class SessionsController < ApplicationController

  def new
  end


  def create
   if auth_hash = request.env["omniauth.auth"]
     @runner = Runner.find_or_create_by_omniauth(auth_hash)
     session[:runner_id] = @runner.id
     redirect_to runner_path(@runner.id)
   else
     @runner = Runner.find_by(username: params[:username])
      if @runner && @runner.authenticate(params[:password])
        session[:runner_id] = @runner.id
        redirect_to runner_path(@runner.id)
      else
        flash[:notice] = "Invalid username or password"
        render:new
      end
    end
  end

  def destroy
    session.delete :runner_id
    redirect_to "/"
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end

# auth_hash
#
# {"provider"=>"github",
#  "uid"=>"36318703",
#  "info"=>
#   {"nickname"=>"buraizu", "email"=>nil, "name"=>nil, "image"=>"https://avatars0.githubusercontent.com/u/36318703?v=4", "urls"=>{"GitHub"=>"https://github.com/buraizu", "Blog"=>""}},
#  "credentials"=>{"token"=>"e8f5670ebeda40aaabc41046730a6bf32e4c4a0e", "expires"=>false},
#  "extra"=>
#   {"raw_info"=>
#     {"login"=>"buraizu",
#      "id"=>36318703,
#      "node_id"=>"MDQ6VXNlcjM2MzE4NzAz",
#      "avatar_url"=>"https://avatars0.githubusercontent.com/u/36318703?v=4",
#      "gravatar_id"=>"",
#      "url"=>"https://api.github.com/users/buraizu",
#      "html_url"=>"https://github.com/buraizu",
#      "followers_url"=>"https://api.github.com/users/buraizu/followers",
#      "following_url"=>"https://api.github.com/users/buraizu/following{/other_user}",
#      "gists_url"=>"https://api.github.com/users/buraizu/gists{/gist_id}",
#      "starred_url"=>"https://api.github.com/users/buraizu/starred{/owner}{/repo}",
#      "subscriptions_url"=>"https://api.github.com/users/buraizu/subscriptions",
#      "organizations_url"=>"https://api.github.com/users/buraizu/orgs",
#      "repos_url"=>"https://api.github.com/users/buraizu/repos",
#      "events_url"=>"https://api.github.com/users/buraizu/events{/privacy}",
#      "received_events_url"=>"https://api.github.com/users/buraizu/received_events",
#      "type"=>"User",
#      "site_admin"=>false,
#      "name"=>nil,
#      "company"=>nil,
#      "blog"=>"",
#      "location"=>nil,
#      "email"=>nil,
#      "hireable"=>true,
#      "bio"=>nil,
#      "public_repos"=>303,
#      "public_gists"=>2,
#      "followers"=>0,
#      "following"=>0,
#      "created_at"=>"2018-02-10T02:26:34Z",
#      "updated_at"=>"2018-11-23T20:17:37Z"},
#    "all_emails"=>[]}}
#
