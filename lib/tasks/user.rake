# rake task to create admin users.
require 'io/console'
namespace :users do
  desc "create admin user"
  task :create_admin => [:environment] do
    STDOUT.print "Enter admin Email: "
    email = STDIN.gets.strip.downcase 
    STDOUT.puts "Enter password (minium 6 chars): "
    password = STDIN.noecho(&:gets).chomp
    if password.strip.size < 6
      puts "Password should have minimum 6 characters. Please try again."
      exit
    end
    STDOUT.puts "Enter same password again (confirmation): "
    confirmation_password = STDIN.noecho(&:gets).chomp     
    if password != confirmation_password
      puts "Password and password confirmation are not same. Please try again."
      exit
    end
    user = User.new(:email => email, :password => password)
    if user.save
      puts "\n Admin user #{email} has been created \n"
    else
      puts "\n Unable to create admin user due to following errors \n"
      puts user.errors.full_messages
    end        
  end
end