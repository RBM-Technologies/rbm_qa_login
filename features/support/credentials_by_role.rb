@username = ''
@password = ''

module CredentialHelpers
  def role_credentials(role)
    case role
    when 'Administrator'
      @username = 'client_admin'
      @password = 'client_admin'
    when 'District Manager'
      @username = ''
      @password = ''
    when 'RBM admin'
      @username = 'rbm_admin'
      @password = 'rbm_admin'
    when 'Real Estate'
      @username = ''
      @password = ''
    when 'Report/Read_Only'
      @username = ''
      @password = ''
    when 'Report/Read_Only TPR Role'
      @username = ''
      @password = ''
    when 'Store Manager'
      @username = 'store_manager'
      @password = 'store_manager'
    else
      raise ArgumentError, "Role '#{role}' is not defined. Please add a mapping in #{__FILE__}."
    end
  end
end

World CredentialHelpers
