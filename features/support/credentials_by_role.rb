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
      User.new('client_admin_12345', '99887766', 'ATT admin', '678')
    when 'RBM admin'
      User.new('rbm_admin', '3145', 'RBM admin', '678')
    when 'Store Manager'
      User.new('test_store_manager_12345', 'test', 'store_manager', '678')
    else
      raise ArgumentError, "Role '#{role}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World CredentialHelpers
