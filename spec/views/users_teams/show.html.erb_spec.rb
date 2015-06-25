require 'rails_helper'

RSpec.describe "users_teams/show", type: :view do
  before(:each) do
    @users_team = assign(:users_team, UsersTeam.create!(
      :user_id => 1,
      :team_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
