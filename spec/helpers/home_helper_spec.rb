require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe HomeHelper do

	describe HomeHelper do

		describe "pick_guitar" do
			it "assigns a white guitar if requested" do
				pick_guitar('true').should eq('FlyingVW.jpg')
			end

			it "assigns a natural guitar if requested" do
				pick_guitar('false').should eq ('FlyingVN.jpg')
			end
		end
	end
end
