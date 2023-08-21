import '../class/event.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String uri = "http://10.0.2.2:8000/api";
// String uri = "https://event-attendance.000webhostapp.com/api";

Future<List<Event>?> getEvent(path) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  print(uri + path);
  if (response.statusCode == 200) {
    print("mantap");
    List<dynamic> body = jsonDecode(response.body);

    List<Event> newsList =
        body.map((dynamic item) => Event.fromJson(item)).toList();

    return newsList;
  }

  return null;
}

Future<Event?> showEvent(path, eventId) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{'event_id': eventId}),
  );

  if (response.statusCode == 200) {
    // dynamic body = response.body;

    return Event.fromJson(jsonDecode(response.body));
  }

  return null;
}

Future<dynamic> purchaseEvent(path, eventId) async {
  final response = await http.post(
    Uri.parse(uri + path),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'id': eventId,
    }),
  );
  print(uri + path);
  print(jsonEncode(<String, dynamic>{
    'id': eventId,
  }));

  if (response.statusCode == 200) {
    print('hola');
    print(response.body);

    return response.body.toString();
  }

  return null;
}
