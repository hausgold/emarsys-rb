require 'spec_helper'

describe EmarsysLegacy::Client do

  describe 'configs for username and password' do
    it 'inherits username from module' do
      EmarsysLegacy.stub(:api_username).and_return("my_username")
      expect(EmarsysLegacy::Client.new.username).to eq("my_username")
    end

    it 'inherits password from module' do
      EmarsysLegacy.stub(:api_password).and_return("my_password")
      expect(EmarsysLegacy::Client.new.password).to eq("my_password")
    end

    it 'raises error if api_username is not set' do
      EmarsysLegacy.stub(:api_username).and_return(nil)
      expect{EmarsysLegacy::Client.new.username}.to raise_error(ArgumentError, 'EmarsysLegacy.api_username is not set')
    end

    it 'raises error if api_password is not set' do
      EmarsysLegacy.stub(:api_password).and_return(nil)
      expect{EmarsysLegacy::Client.new.password}.to raise_error(ArgumentError, 'EmarsysLegacy.api_password is not set')
    end
  end

  context 'client authentication' do
    describe '#x_wsse_string' do
      it 'builds x_wsse_string with specific format' do
        EmarsysLegacy::Client.any_instance.stub(:username).and_return("my_username")
        EmarsysLegacy::Client.any_instance.stub(:header_password_digest).and_return("12345689")
        EmarsysLegacy::Client.any_instance.stub(:header_nonce).and_return("some_header_nonce")
        EmarsysLegacy::Client.any_instance.stub(:header_created).and_return("2013-01-01")
        expect(EmarsysLegacy::Client.new.x_wsse_string).to eq(
          'UsernameToken Username="my_username", PasswordDigest="12345689", Nonce="some_header_nonce", Created="2013-01-01"'
        )
      end
    end

    describe '#header_password_digest' do
      before :each do
        EmarsysLegacy::Client.any_instance.stub(:calculated_digest).and_return("something")
      end

      it 'encodes string with Base64' do
        Base64.should_receive(:encode64).with("something").and_return("something_base64_encoded")
        EmarsysLegacy::Client.new.header_password_digest
      end

      it 'strips of \n character' do
        Base64.should_receive(:encode64).with("something").and_return("something_base64_encoded\n")
        expect(EmarsysLegacy::Client.new.header_password_digest).to eq("something_base64_encoded")
      end
    end

    describe '#header_nonce' do
      it 'uses 16 random bytes to generate a 32 char hex string' do
        expect(EmarsysLegacy::Client.new.header_nonce).to match(/^[0-9a-f]{32}$/i)
      end
    end

    describe '#header_created' do
      it 'uses current timestamp format' do
        expect(EmarsysLegacy::Client.new.header_created).to eq(Time.now.utc.iso8601)
      end
    end

    describe '#calculated_digest' do
      it 'runs sha1 on header_nonce + header_created + password' do
        EmarsysLegacy::Client.any_instance.stub(:header_nonce).and_return("some_header_nonce")
        EmarsysLegacy::Client.any_instance.stub(:header_created).and_return("12345689")
        EmarsysLegacy::Client.any_instance.stub(:password).and_return("my_password")
        Digest::SHA1.should_receive(:hexdigest).with("some_header_nonce12345689my_password")
        EmarsysLegacy::Client.new.calculated_digest
      end
    end

  end

end
