import 'app_state.dart';
import 'action.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is TokenType) {
    newState.tokenType = action.payload;
  } else if (action is Token) {
    newState.token = action.payload;
  } else if (action is IsLogedIn) {
    newState.isLogedIn = action.payload;
  } else if (action is IdSepatu) {
    newState.idSepatu = action.payload;
  }

  return newState;
}
