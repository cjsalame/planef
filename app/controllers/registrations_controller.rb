# RegistrationsController
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(
      :name, :lastname, :dob, :phone, :email, :password,
      :password_confirmation, :role, :avatar, :avatar_cache
    )
  end

  def account_update_params
    params.require(:user).permit(
      :name, :lastname, :dob, :phone, :email, :password,
      :password_confirmation, :current_password,
      :avatar, :avatar_cache, :remove_avatar
    )
  end
end
