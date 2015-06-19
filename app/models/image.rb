class Image < ActiveRecord::Base
  belongs_to :collection

	def url
		return "http://bteamphoto.com/images/#{genre}/#{name}"
	end

end
