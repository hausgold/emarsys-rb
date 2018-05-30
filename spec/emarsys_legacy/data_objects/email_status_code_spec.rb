require 'spec_helper'

describe EmarsysLegacy::EmailStatusCode do
  describe "CODES constant" do
    it "is an array of size 5" do
      expect(EmarsysLegacy::EmailStatusCode::CODES.size).to eq(5)
    end
  end

  describe ".collection" do
    it "requests all email_status_codes" do
      expect(EmarsysLegacy::EmailStatusCode.collection).to eq(EmarsysLegacy::EmailStatusCode::CODES)
    end
  end

  describe ".resource" do
    it "requests a single email status code hash" do
      expect(EmarsysLegacy::EmailStatusCode.resource(1)).to eq({'1'   => 'In design'})
    end

    it "returns nil if it cannot find a status code" do
      expect(EmarsysLegacy::EmailStatusCode.resource(100)).to eq(nil)
    end
  end
end