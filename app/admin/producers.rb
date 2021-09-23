ActiveAdmin.register Producer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :company_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :image_id, :introduction, :is_permitted, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  permit_params do
    permitted = [:company_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :image_id, :introduction, :is_permitted, :email, :encrypted_password]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  
end
