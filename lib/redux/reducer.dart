import 'package:shoes/factory/cart_factory.dart';

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
  } else if (action is DataLengthItem) {
    newState.dataLengthItem = action.payload;
  } else if (action is DataTotal) {
    newState.dataTotal = action.payload;
  }

  return newState;
}

var result = List<CartFactory>();

dataCart() {
  CartFactory.getData().then((value) {
    for (var i = 0; i < value.length; i++) {
      result.add(value[i]);
    }
  });
}
