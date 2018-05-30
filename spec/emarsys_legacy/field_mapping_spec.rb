require 'spec_helper'

describe EmarsysLegacy::FieldMapping do

  it "defines constant ATTRBUTES " do
    EmarsysLegacy::FieldMapping::ATTRIBUTES.should be_a(Array)
  end

  it "defines constant ATTRBUTES as an array if hashes" do
    EmarsysLegacy::FieldMapping::ATTRIBUTES.should be_a(Array)
    EmarsysLegacy::FieldMapping::ATTRIBUTES.map{|elem| elem.should be_a(Hash)}
  end

end