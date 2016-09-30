module LocationHelpers
  def value_for_location(element)
    case element
    when 'North Central'
      153
    when 'Northwest'
      154
    when 'Northeast'
      155
    when 'Southeast'
      157
    when 'South Central'
      158
    when 'Southwest'
      159
    when 'National/Other'
      160
    when 'Non Retail Special Use'
      982
    when '9694 / GOLF & MILWAUKEE'
      2077
    when '235'
      3232
    when '225'
      3223
    else
      raise ArgumentError, "Location '#{element}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World LocationHelpers
