require 'rails_helper'

RSpec.describe "UsersTeams", type: :request do
  describe "GET /users_teams" do
    it "works! (now write some real specs)" do
      get users_teams_path
      expect(response).to have_http_status(200)
    end
  end
end
