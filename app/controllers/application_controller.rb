class ApplicationController < ActionController::Base
  def check_user_status
    @user = User.find(current_user.id)
    unless @user.status == 'approve' 
      redirect_to :questions, notice: "Your account is not yet approved by Admin"
    end
  end
end
