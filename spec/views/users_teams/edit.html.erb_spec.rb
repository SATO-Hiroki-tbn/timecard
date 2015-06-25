require 'rails_helper'

RSpec.describe "users_teams/edit", type: :view do
  before(:each) do
    @users_team = assign(:users_team, UsersTeam.create!(
      :user_id => 1,
      :team_id => 1
    ))
  end

  it "renders the edit users_team form" do
    render

    assert_select "form[action=?][method=?]", users_team_path(@users_team), "post" do

      assert_select "input#users_team_user_id[name=?]", "users_team[user_id]"

      assert_select "input#users_team_team_id[name=?]", "users_team[team_id]"
    end
  end
end
