require 'rails_helper'

feature 'user leaves a review for the physician' do
  #User Story
  #User wants to leave a review of the medical specialist
  #And rate them on their treatment
  #To let other users know of how good that doctor is

  #Acceptance Criteria
  #View physician page sees link to add review
  #Click button and taken to review form to fill out
  #fills out review form clicks submit
  #taken back to physician page where review is available

  let(:user) {FactoryBot.create(:user)}
  let!(:physician1) {FactoryBot.create(:physician)}
  let!(:physician2) {FactoryBot.create(:physician, last_name: "Grossman")}
  let!(:physician3) {FactoryBot.create(:physician, first_name: "Matt")}

  scenario 'authenticated user sees leave review button' do
    sign_in user
    visit physicians_path
    click_link physician1.first_name

    expect(page).to have_content("Add Review")
  end

  scenario 'authenticated user fills review form' do
    sign_in user
    visit physicians_path
    click_link physician1.first_name
    click_button("Add Review")

    fill_in
    click_button("Submit")

    expect(page).to have_content("Review saved successfully.")
  end

  scenario "authenticated user does not fill out form properly" do
    sign_in user
    visit physicians_path
    click_link physician1.first_name
    click_button("Add Review")

    fill_in
    click_button("Submit")

    expect(page).to have_content("Failed to save review. Check all fields")
  end
end
