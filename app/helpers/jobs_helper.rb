module JobsHelper

  def hot_category_class(sub_category_id)
    case sub_category_id
      when 222
        'warm'
      when 139
        'info'
      when 31
        'success'
      else
        'hot'
    end
  end


  def duties(duty_arr)
    duty_html = ""
    if duty_arr.present?
      duty_arr.each_with_index do |duty,i|
        duty_html += %(<li>#{i+1}.#{duty}</li>)
      end
    end
    duty_html.html_safe
  end

  def requirements(requirement_arr)
    requirement_html = ""
    if requirement_arr.present?
      requirement_arr.each_with_index do |requirement,i|
        requirement_html += %(<li>#{i+1}.#{requirement}</li>)
      end
    end
    requirement_html.html_safe
  end

end
