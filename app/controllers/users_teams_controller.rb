class UsersTeamsController < ApplicationController
  before_action :set_users_team, only: [:show, :edit, :update, :destroy]

  # GET /users_teams
  # GET /users_teams.json
  def index
    @users_teams = UsersTeam.all
  end

  # GET /users_teams/1
  # GET /users_teams/1.json
  def show
  end

  # GET /users_teams/new
  def new
    @users_team = UsersTeam.new
  end

  # GET /users_teams/1/edit
  def edit
  end

  # POST /users_teams
  # POST /users_teams.json
  def create
    @users_team = UsersTeam.new(users_team_params)

    respond_to do |format|
      if @users_team.save
        format.html { redirect_to @users_team, notice: 'Users team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @users_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @users_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_teams/1
  # PATCH/PUT /users_teams/1.json
  def update
    respond_to do |format|
      if @users_team.update(users_team_params)
        format.html { redirect_to @users_team, notice: 'Users team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @users_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_teams/1
  # DELETE /users_teams/1.json
  def destroy
    @users_team.destroy
    respond_to do |format|
      format.html { redirect_to users_teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_team
      @users_team = UsersTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_team_params
      params.require(:users_team).permit(:user_id, :team_id)
    end
end
