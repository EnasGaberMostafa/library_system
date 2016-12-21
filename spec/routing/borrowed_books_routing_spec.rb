require "rails_helper"

RSpec.describe BorrowedBooksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/borrowed_books").to route_to("borrowed_books#index")
    end

    it "routes to #new" do
      expect(:get => "/borrowed_books/new").to route_to("borrowed_books#new")
    end

    it "routes to #show" do
      expect(:get => "/borrowed_books/1").to route_to("borrowed_books#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/borrowed_books/1/edit").to route_to("borrowed_books#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/borrowed_books").to route_to("borrowed_books#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/borrowed_books/1").to route_to("borrowed_books#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/borrowed_books/1").to route_to("borrowed_books#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/borrowed_books/1").to route_to("borrowed_books#destroy", :id => "1")
    end

  end
end
