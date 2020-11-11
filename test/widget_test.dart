// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.





import 'package:http/http.dart';

Future<void> main() async {


  Client client = Client();
  final responese = await client.get('https://androidt1.azurewebsites.net/api/Accounts/phoneNum/0854146162');
  print("Body ne: " + responese.body);
}
