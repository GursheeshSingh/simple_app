import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_app/screens/home_screen.dart';
import 'package:simple_app/screens/list_screen.dart';
import 'package:simple_app/screens/login_screen.dart';
import 'package:simple_app/screens/space_reload.dart';

void main() => runApp(MyApp());

const Color kOrange = const Color(0xFFF9AA33); // Reply orange

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: RefreshConfiguration(
        headerBuilder: () =>
            WaterDropMaterialHeader(backgroundColor: kOrange),
//        footerBuilder: () => CustomFooter(
//          builder: (BuildContext context, LoadStatus mode) {
//            Widget body;
//            if (mode == LoadStatus.idle) {
//              body = Text("pull up load");
//            } else if (mode == LoadStatus.loading) {
//              body = CupertinoActivityIndicator();
//            } else if (mode == LoadStatus.failed) {
//              body = Text("Load Failed! Try again!");
//            } else if (mode == LoadStatus.canLoading) {
//              body = Text("release to load more");
//            } else {
//              body = Text('');
//            }
//            return Container(
//              height: 55.0,
//              child: Center(child: body),
//            );
//          },
//        ),
        // header trigger refresh trigger distance
        headerTriggerDistance: 80.0,
        // custom spring back animate,the props meaning see the flutter api
        springDescription:
            SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        maxOverScrollExtent: 100,
        // Maximum dragging range at the bottom
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        child: MaterialApp(
          home: ListScreen(),
        ),
      ),
    );
  }
}
