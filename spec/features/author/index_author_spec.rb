require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'authors_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path
  end
  it "should have table with all authors" do
    FactoryBot.create :author
    visit authors_path
    expect(page).to have_css 'table'
    within 'table' do
        expect(page).to have_text("Name")
        expect(page).to have_text("Homepage")
        expect(page).to have_text("Alan Turing")
        expect(page).to have_text "http://wikipedia.de/Alan_Turing"
        expect(page).to have_link "Details page", href: author_path(1)
    end
  end
  it "should habe a link to create new authors" do
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
  end
end
