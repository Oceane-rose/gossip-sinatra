require 'csv'

class Gossip
  attr_accessor :author, :content
  @@compteur = 0 

  def initialize(author, content)
    @author = author
    @content = content
    @id = @@compteur
    @@compteur += 1 
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end


end