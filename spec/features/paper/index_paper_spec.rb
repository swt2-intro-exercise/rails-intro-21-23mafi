require 'rails_helper'

RSpec.describe "papers/index", type: :feature do
  it "visit a list of papers" do
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    )
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    )
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 3
    )

    visit papers_path
    expect(page).to have_text("Title")
    expect(page).to have_text("Venue")
    expect(page).to have_text("Year")
    expect(page).to have_text("2")
    expect(page).to have_text("3")
  end
  it "renders just papers of a specific year" do
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    )
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    )
    Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 3
    )

    visit papers_path(year: 2)
    expect(page).to have_text("Title")
    expect(page).to have_text("Venue")
    expect(page).to have_text("Year")
    expect(page).to have_text("2")
    expect(page).to_not have_text("3")
  end
end
