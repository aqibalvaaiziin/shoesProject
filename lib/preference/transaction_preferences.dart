import 'package:shared_preferences/shared_preferences.dart';

class TransactionPreferences {
  void setTotalTransaction(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("transaction", data);
  }

  Future<int> getTotalTransaction() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("transaction") ?? 0;
  }

   void setItemsTransaction(data) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("items", data);
  }

  Future<int> getItemsTransaction() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("items") ?? 0;
  }

}
