module JobsHelper

  def hot_category_class(sub_category_id)
    case sub_category_id
      when 7
        'warm'
      when 8
        'info'
      when 9
        'success'
      else
        'hot'
    end
  end

end
