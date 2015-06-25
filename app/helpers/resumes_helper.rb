module ResumesHelper

  def year(date)
    if date.present?
      date = date.to_s.split("-")
      date[0].to_i
    end
  end

  def month(date)
    if date.present?
      date = date.to_s.split("-")
      date[1].to_i
    end
  end

  def day(date)
    if date.present?
      date = date.to_s.split("-")
      date[2].to_i
    end
  end

end
