require 'rails_helper'

RSpec.describe "papers/new", type: :feature do
  it "should exist at 'new_paper_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_paper_path
  end
  it "should have text inputs for an paper's title, venue, and year" do
    visit new_paper_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('paper[title]')
    expect(page).to have_field('paper[venue]')
    expect(page).to have_field('paper[year]')
  end
  it "should create and submit a new paper" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Alans biogriphy '
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '2000'
    find('input[type="submit"]').click
  end

  it "should not submit an invalid new page" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: ''
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: '1'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
    expect(page).to have_text('Title can\'t be blank')
  end

  it "should not submit another invalid new page" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Test'
    page.fill_in 'paper[venue]', with: 'Berlin'
    page.fill_in 'paper[year]', with: 'w'
    find('input[type="submit"]').click
    expect(page).to have_text('error')
    expect(page).to have_text('Year is not a number')
  end
end
