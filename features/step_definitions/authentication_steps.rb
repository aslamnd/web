module AuthenticationHelpers
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = Session.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
end
World(AuthenticationHelpers)

Given /^I am not authenticated$/ do
  visit('/user/sign_out')
end

Given /^I am logged in$/ do
  user = find_model(:user) || Factory(:user)
  login_as user
end
