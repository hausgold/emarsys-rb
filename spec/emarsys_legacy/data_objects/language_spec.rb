require 'spec_helper'

describe EmarsysLegacy::Language do
  describe ".collection" do
    it "requests all languages" do
      stub_get("language") { EmarsysLegacy::Language.collection }.should have_been_requested.once
    end
  end
end