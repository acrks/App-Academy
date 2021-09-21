import {connect} from 'react-redux';
import { receivePokemon, requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail'

const mapStateToProps = (state, ownProps) => {
    return {
        pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
    }
}

const mapDispatchToProps = dispatch => {
    return {
        requestSinglePokemon: pokemon => dispatch(receivePokemon(pokemon)),
    }
}

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail)