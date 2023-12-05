import 'package:demo/Model.dart';
import 'package:flutter/material.dart';

class Viewww extends StatefulWidget {
  const Viewww({super.key, required this.data});

  final DataList data;

  @override
  State<Viewww> createState() => _ViewwwState();
}

class _ViewwwState extends State<Viewww> {
  late DataList dataa;

  @override
  void initState() {
    super.initState();
    dataa = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body:  SizedBox(
        height: 300,
        width: 200,
        child: Card(
          child: GridTile(
            header: Text("${dataa.title}"),
            child: Image(image: NetworkImage(
                "${dataa.image}"
            ),),
            footer: Text("${dataa.rating}"),
          ),
        ),
      ),
    );
  }
}
