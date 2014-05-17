class HomeController < ApplicationController

  def hello
  	@color_white = params[:color_white]
  end

  def created
  	render 'shared/created'
  end

  def amazon
  	redirect_to('http://www.amazon.com/mp3')
  end
  
end
