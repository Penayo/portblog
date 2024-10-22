require "rails_helper"

RSpec.describe "Sign Up", type: :system do
  describe "Register a new account" do
    it "should register a new account and sign in" do
      visit new_account_path

      within("#account") do
        fill_in "account_email",	with: "penayo.gustavo@gmail.com"
        fill_in "account_password", with: "penayo321"
        fill_in "account_password_confirmation", with: "penayo321"
      end

      click_button 'commit'
      expect(page).to have_content('Blog')
    end
  end
end
