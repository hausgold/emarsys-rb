require 'spec_helper'

describe EmarsysLegacy::Form do
  describe ".collection" do
    it "requests all languages" do
      stub_get("form") { EmarsysLegacy::Form.collection }.should have_been_requested.once
    end
  end
end