class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  #アカウント登録後のリダイレクト先
  # def after_sign_up_path_for(resource)
  #   edit_user_registration_path
  # end

end
