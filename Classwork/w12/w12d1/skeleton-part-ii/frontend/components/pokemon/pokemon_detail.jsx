import React from 'react'

class PokemonDetail extends React.Component {
    componentDidMount() {
        this.props.requestSinglePokemon(this.props.match.params.pokemonId)
    }
    
    render() {
        return (null)
    }
}

export default PokemonDetail