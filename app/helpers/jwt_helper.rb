require 'jwt'

module JwtHelper

  def generate_jwt
    payload = {
      admin_flag_data: {
        admin: true,
        support: false,
        shard_id: 1
      },
      other_data: {
        hoge: 1,
        fuga: 2
      }
    }
    JWT.encode(payload, rsa_private, 'RS256')
  end

  def decode_jwt(token)
    JWT.decode(token, rsa_public, true, { algorithm: 'RS256' })
  end

  def rsa_private
    @rsa_private ||= OpenSSL::PKey::RSA.generate 2048
  end

  def rsa_public
    @rsa_public ||= rsa_private.public_key
  end
end
