class AdminController < ApplicationController
  def index
    if request.post?
      if params[:username] == "Anil" && params[:password] == "Anil"
        session[:admin]="admin"
        redirect_to articles_url
      else
        flash[:notice] = "Invalid username/password!...."
        render :action=>"index"
      end
    end
  end

  def logout 
    session[:admin] =nil
    flash[:notice]="you are logged out"
    redirect_to admin_index_url
  end
end
