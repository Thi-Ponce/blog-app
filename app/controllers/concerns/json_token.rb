require 'jwt'

module TokenAuthorization
  class TokenClass
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
    def self.encode(payload)
     JWT.encode(payload, SECRET_KEY)
    end

    def decode
    end
  end
end