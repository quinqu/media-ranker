module ApplicationHelper
  def alert_style(flash)
    if flash[:error]
      return "flash-msg__section alert alert-danger"
    elsif flash[:welcome]
      return "flash-msg__section alert alert-success"
    elsif flash[:notice]
      return "flash-msg__section alert alert-info"
    end 
  end 
end
