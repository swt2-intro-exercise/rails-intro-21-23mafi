require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should determine first_name, last_name and hompage from an author" do
    author = Author.new()
    author.first_name = "Alan"
    author.last_name = "Turing"
    author.homepage = "http://wikipedia.org/Alan_Turing"
    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
  end
  it "should determine first_name and last_name from name" do
  a = Author.new()
  a.first_name = "Alan"
  a.last_name = "Turing"
  a.homepage = "http://wikipedia.org/Alan_Turing"
  expect(a.name).to eq("Alan Turing")
end
end
