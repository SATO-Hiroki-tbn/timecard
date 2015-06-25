class Team < ActiveRecord::Base
  has_many :users_teams
end
