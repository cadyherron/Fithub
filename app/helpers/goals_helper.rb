module GoalsHelper
  def goal_progress_bar(goal)
    content_tag :div, class: 'progress' do
      "<div class='progress-bar #{'progress-bar-success' if goal.complete?}' role='progressbar' aria-valuenow='#{60}' aria-valuemin='0' aria-valuemax='100' style='width: #{goal.percent_complete}%'></div>".html_safe
    end
  end

  def icon_for_goal_type(goal_type)
    case goal_type
    when "Calories Burned"
      "<span class='glyphicon glyphicon-fire'></span>".html_safe
    when "Calories Consumed"
      "<span class='glyphicon glyphicon-cutlery'></span>".html_safe
    end
  end
end
