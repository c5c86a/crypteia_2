module ElaHelper
  def stuff
    @response.body.each do |key|
      next unless key == 'hits'
      key.each do |key2|
        if key2.is_a?
          key2.each do |key3|
          end
        end
      end
    end
  end
end
