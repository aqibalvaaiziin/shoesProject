class AppState {
  String tokenType;
  String token;
  String isLogedIn;

  AppState({this.tokenType, this.token, this.isLogedIn});

  AppState.fromAppState(AppState another) {
    tokenType = another.tokenType;
    token = another.token;
    isLogedIn = another.isLogedIn;
  }
}
