class SessionsController < ApplicationController
  
  def new; end
  
  def create
  user = User.authenticate(params[:session][:email], params[:session][:password])
  
  
  if user
     sign_in user
     redirect_to user
  
  else
     
    redirect_to root_url, alert: "Wrong email or password. Please, try again"
  
  end
  end
  
  def destroy
    redirect_to main_page_url
    sign_out
    
    
  end
  
  
end
