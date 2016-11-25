require 'spec_helper.rb'
require 'game'

RSpec.feature "Switching_turns", :type => :feature do
  scenario "Both players can take turns attacking" do
    sign_in_and_play
    click_button("Attack")
    expect(page).to have_content("Mal's turn")
  end
end
