import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:simple_app/constants.dart';
import 'package:simple_app/main.dart';
import 'package:simple_app/model/Product.dart';
import 'package:simple_app/screens/detail_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool showSpinner = false;

  //This variable will tell whether records were fetched or not
  bool fetched = false;

  var productList = new List<Product>();

  @override
  void initState() {
    super.initState();

    fetchAndUpdateProducts();
  }

  fetchAndUpdateProducts() async {
    setState(() {
      showSpinner = true;
    });

    try {
      final response =
          await get('http://www.mocky.io/v2/5d15fc1b0e00003311a1167a');

      setState(() {
        showSpinner = false;
        fetched = true;
      });

      if (response.statusCode == 200) {
        Iterable products = json.decode(response.body);
        setState(() {
          productList =
              products.map((model) => Product.fromJson(model)).toList();
        });
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load products');
      }
    } catch (e) {
      setState(() {
        showSpinner = false;
        fetched = true;
      });
    }
  }

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

    if(count == 3){
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

//        child: ListView.separated(
//          separatorBuilder: (context, index) {
//            return Divider(
//              color: Colors.black,
//            );
//          },
//          itemCount:
//              productList.length == 0 && fetched ? 1 : productList.length,
//          itemBuilder: (context, index) {
//            if (productList.length == 0) {
//              return NoProductsFoundWidget(
//                  fetchAndUpdateProducts: fetchAndUpdateProducts);
//            } else {
//              Product product = productList[index];
//              return ProductWidget(product: product);
//            }
//          },
//        ),
      ),
    );
  }
}

class NoProductsFoundWidget extends StatelessWidget {
  final Function fetchAndUpdateProducts;

  NoProductsFoundWidget({this.fetchAndUpdateProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No products found.',
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        FlatButton(
          onPressed: () {
            if (fetchAndUpdateProducts != null) {
              fetchAndUpdateProducts();
            }
          },
          child: Text(
            'TRY AGAIN',
            style: TextStyle(color: Colors.blueAccent),
          ),
        )
      ],
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    @required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailScreen(product);
        }));
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network(product.imageUrl),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Description: " + product.description,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
