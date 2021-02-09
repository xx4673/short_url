class ApplicationController < ActionController::Base
  rescue_from SocketError, with: :invalid_url

  private
  def invalid_url
    render 'pages/welcome'
  end
end
