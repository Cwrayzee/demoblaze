# frozen_string_literal: true

require_relative '../pages_helper'

class SignupModal
  include Capybara::DSL

  # Objects
  SIGNUP_MODAL = 'div.modal-content'
  MODAL_NAME = 'h5#signInModalLabel'
  USERNAME_FIELD = 'input#sign-username'
  PASSWORD_FIELD = 'input#sign-password'
  CLOSE_BTN = 'button.btn.btn-secondary'
  SIGNUP_BTN = 'button.btn.btn-primary'

  # Methods
  def signup_page_reached?
    page.has_css?(SIGNUP_MODAL)
  end

  def signup_existing_user
    fill_out_signup_form('existing_user')
    sign_up_alert_message
  end

  def fill_out_signup_form(user_type)
    case user_type
    when 'new_user'
      user_data = YAML.load_file("spec/test_data/login_data.yml")
      # set unique username and password
      username = user_data["username"] + rand(1000).to_s
      password = user_data["password"] + rand(1000).to_s
      find(USERNAME_FIELD).set username
      find(PASSWORD_FIELD).set password
      # write new user data to yaml file for use later
      new_signup = YAML.load_file('spec/test_data/new_signup_data.yml')
      new_signup['username'] = username
      new_signup['password'] = password
      File.write('spec/test_data/new_signup_data.yml', new_signup.to_yaml)
    when 'existing_user'
      user_data = YAML.load_file("spec/test_data/login_data.yml")
      find(USERNAME_FIELD).set user_data["username"]
      find(PASSWORD_FIELD).set user_data["password"]
    else
      raise 'No User type was provided!'
    end
    sleep 1
    find(SIGNUP_BTN).click
  end

  def sign_up_alert_message
    a = page.driver.browser.switch_to.alert
    message = a.text
    a.accept
    message
  end

  def unique_login_data
    filename = "spec/test_data/login_data.yml"
    username = 'some_user'
    password = 'Admin*123'
    uniq_username = username + rand(1000).to_s
    uniq_password = password + rand(1000).to_s
    File.open(filename)
  end
end
