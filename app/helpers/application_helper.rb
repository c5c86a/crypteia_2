module ApplicationHelper
  def cdn(lib, version, minified='', component='')
    "https://cdnjs.cloudflare.com/ajax/libs/${lib}/${version}/${component}${minified}"
  end
  def dcjs
    cdn('dc', '2.0.2')
  end
end
