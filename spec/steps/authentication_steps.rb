INPUT_FIELD_MAPPING = { 'Email' => 'user_email', 'Password' => 'user_password', 'Password_confirmation' => 'user_password_confirmation' }.freeze
SELECTOR_NAME_MAPPING = { 'Notice' => '.notice', 'Alert' => '.alert' }.freeze

step "I'm open home page" do
  visit root_path
end

step "I click :link_title link" do |link_title|
  find("a", text: link_title).click
end

step "I click reset password link for :user_email" do |user_email|
  user = User.find_by(email: user_email)
  raw, enc = Devise.token_generator.generate(User, :reset_password_token)

  user.reset_password_token   = enc
  user.reset_password_sent_at = Time.now.utc
  user.save(validate: false)
  path = Rails.application.routes.url_helpers.edit_user_password_path(reset_password_token: raw)
  visit path
end

step "User with email :email and password :password logged in" do |email, password|
  step "I click 'Login' link"
  step "I fill 'Email' field with '#{email}'"
  step "I fill 'Password' field with '#{password}'"
  step "I click 'Log in' button"
end

step "I fill :field_name field with :value" do |field_name, value|
  first("input[id=#{INPUT_FIELD_MAPPING[field_name]}]").fill_in(with: value)
end

step "I click :title_button button" do |title_button|
  find("input[value='#{title_button}']").click
end

step "I should see :selector_name flash message :message" do |selector_name, message|
  find(SELECTOR_NAME_MAPPING[selector_name], text: message)
  wait_for_ajax
end

step "I should see email :user_email" do |user_email|
  find("p", text: user_email)
end

step "User with email :email and password :password exists" do |email, password|
  FactoryBot.create(:user, email: email, password: password)
end
