import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'image_picker/single_image_picker.dart';

enum PhotoSource { ASSET, NETWORK }
enum PhotoStatus { LOADING, ERROR, LOADED }
enum Source { GALLERY, CAMERA, NONE }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PhotoSource photoSource;
  PhotoStatus photoStatus;
  String source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: photoSource == PhotoSource.NETWORK
                            ? Image.network(source, height: 200)
                            : photoSource == PhotoSource.ASSET
                                ? Image.asset(source, height: 200)
                                : Container(
                                    color: Colors.grey.shade200, height: 200),
                      ),
                    ),
                    Center(
                      child: photoStatus == PhotoStatus.LOADING
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.red))
                          : photoStatus == PhotoStatus.ERROR
                              ? Icon(MaterialIcons.error)
                              : Container(),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: () async {
                  final SingleImagePicker singleImagePicker =
                      SingleImagePicker(onImagePicked: (path) {
                    setState(() {
                      photoSource = PhotoSource.ASSET;
                      source = path;
                      photoStatus = PhotoStatus.LOADING;
                    });
                  }, onSaveImage: (String url) async {
                    print('On save image');
                    return true;
                  }, onImageSuccessfullySaved: (url) {
                    setState(() {
                      photoStatus = PhotoStatus.LOADED;
                      photoSource = PhotoSource.NETWORK;
                      source = url;
                    });
                    print('On image successfully saved');
                  }, onImageUploadFailed: (message) {
                    photoStatus = PhotoStatus.ERROR;
                    print('On image upload failed');
                  });
                  singleImagePicker.pickImage(context);
                },
                child: Text('Select image'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
