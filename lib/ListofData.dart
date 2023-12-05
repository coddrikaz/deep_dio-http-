import 'dart:convert';

import 'package:demo/Model.dart';
import 'package:demo/View.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListofData extends StatefulWidget {
  const ListofData({super.key});

  @override
  State<ListofData> createState() => _ListofDataState();
}

class _ListofDataState extends State<ListofData> {
  List<DataList>? dataList = <DataList>[];
  List<Rating> dataListt = <Rating>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchProducts();
    });
  }

  Future<void> fetchProducts() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        dataList = jsonData.map((data) => DataList.fromJson(data)).toList();
        print("TTTTTTDATA ${dataList!.toList()}");
      });
    } else {}
  }

  //  Future<void> fetchData() async {
  //   try {
  //     final dio = Dio();
  //
  //     Response response =
  //         await dio.get(AppUrl.users);
  //     if (response.statusCode == 200) {
  //
  //       List<dynamic> responseData = response.data;
  //       dataList = responseData.map((e) => DataList.fromJson(e)).toList();
  //
  //       setState(() {});
  //     } else {
  //       print("error");
  //     }
  //   } catch (e) {
  //     print("Exception Error${e}");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text("PLaceHoidlsdr"),
      ),
      body: Container(
        child: dataList!.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataList == null ? 0 : dataList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrange.withOpacity(0.1),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        spreadRadius: 2.0,
                      )
                    ]),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Viewww(
                                        data: dataList![index],
                                      )));
                        },
                        child: GridView.count(
                          crossAxisCount: 1,
                          // crossAxisSpacing: 10.0,
                          // mainAxisSpacing: 80.0,
                          childAspectRatio: (4 / 8),
                          shrinkWrap: true,
                          children: List.generate(
                            dataList!.length,
                            (index) {
                              return Container(
                                color: Colors.white,
                                // height: 300.0,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(dataList![index].title),
                                    Image(
                                      image:
                                          NetworkImage(dataList![index].image),
                                      fit: BoxFit.fill,
                                      height: 120,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // Text(dataList[index].price.toString()),
                                        // Spacer(),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(dataList![index]
                                                .rating.rate
                                                .toString()),
                                            SizedBox(width: 5,),
                                            Text(dataList![index]
                                                .rating.count
                                                .toString()),
                                          ],
                                        )
                                      ],
                                    ),
                                    Text(dataList![index].description, maxLines: 4,),
                                  ],
                                ),
                              );
                            },
                          ),
                        )),
                  );
                },
              ),
      ),
    );
  }
}
