class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :destroy]

  def index
      pokemons = Pokemon.all
      render json: pokemons, include: [:trainer]
  end 

  def show
      render json: @pokemon, include: [:trainer]
  end 

  def create 
      # binding.pry put in pry to show that trainer id comes through params
      trainer = Trainer.find_by_id(params["trainerId"])
      name = Faker::Name.first_name
      species = Faker::Games::Pokemon.name
      pokemon = trainer.pokemons.build(nickname: name, species: species)
      if pokemon.save 
      #render pokemon, then can use to render to page
          render json: pokemon, include: [:trainer]
      else
          # 500 is just server side error
          #render json: pokemon.errors, status: 500, status_text: pokemon.errors.full_messages.first
          
          #creating own error object
          render json: pokemon, status: 500
      end 
  end 

  def destroy
      @pokemon.destroy
      render json: @pokemon #need to return for fetch
  end 

  private 

  def set_pokemon
      @pokemon = Pokemon.find_by(id: params[:id])
  end

  

end

class TrainersController < ApplicationController

    def index
        trainers = Trainer.all 
        render json: trainers, include: [:pokemons]

    end 

    def show
        trainer = Trainer.find_by(id: params[:id])
        render json: trainer, include: [:pokemons]
    end 

end

class Pokemon < ApplicationRecord
  belongs_to :trainer
  validate do 
    pokemon_count_valid?
  end

  private 

  # custom validation
  def pokemon_count_valid?
    #self is instance of pokemon class
    if self.trainer.pokemons.count >= 6
      self.errors.add(:max_pokemon, "Max is 6 pokemon")
    end 
  end 
end

class Trainer < ApplicationRecord
    has_many :pokemons
end


class PokemonSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :species, :trainer_id
  belongs_to :trainer
end

class TrainerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :pokemons
end
