require 'spec_helper'

describe EmarsysLegacy::Response do

  describe '#initialize' do
    it 'sets code, text and data attributes on initialize' do
      response_string = "{\"replyCode\":0,\"replyText\":\"Something\",\"data\":1}"
      response = EmarsysLegacy::Response.new(response_string)
      expect(response.code).to eq(0)
      expect(response.text).to eq("Something")
      expect(response.data).to eq(1)
    end
  end

  describe '#result' do
    let(:response) { EmarsysLegacy::Response.new("{\"replyCode\":0,\"replyText\":\"Something\",\"data\":1}") }

    it "returns data if code is 0" do
      response.stub(:code).and_return(0)
      expect(response.result).to eq(1)
    end

    it "raises BadRequest error if code is not 0" do
      response.stub(:code).and_return(1)
      expect{response.result}.to raise_error(EmarsysLegacy::BadRequest)
    end

    it "raises Unauthorized error if http-status is 401" do
      response.stub(:code).and_return(1)
      response.stub(:status).and_return(401)
      expect{response.result}.to raise_error(EmarsysLegacy::Unauthorized)
    end
  end

end