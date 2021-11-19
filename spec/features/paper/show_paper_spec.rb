require 'rails_helper'

RSpec.describe "papers/show", type: :feature do
  it "renders attributes in <p>" do
    @paper = Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    visit paper_path(@paper)
    expect(page).to have_text("Title")
    expect(page).to have_text("Venue")
    expect(page).to have_text("2")
  end
  it "should see the full name of an author" do
    @paper = FactoryBot.create :paper

    visit paper_path(@paper)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).to have_text("Alan")
    expect(page).to have_text("Turing")
  end

end
