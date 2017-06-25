module SearchHelper

  def db_style(search)
    arr = Array.new
    search.each do |s|
      arr << s.country unless !s.country
    end
    Hash[arr.group_by {|x| x}.map {|k,v| [k,v.count]}]
  end

  def db_style_country_pie(search)
    hash= Hash.new
    arr = Array.new
    search.response.aggregations.group_by_country.buckets.each do |bucket|
      arr << [bucket.first.last , bucket.doc_count]
    end
    hash = arr.to_h
  end

  def db_style_country_tri_pie(search)
    hash= Hash.new
    arr = Array.new
    search.response.aggregations.group_by_country.buckets.each do |bucket|
      arr << [bucket.first.last, bucket.average_threat_tri.value]
    end
    hash = arr.to_h
  end

  def db_style_top_10(search)
    arr= Array.new
    hash= Hash.new
    search.results.each do |s|
      arr << [s.threat_id , s.threat_tri]
    end
    hash = arr.to_h
  end

  def record_graph(record)
    arr= Array.new
    hash= Hash.new
    record.each do |r|
      arr << [ r.timestamp , r.threat_tri]
    end
    hash = arr.to_h
  end
end
