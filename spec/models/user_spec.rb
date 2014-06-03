require 'spec_helper'

describe User do

	context "User record"

		it "should contain an email address" do
			expect(FactoryGirl.create(:user).valid?).should be_true
		end

end
