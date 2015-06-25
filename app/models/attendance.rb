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
    [projects.take(1).first.try(:project_name), projects.take(1).first.try(:place)]
  end 

  def self.to_csv(user, work_date)
    work_date = Date.parse(work_date) unless work_date.is_a? Date
    export_columns = column_names.dup
    ["id", "user_id", "created_at", "updated_at"].each {|key| export_columns.delete(key)}

    CSV.generate do |csv|
      csv << export_columns
      find_in_month(user, work_date).each do |elem|
        # SJISで出す必要がなければmapはいらない
        if elem.first[1] 
          csv << elem.first[1].attributes.values_at(*export_columns).map{|v| v.to_s.encode('Shift_JIS', undef: :replace, replace: '')}
        else
          csv << [elem.first[0]]
        end
           
      end
    end
  end
end


