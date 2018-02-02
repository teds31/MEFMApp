require 'rails_helper'

feature "authenticated user edits own review" do

  #User Story
  # As an authenticated user
  # I am able to update a review i wrote on a medical specialist
  # In case i changed my mind or made a mistake

  #Acceptance Criteria
  # Authenticated user that is viewing the medical specialist page
  # Sees and clicks on Edit Review button
  # Is taken to original form to make edits and then clicks on submit

  let(:user) {FactoryBot.create(:user)}
  let!(:physician1) {FactoryBot.create(:physician)}
  let!(:physician2) {FactoryBot.create(:physician, last_name: "Grossman")}
  let!(:physician3) {FactoryBot.create(:physician, first_name: "Matt")}

  scenario 'authenticated user sees edit button on their own review' do
    sign_in user
    visit physicians_path
    click_link physician1.first_name

    expect(page).to have_content("Edit Review")
  end

  scenario 'authenticated user does not see edit button for a review they do not own' do
    sign_in user
    visit phsycians_path
    click_link physician1.first_name


    expect(page).to_not have_content("Edit Review")
  end

  scenario 'authenticated user edits review and submits' do
    sign_in user
    visit phsycians_path
    click_link physician1.first_name
    click_button("Edit Review")

    fill_in
    click_button("Submit")

    expect(page).to have_content("Review updated!")
  end

  scenario 'authenticated user gets error when not filling out form correctly for update' do
    sign_in user
    visit phsycians_path
    click_link physician1.first_name
    click_button("Edit Review")

    fill_in
    click_button("Submit")

    expect(page).to have_content("Failed to save review. Check all fields")
  end
end
