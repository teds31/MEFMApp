require 'rails_helper'

feature "What an admin can do" do
  let(:user1) {FactoryBot.create(:user, role: "member")}
  let(:user2) {FactoryBot.create(:user, role: "admin")}
  let(:user3) {FactoryBot.create(:user, role: "admin",id: 1)}
  let!(:physician1) {FactoryBot.create(:physician)}
  let!(:physician_review1) {FactoryBot.create(:physician_review, review: "GREAT!", user_id: 1)}
  let!(:physician_review2) {FactoryBot.create(:physician_review, review: "AWESOME!", user_id: 2,id: 2)}

  scenario "a non-admin user can sucessfully become an admin user" do
    user1.update_attributes(:role => 'admin')

    expect(user1.role).to be == ('admin')
    expect(user1.role).not_to be == ('member')
  end

  scenario "an admin can edit any physican's review" do
    sign_in user2
    visit physicians_path
    click_link("John Smith")
    click_link("Edit Review")
    fill_in "Rating", with: 1
    fill_in "Review", with: "He was the worst doctor!"
    click_button "Submit Changes"

    expect(page).to have_content("Review Succesfully Updated")
    expect(page).to have_content("He was the worst doctor!")
    expect(page).to have_content('Edit Review')
    expect(page).to have_content('Delete Review')
  end


  scenario "non-admin can not edit or delete someone else's review" do
    sign_in user1
    visit '/physicians/1'
    physician1.physician_reviews.each do |review|
      if review.user_id != user1.id
        expect(page).to_not have_content('Edit Review')
        expect(page).to_not have_content('Delete Review')
      else
        expect(page).to have_content('Edit Review')
        expect(page).to have_content('Delete Review')
      end
    end
  end

  scenario "non-admin can edit their own review" do
    sign_in user1 #user_id of 1
    visit '/physicians/1'
    physician1.physician_reviews.each do |review|
      if review.user_id == user1.id
        expect(page).to have_content('Edit Review')
      else
        expect(page).to_not have_content('Edit Review')
      end
    end
  end
end
