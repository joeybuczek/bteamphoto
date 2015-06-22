require 'rails_helper'

describe Image do 

	describe "Image URL" do

		before do
			@image = Image.create(
								name: "test.jpg",
								genre: "wedding",
								description: "test"
							)
		end

		describe "url method" do
			it "should display full location" do
				expect( @image.url ).to eq("http://bteamphoto.com/images/wedding/test.jpg")
			end
		end

	end
end