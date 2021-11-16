require 'rails_helper'

describe "edit author page", type: :feature do
    it "should exist at 'edit_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        @author = FactoryBot.create :author
        visit edit_author_path(@author)
    end
    it "should edit and submit an author's details" do
        @author = FactoryBot.create :author
        visit edit_author_path(@author)
        page.fill_in 'author[first_name]', with: 'Alan the best'
        page.fill_in 'author[last_name]', with: 'Turing'
        page.fill_in 'author[homepage]', with: 'www.Alan_Turing.de'
        find('input[type="submit"]').click
        @author.reload()
        expect(@author.first_name).to eq 'Alan the best'
        expect(@author.last_name).to eq 'Turing'
        expect(@author.homepage).to eq 'www.Alan_Turing.de'
    end
end