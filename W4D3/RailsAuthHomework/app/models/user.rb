class User < ApplicationRecord

  # similar to the homework help
  # https://github.com/appacademy/curriculum/blob/master/rails/readings/auth-part-i.md

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  # Make sure that ensure_session_token gets called before_validation
  before_validation :ensure_session_token

  # Remember: you have to add an attr_reader for password
  # for the validation to occur!
  # because you only store the username + password_digest
  attr_reader :password

    # Write ::find_by_credentials
    # This method takes in a username and a password and
    # returns the user that matches
    def self.find_by_credentials(username, password)
      user = User.find_by(username: username)
      return user if user && is_password?(password)
    end

    # THESE HELPER WAS IN THE HOMEWORK HELPES
    # https://github.com/appacademy/curriculum/blob/master/rails/readings/auth-part-i.md
    def is_password?(password)
      # is_password? is a BCrypt method
      BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    #  Write ::generate_session_token
    #  This is a helper method I like to write that uses
    #  SecureRandom::urlsafe_base64 and
    #  returns a 16-digit pseudorandom string
    def self.generate_session_token
      SecureRandom::urlsafe_base64
    end

    # Write reset_session_token!
    def self.reset_session_token!
      # This method resets the user's session_token
      self.session_token = User.generate_session_token
      # and saves the user
      self.save!
      # returns the session_token
      self.session_token
    end

    #  Write ensure_session_token
    def ensure_session_token
      #  This method makes sure that the user has a session_token set
          if self.session_token
            return true
          else
            #  setting one if none exists
            self.session_token = User.generate_session_token
          end
      # SOLUTION:  self.session_token ||= User.generate_session_token
    end


  # Write password=
  # THESE WERE IN THE HOMEWORK HELPES
  # https://github.com/appacademy/curriculum/blob/master/rails/readings/auth-part-i.md
  def password=(password)
    # This method sets @password equal to the argument given
    # so that the appropriate validation can happen
    @password = password
    # This method also encrypts the argument given
    # and saves it as this user's password_digest
    self.password_digest = BCrypt::Password.create(password)
  end


end
