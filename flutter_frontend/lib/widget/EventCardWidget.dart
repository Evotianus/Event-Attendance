import 'package:cached_network_image/cached_network_image.dart';
import '../detail_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class EventCardWidget extends StatelessWidget {
  String eventId;
  String title;
  String image;
  String location;
  // String date;
  // String time;
  String createdAt;

  EventCardWidget({
    super.key,
    required this.eventId,
    required this.title,
    required this.image,
    required this.location,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    DateTime createdAtDateTime = DateTime.parse(createdAt);
    String timeAgo =
        timeago.format(createdAtDateTime, allowFromNow: true, locale: 'en');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailPage(
                eventId: eventId,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(image),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 10,
                //   left: 10,
                //   child: Container(
                //     padding: EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.circular(50),
                //     ),
                //     child: Text(
                //       category,
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // CircleAvatar(
                          //   radius: 15,
                          //   backgroundImage:
                          //       CachedNetworkImageProvider(authorProfile),
                          // ),
                          // SizedBox(width: 10),
                          // Text(author),
                          Icon(Icons.location_on_outlined),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        timeAgo,
                        style: TextStyle(color: Colors.black26),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
