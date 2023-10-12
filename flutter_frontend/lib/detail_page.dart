import 'package:flutter_frontend/home_page.dart';

import 'config/config.dart';
import 'ticket_page.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'service/http_service.dart';
import 'class/event.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  String eventId;

  DetailPage({
    super.key,
    required this.eventId,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: showEvent("/show-event", eventId),
        builder: (BuildContext context, AsyncSnapshot<Event?> snapshot) {
          Event? event = snapshot.data;
          String notNullable = event?.time ?? '00:00:00';
          DateTime parsedTime = DateFormat('HH:mm:ss').parse(notNullable);
          String time = DateFormat('h:mm a').format(parsedTime);

          if (event != null) {
            return Scaffold(
              // body: Center(
              //   child: Container(
              //     width: 200,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       // color: Colors.red,
              //       image: DecorationImage(
              //         image: CachedNetworkImageProvider(
              //             "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=Emes"),
              //       ),
              //     ),
              //   ),
              // ),
              body: Stack(
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   width: deviceWidth,
                            //   height: 2000,
                            //   color: Colors.blueAccent,
                            // ),
                            Container(
                              // color: Colors.redAccent,
                              width: deviceWidth,
                              height: 350,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      CachedNetworkImageProvider(event.image!),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                left: 15,
                                right: 15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            event.title!,
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            children: [
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 5,
                                                children: [
                                                  Icon(Icons
                                                      .location_on_outlined),
                                                  Text(
                                                    event.location!,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 15),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 5,
                                                children: [
                                                  Icon(Icons.access_time),
                                                  Text(
                                                    time,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "About Event",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    event.content!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      right: 20,
                      top: 60,
                      child: Container(
                        color: primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "NOV",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                "28",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return HomePage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return TicketPage(
                                    id: event.eventId!,
                                    title: event.title!,
                                    location: event.location!,
                                    date: event.date!,
                                    time: event.time!,
                                    image: event.image!,
                                  );
                                },
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xff1b4965),
                            ),
                            child: Center(
                              child: Text(
                                "Book Ticket",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
