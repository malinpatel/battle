require './app'
require 'spec_helper'

RSpec.feature "Losing", :type => :feature do
  scenario "Display loser message" do
    sign_in_and_play
    19.times {click_button("Attack")}
    expect(page).to have_content("Mal has lost!")
  end
end
