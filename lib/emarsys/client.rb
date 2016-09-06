module Emarsys
  class Client

    def username
      raise ArgumentError, "Emarsys.api_username is not set" if Emarsys.api_username.nil?
      Emarsys.api_username
    end

    def password
      raise ArgumentError, "Emarsys.api_password is not set" if Emarsys.api_password.nil?
      Emarsys.api_password
    end

    def x_wsse_string
      nonce = header_nonce
      string = 'UsernameToken '
      string += 'Username="' + username + '", '
      string += 'PasswordDigest="' + header_password_digest(nonce).strip + '", '
      string += 'Nonce="' + nonce + '", '
      string += 'Created="' + header_created + '"'
      string
    end

    def header_password_digest(nonce)
      Base64.encode64(calculated_digest(nonce)).gsub("\n", "")
    end

    def header_nonce
      SecureRandom.hex
    end

    def header_created
      Time.now.utc.iso8601
    end

    def calculated_digest(nonce)
      Digest::SHA1.hexdigest(nonce + header_created + password)
    end

  end
end
