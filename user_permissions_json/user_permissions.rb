require 'json'
class User
  attr_accessor :name, :account_type, :email, :permissions

  def initialize(*args)
    @name = args[0]
    @email = args[1]
    @account_type = args[2]
    @permissions = User.get_permissions(@account_type)
  end

  def self.get_permissions(acct)
    permissions_file = File.read("permissionsMap.json")
    permissions_map = JSON.parse(permissions_file)
    permissions_map[acct]
  end

  def print_details
    puts @name
    puts @email
    puts @account_type
    puts @permissions
  end
end

puts "Beginning now"
guy = User.new("Brian", "brrian@brian.com", "employee")
guy.print_details
