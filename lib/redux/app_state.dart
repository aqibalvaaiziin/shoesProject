class AppState {
  String tokenType;
  String token;
  String isLogedIn;
  List<int> idSepatu = List<int>();

  AppState({this.tokenType, this.token, this.isLogedIn, this.idSepatu});

  AppState.fromAppState(AppState another) {
    tokenType = another.tokenType;
    token = another.token;
    isLogedIn = another.isLogedIn;
    idSepatu = another.idSepatu;
  }
}
