require 'json'
class User
  attr_accessor :name, :account_type, :email, :permissions

  def initialize(name, email, account_type)
    @name = name
    @email = email
    @account_type = account_type
    @permissions = get_permissions
  end

  def get_permissions
    permissions_file = File.read("permissionsMap.json")
    permissions_map = JSON.parse(permissions_file)
    permissions_map[@account_type]
  end

  def print_details
    puts @name
    puts @email
    puts @account_type
    puts @permissions
  end
end

puts "Beginning now"
guy = User.new("Brian", "brian@brian.com", "employee")
guy.print_details
