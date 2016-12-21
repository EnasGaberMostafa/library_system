require 'rails_helper'

RSpec.describe "rates/index", type: :view do
  before(:each) do
    assign(:rates, [
      Rate.create!(
        :val => 1,
        :book => nil,
        :user => nil
      ),
      Rate.create!(
        :val => 1,
        :book => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of rates" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
