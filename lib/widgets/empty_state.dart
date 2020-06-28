import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

const Color kCoolBlack = Color(0xFF212121); //USING

class EmptyState extends StatelessWidget {
  final int length;

  EmptyState({this.length = 4});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height) / 2.7;
    final double itemWidth = size.width / 2;

//    return Center(
//      child: Stack(
//        children: <Widget>[
//          Positioned.fill(child: Container(color: Colors.black)),
//          Shimmer.fromColors(
//            baseColor: Colors.grey.shade900,
//            highlightColor: Colors.grey.shade800,
//            period: Duration(seconds: 1),
//            child: GridView.count(
//              crossAxisCount: 3,
//              shrinkWrap: true,
//              childAspectRatio: (itemWidth / itemHeight),
//              physics: ClampingScrollPhysics(),
//              children: List.generate(9, (index) {
//                return Container(
//                  margin: EdgeInsets.all(1),
//                  padding: EdgeInsets.all(0),
//                  color: Colors.white,
//                );
//              }),
//            ),
//          ),
//        ],
//      ),
//    );

    return SafeArea(
      child: Stack(
        children: <Widget>[
          Positioned.fill(child: Container(color: Colors.black)),
          Positioned.fill(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade900,
              highlightColor: Colors.grey.shade800,
              period: Duration(seconds: 1),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                physics: ClampingScrollPhysics(),
                children: List.generate(12, (index) {
                  return Container(
                    margin: EdgeInsets.all(1),
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
