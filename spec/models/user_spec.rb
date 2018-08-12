require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {
    User.create(
      :name => "Mindy",
      :email => "mindy@gmail.com",
      :password => "password",
    )
  }

  let(:library_records) {
    Library.create(
      :name => "My Records",
      :category => "Music",
      :user_id => 1,
    )
  }

  let(:library_books) {
    Library.create(
      :name => "My Books",
      :category => "Books",
      :user_id => 1,
    )
  }

  let(:mastery) {
    Book.create(
      :library_id => 1,
      :name => "Mastery",
      :author => "Robert Greene",
      :format => "Physical Copy",
      :status => "In Progress",
      :note => "Pg. 28 is interesting.",
      :category => "Personal Development",
    )
  }

  let(:emerson) {
    Book.create(
      :library_id => 1,
      :name => "The Essays of Ralph Waldo Emerson",
      :author => "Ralph Waldo Emerson",
      :format => "Physical Copy",
      :status => "In Progress",
      :note => "The Address resonates.",
      :category => "Philosophy",
    )
  }

  it "is valid with a name, email, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(name: "Name")).not_to be_valid
  end

  it "has many libraries" do
    first_library = Library.create(:user_id => user.id, :name => library_books.name, :category => "Books")
    second_library = Library.create(:user_id => user.id, :name => library_records.name, :category => "Records")
    expect(user.libraries.first).to eq(first_ride)
    expect(user.libraries.last).to eq(second_ride)
  end

  it "has many books through libraries" do
    user.books << [mastery, emerson]
    expect(user.books.first).to eq(mastery)
    expect(user.books.last).to eq(emerson)
  end

end
