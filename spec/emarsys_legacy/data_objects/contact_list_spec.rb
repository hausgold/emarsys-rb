require 'spec_helper'

describe EmarsysLegacy::ContactList do
  describe ".collection" do
    it "requests all contactlists" do
      stub_get("contactlist") { EmarsysLegacy::ContactList.collection }.should have_been_requested.once
    end
  end
end