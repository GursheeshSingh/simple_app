import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/main.dart';
import 'package:simple_app/model/Product.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool showSpinner = false;

  //This variable will tell whether records were fetched or not
  bool fetched = false;

  var productList = new List<Product>();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  _onRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    _refreshController.refreshCompleted();

    //If refresh fails
    //_refreshController.refreshFailed();
  }

  int itemCount = 5;
  int count = 0;

  _onLoading() async {
    await Future.delayed(Duration(seconds: 3));

    count += 1;

    if (count == 3) {
      _refreshController.loadNoData();
    } else {
      setState(() {
        itemCount += 2;
      });
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              color: kLighterGray,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            );
          },
        ),
      ),
    );
  }
}
