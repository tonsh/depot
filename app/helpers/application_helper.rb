module ApplicationHelper
  def fmt_dollar(amt)
    sprintf("$%0.2f", amt)
  end
end
