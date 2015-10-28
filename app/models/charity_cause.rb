class CharityCause < ActiveRecord::Base
  belongs_to :cause
  belongs_to :charity
end
