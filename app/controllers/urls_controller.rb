class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_url, only: [:edit, :update, :destory]

  def index
	  @urls = current_user.urls
  end

  def new
    @url = current_user.urls.new
    letters = [('0'..'3'),('5'..'9')].map{|i| i.to_a}.flatten
    @url.short_url = (0...4).map{ letters[rand(letters.length)]}.join
  end

  def create
    @url = current_user.urls.build(urls_params)
    if Url.find_by(short_url: urls_params[:short_url]) == nil
      @url.save
      redirect_to '/'
    else
      @url = Url.new(urls_params)
      @url.save
    end
  end

  def edit      
  end

  def update
    if @url.update(urls_params)
      redirect_to '/'
    else
      render "edit"
    end
  end
  
  def destroy
    @url = Url.find_by(id:params[:id])
    @url.destroy
    redirect_to '/'
  end

  def add_click_count
    @url = current_user.urls.find_by(id: params[:id] )
    @url.increment!(:click_count)
    redirect_to @url.original_url
  end
  
  # def show
  #   url = Url.where( : params[:id] ).first

  #   if url
  #     redirect_to url.original
  #   else
  #     render '/'
  #   end
  # end

  private
  def urls_params
    params.require(:url).permit(:original_url, :short_url)
  end
  def find_url
    @url = current_user.urls.find(params[:id])      
  end    
end
