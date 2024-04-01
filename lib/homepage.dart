import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi_app/articlepage.dart';
import 'package:newsapi_app/model.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<Result> responseData = [];

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://newsdata.io/api/1/news?apikey=pub_409384f9f25f5c93843810a42ed831c06465f&q=Worldwide ');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = newsFromJson(response.body);
      print(data.results[0]);
      setState(() {
        responseData = data.results;
      });
      print("hi");
      print(responseData);
    } else {
      print('error: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text(
          "News",
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: responseData.isEmpty
            ? CircularProgressIndicator()
            : PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: responseData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return readpage(
                            responseData: responseData[index],
                          );
                        },
                      ));
                    },
                    child: responseData[index].description == null
                        ? Center(
                            child: Text(
                            'No Data',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 600,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.fromBorderSide(BorderSide(
                                          width: 3, style: BorderStyle.solid))),
                                  margin: EdgeInsets.all(20),
                                  child: Column(children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        child: Image.network(responseData[index]
                                            .imageUrl
                                            .toString())),
                                    ListTile(
                                      title: Text(
                                        responseData[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28),
                                        softWrap: false,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        responseData[index]
                                            .description
                                            .toString(),
                                        style: TextStyle(fontSize: 20),
                                        softWrap: false,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Column(
                                      children: [SizedBox(height: 100,),
                                        Text("Published By"),
                                        Text(responseData[index]
                                            .creator
                                            .toString()),
                                      ],
                                    )
                                  ])),
                            ],
                          ),
                  );
                },
              ),
      ),
    );
  }
}
