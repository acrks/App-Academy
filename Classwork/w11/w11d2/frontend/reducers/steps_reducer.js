import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from "../actions/step_actions"; 


const stepsReducer = ( oldState = {}, action) => {
  Object.freeze(oldState); 
  const newState = Object.assign({}, oldState) 

  switch (action.type) {
      case RECEIVE_STEP:
          newState[action.step.id] = action.step
          return newState;
      case RECEIVE_STEPS:
          for(let i = 0; i < action.steps.length; i++) {
              let step = action.steps[i]
              newState[step.id] = step;
          }
          return newState;
      case REMOVE_TODO: 
          delete newState[action.step.id];
          return newState;
      default:
          return oldState
  }
}

export default stepsReducer;
