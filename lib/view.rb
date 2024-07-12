# lib/view.rb

class View
  def create_gossip
    puts "Veuillez entrer le nom de l'auteur du potin :"
    print "> "
    author = gets.chomp

    puts "Veuillez entrer le contenu du potin :"
    print "> "
    content = gets.chomp

    return { author: author, content: content }
  end

  def index_gossips(gossips)
    gossips.each_with_index do |gossip, index|
      puts "#{index + 1}. Auteur: #{gossip.author}, Contenu: #{gossip.content}"
    end
  end

  def delete_gossip
    puts "Veuillez entrer le numéro du potin à supprimer :"
    print "> "
    gets.chomp.to_i
  end
end
