import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapi_app/model.dart';

class readpage extends StatelessWidget {
  final Result responseData;
  const readpage({super.key, required this.responseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249,249,249, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(249,249,249, 1),
        title: Text(
          responseData.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          softWrap: false,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  responseData.imageUrl.toString(),
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                responseData.description.toString(),
                style: TextStyle(fontSize: 23),
              ),SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Published By "),
                  Text(responseData.creator.toString()),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Published On"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(responseData.pubDate.toString()),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
