# lib/gossip.rb
require 'csv'

class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@content, @author]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      all_gossips << Gossip.new(row[0], row[1])
    end
    return all_gossips
  end

  def self.delete(index)
    gossips = Gossip.all
    gossips.delete_at(index - 1) # Enlever l'élément à l'index donné
    CSV.open("db/gossip.csv", "wb") do |csv|
      gossips.each { |gossip| csv << [gossip.author, gossip.content] }
    end
  end
end
