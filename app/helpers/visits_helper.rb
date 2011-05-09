module VisitsHelper
  def check_box_visited_all_tag from
    check_box_tag 'visits', update_visits_path(:format => :js, :from => from), false, :id => 'visit_all'
  end

  def check_box_visited_tag country, from
    check_box_tag 'visit', update_visits_path(:format => :js, :from => from), current_user.visited?(country), :class => 'visit', :'data-country' => country.id
  end
end