
class AppState {
  String tokenType;
  String token;
  String isLogedIn;
  int dataLengthItem;
  int dataTotal;

  AppState(
      {this.tokenType,
      this.token,
      this.isLogedIn,
      this.dataLengthItem,
      this.dataTotal});

  AppState.fromAppState(AppState another) {
    tokenType = another.tokenType;
    token = another.token;
    isLogedIn = another.isLogedIn;
    dataLengthItem = another.dataLengthItem;
    dataTotal = another.dataTotal;
  }
}
