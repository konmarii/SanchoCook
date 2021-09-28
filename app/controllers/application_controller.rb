class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :info, :warning, :danger

  # 新規登録後のリダイレクト先
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope == :producer
      producer_root_path
    else
      root_path
    end
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when Customer
      root_path
    when Producer
      producer_root_path
    when AdminUser
      admin_root_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :producer
      new_producer_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        :nickname,
        :company_name,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana,
        :postal_code,
        :address,
        :phone_number,
        :image,
        :introduction,
        :is_permitted,
        :is_delited
      ]
    )
  end
end
