class ApplicationController < ActionController::Base
  
  def login_sp_required
    if session[:admin_tf].nil? == true
      redirect_to "/sp/auth/masuk"
    end
  end

end
