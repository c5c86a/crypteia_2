class User
 ROLES = {0 => :user, 1 => :admin}
 attr_reader :role
def initialize(role_id=0)
 @role = ROLES.has_key?(role_id.to_i) ? ROLES[role_id.to_i] : ROLES[0]
  end

  def role?(role_name)
    role == role_name
  end
end
