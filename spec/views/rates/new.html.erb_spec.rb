require 'rails_helper'

RSpec.describe "rates/new", type: :view do
  before(:each) do
    assign(:rate, Rate.new(
      :val => 1,
      :book => nil,
      :user => nil
    ))
  end

  it "renders new rate form" do
    render

    assert_select "form[action=?][method=?]", rates_path, "post" do

      assert_select "input#rate_val[name=?]", "rate[val]"

      assert_select "input#rate_book_id[name=?]", "rate[book_id]"

      assert_select "input#rate_user_id[name=?]", "rate[user_id]"
    end
  end
end
