module AttendancesHelper

  def link_to_search
    if true #current_user.admin?
      link_to 'team', teams_path
    else
      nil
    end
  end

  def work_times
    work_time = []
    (0...36).each do |hour|
      0.step(45, 15) do |minute|
        time = sprintf("%02d:%02d", hour, minute)
        work_time << [time, time]
      end
    end
    work_time
  end

end
