require 'rails_helper'

describe "show author page", type: :feature do
  it "should exist a show page for specific authors" do
    FactoryBot.create :author

    visit author_path(1)
    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
  end
end