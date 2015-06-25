require 'rails_helper'

RSpec.describe "user_profiles/show", type: :view do
  before(:each) do
    @user_profile = assign(:user_profile, UserProfile.create!(
      :user_id => 1,
      :lastname => "Lastname",
      :firstname => "Firstname",
      :in_regular => "In Regular",
      :out_regular => "Out Regular"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/In Regular/)
    expect(rendered).to match(/Out Regular/)
  end
end
