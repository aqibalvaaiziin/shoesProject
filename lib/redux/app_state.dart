class AppState {
  String tokenType;
  String token;
  String initialLoginCode;

  AppState({this.tokenType, this.token, this.initialLoginCode});

  AppState.fromAppState(AppState another) {
    tokenType = another.tokenType;
    token = another.token;
    initialLoginCode = another.initialLoginCode;
  }
}
