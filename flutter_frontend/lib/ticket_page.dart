import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_frontend/home_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'config/config.dart';
import 'service/http_service.dart';

class TicketPage extends StatelessWidget {
  String? id;
  String? title;
  String? location;
  String? date;
  String? time;
  String? image;

  TicketPage({
    super.key,
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: purchaseEvent("/purchase-event", id),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data != null) {
            String code = snapshot.data;
            return Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "My Tickets",
                            style: TextStyle(fontSize: 22),
                          ),
                          GestureDetector(
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
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                // color: Colors.black.withOpacity(0.2),
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.2),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                Icons.home,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: deviceWidth,
                        // height: 800,
                        decoration: BoxDecoration(
                          // color: Colors.blueAccent,
                          color: iconColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      // color: Colors.redAccent,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            CachedNetworkImageProvider(image!),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    title!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DottedLine(
                                  dashColor: backgroundColor,
                                  lineThickness: 2,
                                  dashGapLength: 6,
                                  dashLength: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 12.5,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 12.5,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Wrap(
                                runSpacing: 20,
                                children: [
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Location"),
                                            Text(
                                              location!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Event ID"),
                                            Text(
                                              id!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Date"),
                                            Text(
                                              "28 Nov 2022",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Time"),
                                            Text(
                                              time!,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                DottedLine(
                                  dashColor: backgroundColor,
                                  lineThickness: 2,
                                  dashGapLength: 6,
                                  dashLength: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 12.5,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(100),
                                          bottomRight: Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 12.5,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(100),
                                          bottomLeft: Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Text("Scan QR Code"),
                                  QrImageView(
                                    data: code.replaceAll("\"", ""),
                                    size: 200,
                                    // dataModuleStyle: QrDataModuleStyle(
                                    //   dataModuleShape: QrDataModuleShape.square,
                                    //   color: Colors.white,
                                    // ),
                                    // eyeStyle: QrEyeStyle(
                                    //   eyeShape: QrEyeShape.square,
                                    //   color: Colors.white,
                                    // ),
                                    // backgroundColor: Colors.white,
                                  ),
                                  SizedBox(height: 10),
                                  // Container(
                                  //   width: 200,
                                  //   height: 200,
                                  //   decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: CachedNetworkImageProvider(
                                  //           "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=Emes"),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
