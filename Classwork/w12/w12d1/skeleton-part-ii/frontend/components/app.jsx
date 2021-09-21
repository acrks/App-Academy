import { Route } from "react-router-dom";
import PokemonIndexContainer from "./pokemon/pokemon_index_container";
import PokemonDetailContainer from "./pokemon/pokemon_details_container";
import React from 'react'

const App = () => (
    <div>
    <Route path = "/pokemon/:pokemonId" component = {PokemonDetailContainer}/>
    <Route path= "/" component={PokemonIndexContainer} />
    </div>
  ) 

export default App