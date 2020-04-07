module ApplicationHelper
  # Returns the right flash message CSS class to use
  # From the Rails flash type
  def flash_class(level)
    case level
      when 'notice'  then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error'   then "alert alert-error"
      when 'alert'   then "alert alert-secondary"
    end
  end

  def navbar_active_category?(category)
    # TODO
    false
  end
end
