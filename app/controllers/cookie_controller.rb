class CookieController < ApplicationController
  def new
    cookies[:blue_cookie] = cookie
    render plain: cookies[:blue_cookie]
    # redirect_to root_path
  end

  private

  def cookie
    {
      value: 'hogehogehoge',
      domain: '.example.com'
    }
  end
end
