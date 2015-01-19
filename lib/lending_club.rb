require 'lending_club/configuration'
require 'lending_club/client'

module LendingClub
  extend Configuration

  # Alias for LendingClub::Client.new
  #
  # @return [LendingClub::Client]
  def self.client(options={})
    LendingClub::Client.new(options)
  end

  # Delegate to LendingClub::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to LendingClub::Client
  def self.respond_to?(method, include_all=false)
    client.respond_to?(method, include_all) || super
  end
end
