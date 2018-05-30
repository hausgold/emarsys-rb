require 'spec_helper'

describe EmarsysLegacy::Segment do
  describe ".collection" do
    it "requests all segments" do
      stub_get("filter") { EmarsysLegacy::Segment.collection }.should have_been_requested.once
    end
  end
end