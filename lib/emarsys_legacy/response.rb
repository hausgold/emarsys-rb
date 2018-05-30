module EmarsysLegacy
  class Response
    attr_accessor :code, :text, :data, :status

    def initialize(response)
      json = JSON.parse(response)
      self.code = json['replyCode']
      self.text = json['replyText']
      self.data = json['data']
      self.status = response.code if response.respond_to?(:code)
    end

    def result
      if code == 0
        data
      elsif !status.nil? && status == 401
        raise EmarsysLegacy::Unauthorized.new(code, text, status)
      else
        raise EmarsysLegacy::BadRequest.new(code, text, status)
      end
    end

  end
end