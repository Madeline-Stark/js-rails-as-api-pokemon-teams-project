const BASE_URL = "http://localhost:3000"
const TRAINERS_URL = `${BASE_URL}/trainers`
const POKEMONS_URL = `${BASE_URL}/pokemons`
const main = document.querySelector("main")

document.addEventListener('DOMContentLoaded', function(){
    fetchTrainers()
})

function fetchTrainers(){
    fetch(TRAINERS_URL)
        .then(function(resp){
            return resp.json() //returns JavaScript Object
        })
        .then(function(trainers){
            
            // for (const trainer of trainers.data){
            //     makeTrainerCard(trainer)
            // }
            for (const trainer of trainers){
                makeTrainerCard(trainer)
            }

           
        })
}


function makeTrainerCard(trainer){
    //MAKE CARD
    const card = document.createElement('div')
    card.classList += "card" //can also do card.setAttribute("class", "card")
    card.dataset["id"] = trainer.id //https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes
    //can also do card.setAttribute("data-id", trainer.id)
    //MAKE NAME PTAG
    const trainerName = document.createElement('p')
    trainerName.innerText = trainer.name
    card.appendChild(trainerName)
  
    //MAKE RELEASE BUTTON
    const addPokeButton = document.createElement("button")
    addPokeButton.dataset.trainerId = trainer.id //need camel case for hyphen
    addPokeButton.innerText = "Add Pokemon"
    card.appendChild(addPokeButton)
    // ATTACH EVENT LISTENER TO BUTTON
    addPokeButton.addEventListener('click', addPokemon)

    //MAKE LIST
    const pokemonList = document.createElement('ul')
    //iterate through pokemon
    //MAKE INDIVIDUAL POKEMON LIST ITEMS
    for (const pokemon of trainer.pokemons) {
        // //make li for each
        const pokemonLi = document.createElement("li")
        pokemonLi.innerText = pokemon.nickname
        const releaseButton = document.createElement("button")
        releaseButton.classList += "release"
        releaseButton.innerText = "Release"
        releaseButton.dataset.pokemonId = pokemon.id
        pokemonLi.appendChild(releaseButton)
        pokemonList.appendChild(pokemonLi)
        //ONCE ALL DONE REFACTOR INTO OWN FUNCTION
    } 
    card.appendChild(pokemonList)
    
    //add card to DOM:
    main.appendChild(card)
}

function renderPokemon(pokemon){
    //would need to call this after adding list to DOM
    //need to target specific trainer's card
    const list = document.querySelector(`div[data-id="${pokemon.trainer_id}"]`)
}

function addPokemon(event){
    debugger
    const trainerId = event.target.dataset.trainerId

    const formData = {
        trainerId: trainerId
    }

}