require 'rails_helper'

RSpec.describe "user_profiles/edit", type: :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :user_id => 1,
      :lastname => "MyString",
      :firstname => "MyString",
      :in_regular => "MyString",
      :out_regular => "MyString"
    ))
  end

  it "renders the edit user_profile form" do
    render

    assert_select "form[action=?][method=?]", user_profile_path(@user_profile), "post" do

      assert_select "input#user_profile_user_id[name=?]", "user_profile[user_id]"

      assert_select "input#user_profile_lastname[name=?]", "user_profile[lastname]"

      assert_select "input#user_profile_firstname[name=?]", "user_profile[firstname]"

      assert_select "input#user_profile_in_regular[name=?]", "user_profile[in_regular]"

      assert_select "input#user_profile_out_regular[name=?]", "user_profile[out_regular]"
    end
  end
end
