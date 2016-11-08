class Submission < ActiveRecord::Base
    scope :status, -> (status) { where status: status }
end
