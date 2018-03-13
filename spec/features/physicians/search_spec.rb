require 'rails_helper'


feature "user can search" do
  let(:user) {FactoryBot.create(:user)}
  let!(:physician1) {FactoryBot.create(:physician)}
  let!(:physician2) {FactoryBot.create(:physician, postal_code: "12345")}
  let!(:physician3) {FactoryBot.create(:physician, first_name: "Matt")}

  scenario "search by postal_code" do
    sign_in user
    visit physicians_path

    fill_in "search", :with => "01234"
    click_button "Search"

    expect(page).to have_content(physician1.postal_code)
    expect(page).to have_content("01234")
    expect(page).to_not have_content("12345")

  end
end
