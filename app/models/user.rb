require 'openssl'

class User < ActiveRecord::Base
  attr_accessor :password

  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :email, email_format: { message: :invalid_email_address }
  validates :username, length: { in: 2 .. 40 }, format: { with: /\A[а-яёa-z0-9_]+\z/ }
  validates :bg_color, format: { with: /\A#([\da-f]{3}){1,2}\z/i }, allow_blank: true
  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_validation :downcase
  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS, DIGEST.length, DIGEST)
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? &&
      user.password_hash == User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  def downcase
    if username.present?
      self.username.downcase!
    end
  end
end
