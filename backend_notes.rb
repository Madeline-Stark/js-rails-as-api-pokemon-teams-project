class PokemonsController < ApplicationController

    def index
        pokemons = Pokemon.all
        render json: pokemons, include: [:trainer]
    end 

    def show
        pokemon = Pokemon.find_by(id: params[:id])
        render json: pokemon, include: [:trainer]
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
