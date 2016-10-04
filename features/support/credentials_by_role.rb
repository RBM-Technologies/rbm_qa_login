class User
  attr_reader :username, :password, :role
  def initialize(username, password, role)
    @username = username
    @password = password
    @role = role
  end
end

module CredentialHelpers
  def credentials_by(role)
    case role
    when 'Administrator'
      User.new('client_admin_12345', 'test', 'ATT admin')
    when 'RBM admin'
      User.new('rbm_admin', 'rbm_admin', 'RBM admin')
    when 'Store Manager'
      User.new('test_store_manager_12345', 'test', 'store_manager')
      @username = 'test_store_manager_12345'
      @password = 'test'
    else
      raise ArgumentError, "Role '#{role}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World CredentialHelpers
