class Passport < ActiveRecord::Base
  belongs_to :employee
  belongs_to :upload
end
