module GoalsHelper
  def goal_progress_bar(goal)
    content_tag :div, class: 'progress' do
      "<div class='progress-bar' role='progressbar' aria-valuenow='#{60}' aria-valuemin='0' aria-valuemax='100' style='width: #{goal.percent_complete}%'></div>".html_safe
    end
  end
end
