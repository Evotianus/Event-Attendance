import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frontend/config/config.dart';
import 'widget/EventCardWidget.dart';
import 'class/event.dart';
import 'service/http_service.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //  eventList;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Center(child: Text("Scanify")),
      ),
      body: FutureBuilder(
        future: getEvent('/get-event'),
        builder: (BuildContext, AsyncSnapshot<List<Event>?> snapshot) {
          List<Event>? eventList = snapshot.data;
          if (eventList != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  runSpacing: 10,
                  children: eventList.map((Event event) {
                    print(event.createdAt);
                    return EventCardWidget(
                        eventId: event.eventId!,
                        title: event.title!,
                        image: event.image!,
                        location: event.location!,
                        createdAt: event.createdAt!);
                  }).toList(),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
