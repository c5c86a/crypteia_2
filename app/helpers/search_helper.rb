module SearchHelper

  def db_style(search)
    arr = Array.new
    search.results.each do |s|
      arr << s.threat_id unless !s.threat_id
    end
    Hash[arr.group_by {|x| x}.map {|k,v| [k,v.count]}]
    byebug
  end

  def db_style_top_10(search)
    arr= Array.new
    hash= Hash.new
    search.results.each do |s|
      arr << [s.threat_id , s.threat_tri]
    end
    hash = arr.to_h
  end

end
