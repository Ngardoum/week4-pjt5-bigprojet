# lib/router.rb
require_relative 'controller'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts "Bienvenue dans The Big Project !"

    while true
      puts "Veuillez choisir une option :"
      puts "1. Ajouter un potin"
      puts "2. Afficher tous les potins"
      puts "3. Supprimer un potin"
      puts "4. Quitter"

      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1
        @controller.create_gossip
      when 2
        @controller.index_gossips
      when 3
        @controller.delete_gossip
      when 4
        puts "Au revoir !"
        break
      else
        puts "Choix invalide, veuillez réessayer."
      end
    end
  end
end
