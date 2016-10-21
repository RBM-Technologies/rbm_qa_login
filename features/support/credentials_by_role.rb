class User
  attr_reader :username, :password, :role, :location
  def initialize(username, password, role, location)
    @username = username
    @password = password
    @role = role
    @location = location
  end
end


module CredentialHelpers
  def credentials_for(role)
    case role
    when 'Administrator'
      User.new()
    when 'RBM admin'
      User.new()
    when 'Store Manager'
      User.new()
    else
      raise ArgumentError, "Role '#{role}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World CredentialHelpers
