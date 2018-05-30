require 'spec_helper'

describe EmarsysLegacy::Condition do
  describe ".collection" do
    it "requests all conditions" do
      stub_get("condition") { EmarsysLegacy::Condition.collection }.should have_been_requested.once
    end
  end
end