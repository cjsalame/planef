# RegistrationsController
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(
      :name, :lastname, :dob, :phone, :email, :password,
      :password_confirmation, :role, :avatar_file
    )
  end

  def account_update_params
    params.require(:user).permit(
      :name, :lastname, :dob, :phone, :email, :password,
      :password_confirmation, :current_password, :role, :avatar_file
    )
  end
end
