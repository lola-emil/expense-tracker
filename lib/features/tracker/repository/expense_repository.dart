import 'package:dio/dio.dart';
import 'package:expense_tracker/features/tracker/model/expense_model.dart';
import 'package:expense_tracker/features/tracker/model/overview_model.dart';
import 'package:expense_tracker/features/tracker/model/transaction_mode.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<List<ExpenseModel>> getTransactions() async {
  String? token = await secureStorage.read(key: "TOKEN");
  String? userId = await secureStorage.read(key: "USER_ID");
  Dio dio = Dio();
  List<ExpenseModel> list = List.of([]);
  dio.options.headers["authorization"] = "Bearer $token";

  Response response = await dio
      .get("http://localhost:5000/expense/transactions?userId=$userId");

  dynamic data = response.data["data"];
  for (int i = 0; i < data.length; i++) {
    list.add(ExpenseModel(
        data[i]["record_id"],
        data[i]["note"],
        data[i]["category"],
        data[i]["amount"],
        data[i]["user_id"],
        data[i]["created_at"]));
  }

  return list;
}

Future<List<OverviewModel>> getOverview() async {
  String? token = await secureStorage.read(key: "TOKEN");
  String? userId = await secureStorage.read(key: "USER_ID");
  Dio dio = Dio();

  List<OverviewModel> list = List.of([]);

  dio.options.headers["authorization"] = "Bearer $token";

  Response response =
      await dio.get("http://localhost:5000/expense/overview?userId=$userId");

  dynamic data = response.data["data"];

  for (int i = 0; i < data.length; i++) {
    list.add(OverviewModel(
        data[i]["category"],
        double.parse(data[i]["total_sales"].toString()),
        double.parse(data[i]["percentage"].toString())));
  }

  return list;
}

Future<List<TransactionModel>> getRecentTransactions() async {
  String? token = await secureStorage.read(key: "TOKEN");
  String? userId = await secureStorage.read(key: "USER_ID");
  Dio dio = Dio();

  List<TransactionModel> list = List.of([]);

  dio.options.headers["authorization"] = "Bearer $token";

  Response response =
      await dio.get("http://localhost:5000/expense/recent?userId=$userId");
  dynamic data = response.data["data"];

  for (int i = 0; i < data.length; i++) {
    list.add(TransactionModel(
        data[i]["record_id"],
        data[i]["note"],
        data[i]["category"],
        double.parse(data[i]["amount"].toString()),
        data[i]["created_at"]));
  }

  return list;
}
