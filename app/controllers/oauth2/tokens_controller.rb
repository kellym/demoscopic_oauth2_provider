class Oauth2::TokensController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!

  def create
    scopes = (params[:scope] || '').gsub(/\s/,'').split(',')
    
    @refresh_token = oauth2_current_refresh_token || oauth2_current_client.refresh_tokens.create!(:user => current_user) do |refresh_token|
      refresh_token.check_scopes scopes
    end
    @access_token = @refresh_token.access_tokens.create!(:client => oauth2_current_client, :user => current_user) do |access_token|
      access_token.check_scopes scopes
    end
    render :json => @access_token.token_response
  end
  private
  def oauth2_current_client
   env['oauth2.client'] 
  end
  def oauth2_current_refresh_token
    env['oauth2.refresh_token']
  end
end
