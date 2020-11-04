module DeviseHelper
  def login_user(user=nil)
    user_to_sign_in = user || FactoryBot.create(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user_to_sign_in
  end
end
