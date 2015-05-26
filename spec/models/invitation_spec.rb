require 'rails_helper'

describe Invitation do
  describe "invitation creation" do
    
    before do
      @invitation = Invitation.create
    end
    
    describe "token" do
      it "should exist" do
        expect( @invitation.token ).to be_truthy
      end
    end
    
  end
end
