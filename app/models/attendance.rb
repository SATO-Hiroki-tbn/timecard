class Attendance < ActiveRecord::Base
  belongs_to :user, dependent: :destroy

  #self.primary_keys = :user_id, :work_date

  # Singleton methods

  def self.find_in_month(user, work_date = Date.today)
    term = work_date.beginning_of_month..work_date.end_of_month
    attendances = where(user_id: user.id, work_date: term)
    term.map do |date|
      { date => attendances.find { |attend| attend.work_date == date } }
    end
  end

  def self.recent_project(user)
    projects = where(user_id: user.id)
    projects = projects.select("project_name, place")
    projects = projects.order("work_date DESC")
    [projects.take(1).first.project_name, projects.take(1).first.place]
  end 
end
