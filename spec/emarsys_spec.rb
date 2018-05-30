require 'spec_helper'

describe EmarsysLegacy do

  describe ".configure" do
    [:api_endpoint, :api_username, :api_password].each do |key|
      it "sets the #{key.to_s.gsub('_', ' ')}" do
        EmarsysLegacy.configure do |config|
          config.send("#{key}=", key)
        end
        expect(EmarsysLegacy.instance_variable_get(:"@#{key}")).to eq key
      end
    end
  end

  describe ".api_endpoint getter" do
    it "returns specific url as default value" do
      EmarsysLegacy.api_endpoint = nil
      EmarsysLegacy.api_endpoint.should eq('https://api.emarsys.net/api/v2')
    end
  end
end
