class Passport < ActiveRecord::Base
  has_paper_trail

  belongs_to :employee
  belongs_to :upload
end
