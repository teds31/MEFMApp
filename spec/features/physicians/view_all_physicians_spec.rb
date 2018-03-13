
require 'rails_helper'


feature "user can view all physicans" do
  let(:user) {FactoryBot.create(:user)}
  let!(:physician1) {FactoryBot.create(:physician)}
  let!(:physician2) {FactoryBot.create(:physician, last_name: "Grossman")}
  let!(:physician3) {FactoryBot.create(:physician, first_name: "Matt")}

  scenario "View all physicians" do
    sign_in user
    visit physicians_path

    expect(page).to have_content(physician1.last_name)
    expect(page).to have_content("Grossman")
    expect(page).to have_content("Matt")
  end
end
