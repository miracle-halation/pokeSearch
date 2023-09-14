class User < ApplicationRecord
  enum role: { guest: 0, leader: 1, manager: 2 }
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :guest
  end
end
