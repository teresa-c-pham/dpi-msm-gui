class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    @actor = Actor.new
    @actor.name = params.fetch("query_name")
    @actor.image = params.fetch("query_image")
    @actor.dob = params.fetch("query_dob")
    @actor.bio = params.fetch("query_bio")

    if @actor.valid?
      @actor.save
      redirect_to("/actors", {:notice => "Actor created successfully."})
    else
      redirect_to("/actors", {:notice => "Actor failed to create successfully."})
    end
  end

  def delete_this
    the_id = params.fetch("path_id")
    actor = Actor.where({:id => the_id}).at(0)
    actor.destroy

    redirect_to("/actors", {:notice => "Actor deleted successfully."})
  end
  
end
