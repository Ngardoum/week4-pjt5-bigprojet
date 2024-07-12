# lib/controller.rb
require_relative 'gossip'
require_relative 'view'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    gossips = Gossip.all
    @view.index_gossips(gossips)
  end

  def delete_gossip
    index_gossips
    gossip_index = @view.delete_gossip
    Gossip.delete(gossip_index)
  end
end
