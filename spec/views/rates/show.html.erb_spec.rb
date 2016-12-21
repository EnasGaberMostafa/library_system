require 'rails_helper'

RSpec.describe "rates/show", type: :view do
  before(:each) do
    @rate = assign(:rate, Rate.create!(
      :val => 1,
      :book => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
