class UserSerializer < ApplicationSerializer
  attribute(:email)
  attribute(:first_name)
  attribute(:last_name)
  attribute(:address)
  attribute(:city)
  attribute(:zip_code)
  attribute(:telephone)

  has_many(:dogs)
  has_many(:reviews)
end
