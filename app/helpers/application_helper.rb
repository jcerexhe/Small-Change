module ApplicationHelper
  require 'uri'

	def full_title(page_title = '')
		base_title = "Small Change"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end	

  def strip_url(uri)
    url = URI(uri).host
    url.sub!(/www./, '') if url.include? "www."
    return url
  end
  
  # def truncate(string, max)
  #   string.length > max ? "#{string[0...max]}..." : string
  # end

end
