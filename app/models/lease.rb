class Lease < ApplicationRecord
    belongs_ to :apartment
    belongs_ to :tenant
end
