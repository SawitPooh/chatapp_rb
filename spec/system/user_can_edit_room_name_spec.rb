require 'rails_helper'

describe "edit process", type: :feature do
  context "when a room exists, the user can edit the room name" do
  before :each do
    @room = Room.create!(name: 'test room')
  end

  it "edits room name" do
    user_goes_room_page
    user_goes_edit_room_name
    user_fills_edit_room_name
    user_submits_edit_room_name
    user_should_see_updated_room_name
  end

  def user_goes_room_page
    visit rooms_path
  end

  def user_goes_edit_room_name
    visit edit_room_path(@room)
  end

  def user_fills_edit_room_name
    within '#actions' do
      fill_in 'room_name', with: 'edit room'
    end
  end

  def user_submits_edit_room_name
    click_button 'Update Room'
  end

  def user_should_see_updated_room_name
    expect(page).to have_content('edit room')
  end

  end
end
