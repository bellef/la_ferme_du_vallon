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
    found_category = Category.find_by(id: params[:category_id])

    return unless found_category

    found_category.id == category.id
  end

  def link_to_category(category, css_class: nil)
    link_to(category.title, products_path(category_id: category.id), class: css_class)
  end
end
