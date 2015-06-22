require 'rails_helper'

describe User do

	describe "Create" do

		before do
			@user = User.create(
						client_name: "test", 
						password: "test1234", 
						password_confirmation: "test1234", 
						email: "test@email.com", 
						role: "client"
					)
		end

		describe "default user role" do
			it "is set to client" do
				expect( @user.role ).to eq( "client" )
			end
		end

	end
end