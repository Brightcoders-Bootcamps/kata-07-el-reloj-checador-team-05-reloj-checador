# frozen_string_literal: true

# Model User
class User < ApplicationRecord
  include Clearance::User
end
