require 'rails_helper'

describe "edit author page", type: :feature do
    it "should exist at 'edit_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        FactoryBot.create :author
        visit edit_author_path(1)
    end
    it "should edit and submit an author's details" do
        FactoryBot.create :author
        visit edit_author_path(1)
        page.fill_in 'author[first_name]', with: 'Alan'
        page.fill_in 'author[last_name]', with: 'Turing'
        page.fill_in 'author[homepage]', with: 'www.Alan_Turing.de'
        find('input[type="submit"]').click
        @author.reload
    end
  
end