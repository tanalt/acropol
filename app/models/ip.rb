class Ip < ActiveRecord::Base
  VALID_IP_REGEX = /\d{1,3}[.]\d{1,3}[.]\d{1,3}[.]\d{1,3}/
  validates :ip,  presence: true, format: { with: VALID_IP_REGEX },
            uniqueness: true
end
