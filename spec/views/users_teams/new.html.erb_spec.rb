require 'rails_helper'

RSpec.describe "users_teams/new", type: :view do
  before(:each) do
    assign(:users_team, UsersTeam.new(
      :user_id => 1,
      :team_id => 1
    ))
  end

  it "renders new users_team form" do
    render

    assert_select "form[action=?][method=?]", users_teams_path, "post" do

      assert_select "input#users_team_user_id[name=?]", "users_team[user_id]"

      assert_select "input#users_team_team_id[name=?]", "users_team[team_id]"
    end
  end
end
