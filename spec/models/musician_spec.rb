require 'spec_helper'

describe Musician do

	let(:test_good){Musician.new(first_name: "FName", last_name: "LName", born: "1/1/2000")}
  let(:test_no_Lname){Musician.new(first_name: "FName",  born: "1/1/2000")}
  let(:test_bad_date){Musician.new(first_name: "FName", last_name: "LName", born: "May")}
  let(:test_neg_date){Musician.new(first_name: "FName", last_name: "LName", born: "1/1/2020")}

  context "When validating a musician record, it" do

  	it "should recognize a good record" do
  	  expect(FactoryGirl.create(:musician).valid?).to be_true
  	end

  	it "must have a last name" do
  		expect(FactoryGirl.build(:musician, last_name: "").valid?).to be_false
  	end
  end
end
