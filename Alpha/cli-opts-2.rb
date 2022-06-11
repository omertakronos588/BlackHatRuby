#!/usr/bin/env ruby
#  Script to show how to create a script with CLI options and sub commands.

require 'optparse'

options = Hash.new

subcommands = { 
  'creds' => OptionParser.new do |opts|
      opts.banner = "Usage: creds [options]"
      opts.on('-u', '--user-id UID', Integer, "The user's ID (UID) to hack.", "  (default: 911)") do |v|
        options[:uid] = v
      end
      opts.on('-p', '--password PASSWORD', "The user's password.") do |v|
        options[:pass] = v
      end
   end
 }

subcmdtext = <<HELP
Available commands:
     creds :\t set user credentials.
See '#{__FILE__} COMMAND --help' for more information on a specific command.
HELP

opts = OptionParser.new do |opts|
  opts.banner = "Usage: #{__FILE__} [options] [subcommand [options]]"
  opts.on('-t', '--target HOST', 'The target hostname or IP address.') do |v|
    options[:target] = v
  end
  opts.on('-h', '--help', 'Display this screen.') do
    puts opts
    exit!
  end
  opts.separator subcmdtext
  opts.separator ""
  opts.on_tail "Examples:"
  opts.on_tail "  #{__FILE__} -t blackhatruby.com creds --user-id 500 --password P@ssw0rd@123"
end


opts.order!
command = ARGV.shift
subcommands[command].order! unless subcommands[command].nil?
pp options
