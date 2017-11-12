module ApplicationHelper
  def page_title
    [content_for(:title), t('page_title')].compact.join(' - ')
  end

  def bootstrap_class_for flash_type
    case flash_type.to_s
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
