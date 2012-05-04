class User
  attr_accessor :username, :password

  def initialize
    @keychain = KeychainItemWrapper.alloc.initWithIdentifier 'ExampleAppLoginData', accessGroup: nil
    load
  end

  def save
    @keychain.setObject username, forKey: KSecAttrAccount
    @keychain.setObject password, forKey: KSecValueData
  end

  def load
    self.username = @keychain.objectForKey KSecAttrAccount
    NSLog("username: #{username}")
    self.password = @keychain.objectForKey KSecValueData
  end
end