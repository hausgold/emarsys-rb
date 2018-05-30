module EmarsysLegacy
  # Custom error class for rescuing from EmarsysLegacy errors
  class Error < StandardError
    def initialize(code, text, status)
      @code = code
      @text = text
      @status = status
      super(build_error_message)
    end

    def build_error_message
      "HTTP-Code: #{@status}, Emarsys-Code: #{@code} - #{@text}"
    end
  end

  # Raised when EmarsysLegacy returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when EmarsysLegacy returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when EmarsysLegacy returns a 500 HTTP status code
  class InternalServerError < Error; end
end