require 'spec_helper'

describe EmarsysLegacy::Field do
  describe ".collection" do
    it "requests all fields" do
      stub_get("field") { EmarsysLegacy::Field.collection }.should have_been_requested.once
    end

    it "requests all fields with translate parameter" do
      stub_get("field/translate/en") { EmarsysLegacy::Field.collection('translate' => 'en') }.should have_been_requested.once
    end
  end

  describe ".choice" do
    it "requests the choice options of a field" do
      stub_get("field/1/choice") { EmarsysLegacy::Field.choice(1) }.should have_been_requested.once
    end
  end
end