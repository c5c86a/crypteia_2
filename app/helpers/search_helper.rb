module SearchHelper

 def db_style(search)
  arr = Array.new
  search.results.each do |s|
   arr << s.country unless !s.country
  end
  res=Hash[arr.group_by {|x| x}.map {|k,v| [k,v.count]}]
 end

end
