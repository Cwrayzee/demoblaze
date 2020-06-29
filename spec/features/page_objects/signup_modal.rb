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

  def fill_out_signup_form
    user_data = YAML.load_file("spec/test_data/login_data.yml")
    find(USERNAME_FIELD).set user_data["username"]
    find(PASSWORD_FIELD).set user_data["password"]
    binding.pry
  end
end
