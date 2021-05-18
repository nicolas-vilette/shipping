module ShopsHelper
  def weekdays
    [
      {label: "Monday", value: 1},
      {label: "Tuesday", value: 2},
      {label: "Wednesday", value: 3},
      {label: "Thursday", value: 4},
      {label: "Friday", value: 5},
      {label: "Saturday", value: 6},
      {label: "Sunday", value: 0},
    ]
  end

  def integer_day_to_string(integer_day)
    Date::DAYNAMES[integer_day]
  end

  def schedules_form(schedule_start, schedule_end)
    if schedule_start && schedule_end
      "#{time_format(schedule_start)} - #{time_format(schedule_end)}"
    elsif schedule_start
      "#{time_format(schedule_start)}"
    elsif schedule_end
      "#{time_format(schedule_end)}"
    end
  end

end
