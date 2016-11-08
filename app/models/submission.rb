class Submission < ActiveRecord::Base
    include Filterable
    scope :status, -> (status) { where status: status }
end
