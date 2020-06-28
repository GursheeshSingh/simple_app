import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:simple_app/widgets/empty_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: EmptyState(),

//        child: RaisedButton(
//          child: Text('Show notification'),
//          onPressed: () async {
//            //show a notification at top of screen
//            showOverlayNotification((context) {
//
//              return SafeArea(
//                child: Card(
//                  color: Colors.grey.shade900,
//                  child: Column(
//                    children: <Widget>[
//                      Container(
//                        padding: EdgeInsets.all(6),
//                        color: Colors.black,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            CircleAvatar(
//                              backgroundImage: NetworkImage(
//                                  'https://instagram.fluh1-1.fna.fbcdn.net/v/t51.2885-19/s150x150/82012511_2302706006694584_5094878914493284352_n.jpg?_nc_ht=instagram.fluh1-1.fna.fbcdn.net&_nc_ohc=PEk_epYGkX4AX__RxEA&oh=80d85bb92149be7ce229e77f85d6d467&oe=5F104153'),
//                              radius: 10,
//                            ),
//                            Text(' theboringdeveloper', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 15))
//                          ],
//                        ),
//                      ),
//                      ListTile(
//                        leading: CircleAvatar(
//                          backgroundImage: NetworkImage(
//                              'https://instagram.fluh1-1.fna.fbcdn.net/v/t51.2885-19/s150x150/68911757_897393633967586_8049386857282142208_n.jpg?_nc_ht=instagram.fluh1-1.fna.fbcdn.net&_nc_ohc=CvnVIGcPzdIAX9KNzhD&oh=85f15238cb13e62da263e7425b9f03f4&oe=5F111342'),
//                        ),
//                        title: Text(
//                          'igursheesh liked your post.',
//                          style: TextStyle(color: Colors.white),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              );
//            });
//          },
//        ),
      ),
    );
  }
}
