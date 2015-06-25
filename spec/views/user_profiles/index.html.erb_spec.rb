require 'rails_helper'

RSpec.describe "user_profiles/index", type: :view do
  before(:each) do
    assign(:user_profiles, [
      UserProfile.create!(
        :user_id => 1,
        :lastname => "Lastname",
        :firstname => "Firstname",
        :in_regular => "In Regular",
        :out_regular => "Out Regular"
      ),
      UserProfile.create!(
        :user_id => 1,
        :lastname => "Lastname",
        :firstname => "Firstname",
        :in_regular => "In Regular",
        :out_regular => "Out Regular"
      )
    ])
  end

  it "renders a list of user_profiles" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "In Regular".to_s, :count => 2
    assert_select "tr>td", :text => "Out Regular".to_s, :count => 2
  end
end
