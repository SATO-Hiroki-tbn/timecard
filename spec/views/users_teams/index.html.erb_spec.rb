require 'rails_helper'

RSpec.describe "users_teams/index", type: :view do
  before(:each) do
    assign(:users_teams, [
      UsersTeam.create!(
        :user_id => 1,
        :team_id => 2
      ),
      UsersTeam.create!(
        :user_id => 1,
        :team_id => 2
      )
    ])
  end

  it "renders a list of users_teams" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
