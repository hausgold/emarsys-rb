require 'spec_helper'

describe EmarsysLegacy::Folder do
  describe ".collection" do
    it "requests all folders" do
      stub_get("folder") { EmarsysLegacy::Folder.collection }.should have_been_requested.once
    end

    it "requests all folders with parameters" do
      stub_get("folder/?folder=3") { EmarsysLegacy::Folder.collection(:folder => 3) }.should have_been_requested.once
    end
  end
end
