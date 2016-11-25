require './app'
require 'spec_helper'

RSpec.feature "Attacking player 2", :type => :feature do
  scenario "Reduce player 2's HP by 10" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Mal:90")
  end
end
