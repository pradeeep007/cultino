import 'package:cultino/data/api/api.dart';
import 'package:cultino/data/hive/otherMandiHive.dart';
import 'package:cultino/data/hive/theKrishiHive.dart';
import 'package:cultino/data/hiveboxes/boxes.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ScreenTwo extends StatefulWidget {
  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<APICacheHive>>(
      valueListenable: Boxes.getApiCache().listenable(),
      builder: (context, box, _) {
        final watchList = box.values.toList().cast<APICacheHive>();
        return buildContent(watchList);
      },
    );
  }
}

Widget buildContent(List<APICacheHive> data) {
  if (data.isEmpty) {
    Api().getkrishiApiData();
    print("calling api");
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(child: Column(
          children: [
            CircularProgressIndicator(),
            Text("Check your internet Connection"),
          ],
        )),

        ElevatedButton(onPressed:()=> Api().getkrishiApiData(),  child: Text("Retry"),style:ButtonStyle(

        ) ,)
      ],
    );
  } else {
    return ListView.builder(
      itemCount: data[0].data.otherMandi.length,
      itemBuilder: (context, i) {
        OtherMandiHive othermandi = data[0].data.otherMandi[i];
        return Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.red,
                    offset: Offset(0.0, 0.1),
                    blurRadius: 2.0),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Image(
                  image: CachedNetworkImageProvider(othermandi.image),
                  height: 120,
                  width: 120,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))

                      ),



                      height: 100,
                      width: 100,
                      child: const Center(
                        child: const Text("Not Found " ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text("Name : ${othermandi.hindiName}"),
                    Text("Id : ${othermandi.id}"),
                    Text("LastDate : ${othermandi.lastDate}"),
                    Text("District :${othermandi.district}"),
                    Text("km :${othermandi.km}"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
