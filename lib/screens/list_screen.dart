import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/main.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 4), (timer) {
      items.insert(0, 1);
    });
  }

  _onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    _refreshController.refreshCompleted();

    //If refresh fails
    //_refreshController.refreshFailed();
  }

  List<int> items = [1, 2, 3, 4, 5];

//  int itemCount = 5;
//  int count = 0;

  _onLoading() async {
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      items.addAll([1, 2, 3]);
//        itemCount += 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: kOrange),
        body: SmartRefresher(
          enablePullUp: true,
          onLoading: _onLoading,
          controller: _refreshController,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(color: Colors.black);
            },
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                color: kLighterGray,
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Center(
                  child: Text(
                    items[index].toString(),
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
