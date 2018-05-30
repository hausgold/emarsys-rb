require 'spec_helper'

describe EmarsysLegacy::EmailLaunchStatus do
  describe "CODES constant" do
    it "is an array of size 4" do
      expect(EmarsysLegacy::EmailLaunchStatus::CODES.size).to eq(4)
    end
  end

  describe ".collection" do
    it "requests all email_launch_status" do
      expect(EmarsysLegacy::EmailLaunchStatus.collection).to eq(EmarsysLegacy::EmailLaunchStatus::CODES)
    end
  end

  describe ".resource" do
    it "requests a single email launch status" do
      expect(EmarsysLegacy::EmailLaunchStatus.resource(0)).to eq({'0'   => 'Not launched'})
    end

    it "returns nil if it cannot find a launch code" do
      expect(EmarsysLegacy::EmailLaunchStatus.resource(100)).to eq(nil)
    end
  end
end