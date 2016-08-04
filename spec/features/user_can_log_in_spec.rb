require "rails_helper"
RSpec.feature "Twitter login is possible" do
  context "user goes to the root path" do
    scenario "User sees a page that allows for login and logo" do
      visit root_path
      expect(page).to have_content("Login")
      expect(page).to have_content("Cast-Away")
      expect(page).to have_button("Search")
      FactoryGirl.create_list(:show, 20)
      fill_in :query, with: "4"
      click_on "Search"

      expect(current_path).to eq(shows_search_path)
      expect(page).to have_content('0 search results for "4"')
    end
  end

  scenario "User can view what's trending from the homepage" do
    visit root_path
    expect(page).to have_button("What's Trending")
  end

end
