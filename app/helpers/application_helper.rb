module ApplicationHelper
  def percent n
	begin
    (n * 100).send(n < 0.90 ? :floor : :ceil).to_s + "%"
	rescue
		"NaN%"
	end
  end

  def nice_date d
    d.strftime '%b %e, %y'
  end
end
