
describe 'Sign up for an account', type: :feature, js: true, persist: :true do
  include PagesHelper

  it 'able to access sign up modal' do
    visit '/'
    main_navbar.goto_page('Sign up')
    expect(signup_modal.signup_page_reached?).to be_truthy
  end

  it 'able to fill in and submit the sign up form' do
    signup_modal.fill_out_signup_form
    binding.pry
  end

end
