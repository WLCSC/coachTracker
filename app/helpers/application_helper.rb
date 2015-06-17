module ApplicationHelper
  def percent n
    (n * 100).ceil.to_s + "%"
  end
end
