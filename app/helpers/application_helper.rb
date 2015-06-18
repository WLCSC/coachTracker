module ApplicationHelper
  def percent n
    (n * 100).send(n < 0.90 ? :floor : :ceil).to_s + "%"
  end

  def nice_date d
    d.strftime '%b %e, %y'
  end
end
