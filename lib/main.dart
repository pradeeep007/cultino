import 'package:cultino/data/hive/gender/gender.dart';
import 'package:cultino/data/hive/otherMandiHive.dart';
import 'package:cultino/data/hive/theDataHive.dart';
import 'package:cultino/screen/screenOne.dart';
import 'package:cultino/screen/screenTwo.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/hive/profileHive.dart';
import 'data/hive/theKrishiHive.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(APICacheHiveAdapter());
  Hive.registerAdapter(DataHiveAdapter());
  Hive.registerAdapter(OtherMandiHiveAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(GenderAdapter());

  await Hive.openBox<APICacheHive>("apicache");
  await Hive.openBox<Profile>("profile");
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cultino Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cultin"),
      ),
      body: IndexedStack(
        children: <Widget>[ScreenOne(), ScreenTwo()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: "Screen One", icon: Icon(Icons.ac_unit)),
          BottomNavigationBarItem(label: "Screen Two ",icon :Icon(Icons.ac_unit))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
