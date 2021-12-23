import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:interview_test/model/image_response.dart';

class ShowImageScreen extends StatefulWidget {
  final String url;

  const ShowImageScreen({Key? key, required this.url}) : super(key: key);

  @override
  _ShowImageScreenState createState() => _ShowImageScreenState();
}

class _ShowImageScreenState extends State<ShowImageScreen> {
  ImageResponse imageResponse = ImageResponse();
  String imgUrl = "";

  bool isLoading = true;

  getHttp() async {
    try {
      var response = await Dio().get(widget.url).then((value) => {
        if (value.statusMessage == "success") {
          setState(() {
            isLoading = false;
          }),
    imgUrl = value.statusMessage??"",
        }else{
          setState(() {
            isLoading = false;
          }),
        }
      });

      print(response);
      print(imgUrl);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading ? const CircularProgressIndicator() : Center(
        child: Image.network(
          imgUrl,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            return const CircularProgressIndicator();
          },
          errorBuilder: (BuildContext context, Object exception,
              StackTrace? stackTrace) {
            return const Icon(Icons.broken_image);
          },
        ),
      ),
    );
  }
}
