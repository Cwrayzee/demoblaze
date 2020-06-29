# frozen_string_literal: true

require_relative '../pages_helper'

class MainNavbar

  include Capybara::DSL

  # Objects

  def goto_page(page_link)
    click_link(page_link)
  end

end
