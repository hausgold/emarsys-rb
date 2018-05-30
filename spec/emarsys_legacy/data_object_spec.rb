require 'spec_helper'

describe EmarsysLegacy::DataObject do
  context "as a class" do

    describe '.get' do
      it "delegates to the instance request method" do
        EmarsysLegacy::DataObject.any_instance.should_receive(:request).with('get', 'test_method', {}).and_return(nil)
        EmarsysLegacy::DataObject.get('test_method', {})
      end

      it "transfers params to specific emarsys params format" do
        EmarsysLegacy::DataObject.any_instance.should_receive(:request).with('get', 'test_method/?a=1&b=2', {}).and_return(nil)
        EmarsysLegacy::DataObject.get('test_method', {'a' => 1, 'b' => 2})
      end
    end

    describe '.post' do
      it "delegates to the instance request method" do
        EmarsysLegacy::DataObject.any_instance.should_receive(:request).with('post', 'test_method', {}).and_return(nil)
        EmarsysLegacy::DataObject.post('test_method', {})
      end
    end

    describe '.put' do
      it "delegates to the instance request method" do
        EmarsysLegacy::DataObject.any_instance.should_receive(:request).with('put', 'test_method', {}).and_return(nil)
        EmarsysLegacy::DataObject.put('test_method', {})
      end
    end

    describe '.delete' do
      it "delegates to the instance request method" do
        EmarsysLegacy::DataObject.any_instance.should_receive(:request).with('delete', 'test_method', {}).and_return(nil)
        EmarsysLegacy::DataObject.delete('test_method', {})
      end
    end

    describe '.parameterize_params' do
      it "converts hash to params string" do
        params = {"a" => 1, "b" => 2, "c" => 3}
        expect(EmarsysLegacy::DataObject.parameterize_params(params)).to eq("?a=1&b=2&c=3")
      end

      it "url_encodes params" do
        params = {"email" => "best/email@mail.org"}
        expect(EmarsysLegacy::DataObject.parameterize_params(params)).to eq("?email=best%2Femail%40mail.org")
      end
    end
  end

  context "as an instance" do
    let(:data_object) { EmarsysLegacy::DataObject.new }

    it "provides a simple #request that delegates to EmarsysLegacy::Request" do
      EmarsysLegacy::Request.any_instance.should_receive(:send_request).and_return(nil)
      data_object.request('get', 'test_method', {})
    end
  end
end
