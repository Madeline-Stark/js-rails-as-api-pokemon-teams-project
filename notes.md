Building out the rest of the project
Remember that your user stories are:

When a user loads the page, they should see all trainers, with their current team of Pokemon.
- build API to load all trainers and associated pokemon
    - make models
        - creating a rails api from scratch
            - already have models, controllers etc from lab instructions
            - add controller actions we want for API - confirm working in localhost
    - make serializers using active model serializer so structures data nicely
        - add to gemfile gem 'active_model_serializers'
        - mkdir app/serializers
        - then just reference how made serializers, controllers
- create card function in js to fetch trainers and make card
    on page load
    make fetch to all trainers
    make card for each trainer

Whenever a user hits "Add Pokemon" and they have space on their team, they should get a new Pokemon.
//just adds a random pokemon
//event listener on add pokemon button
//make a post request to /pokemons - pass trainer id?
//make pokemon create action that uses faker to make pokemon and associates with trainer
//validate for team size - limit number of pokemon to 6 
//display pokemon on team 

Whenever a user hits "Release Pokemon" on a specific Pokemon team, that specific Pokemon should be released from the team.
//build destroy action
//add event listener to release button
//make delete request

//students often think of code as unchangeable, dont go back and make changes to code


You should build out just enough of your Rails API to achieve the above. You should not build out full CRUD on each model. For example, the frontend will not have the ability to create a new Trainer, so your backend should not have a POST /trainers route.