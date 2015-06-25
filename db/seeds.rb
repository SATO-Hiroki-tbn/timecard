# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
UserProfile.delete_all
Attendance.delete_all
UsersTeam.delete_all
Team.delete_all
Role.delete_all

Role.create(
  [{role: Role.roles[:user]}, 
  {role: Role.roles[:admin]}, 
  {role: Role.roles[:sysadmin]}] 
  )

user = User.create(email: 'xxxx@xxxx.xx.xx', password: 'password')
role_user = Role.find_by(role: Role.roles[:user])
user.roles << role_user
role_admin = Role.find_by(role: Role.roles[:admin])
user.roles << role_admin

team = Team.create(team_name: 'A-team', description: 'We make something')
UserProfile.create(user_id: user.id, employee_no: 'a0000', lastname: 'foo', firstname: 'bar')
Attendance.create(user_id: user.id, work_date: '2015-06-15', in_time: '09:00', out_time: '18:00',
                  project_name: 'project-X', place: 'place', description: 'I like sushi')
UsersTeam.create(user_id: user.id, team_id: team.id)