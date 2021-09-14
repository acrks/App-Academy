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
      case REMOVE_STEP: 
          delete newState[action.step.id];
          return newState;
      default:
          return oldState
  }
}

export default stepsReducer;

/*const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, title: 'Forget Redux', body: 'It is also fundamental', done: false }];
const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, title: 'Dispatch reducers', done: false, todo_id: 1 }];
store.dispatch(receiveTodos(newTodos));
store.dispatch(receiveSteps(newSteps));*/
