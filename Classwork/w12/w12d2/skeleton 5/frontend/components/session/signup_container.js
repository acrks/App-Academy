import {connect} from 'react-redux'
import { createsNewUser } from '../../actions/session'
import Signup from './signup'

const mapDispatchToProps = dispatch => ({
    createNewUser: formUser => dispatch(createsNewUser(formUser))
})

export default connect(null, mapDispatchToProps)(Signup)

 