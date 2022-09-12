import 'package:dest/friends_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String teamNameKey = "TEAM_NAME";

void main() {
  _prepareAndRun();
}

Future<void> _prepareAndRun() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  final teamName = prefs.getString(teamNameKey);

  runApp( MyApp(teamName:teamName));
}

class MyApp extends StatelessWidget {

  final String? teamName;

  const MyApp({super.key, this.teamName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red,),
      home: const MyHomePage(),
      routes: {
        MyHomePage.routeName :(BuildContext context)=> const MyHomePage(),
        FriendsPage.routeName :(BuildContext context)=> const FriendsPage(),
      },
        initialRoute: teamName == null? MyHomePage.routeName : FriendsPage.routeName,
    );
  }
}

class MyHomePage extends StatefulWidget {

  static const routeName = "/mainPage";


  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  Future<void> _incrementGoNext() async{
    Navigator.of(context).pushNamed(FriendsPage.routeName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(teamNameKey, _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Secret Santa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Введи название своей группы',),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child:TextField(
                    controller: _controller,
                    autofocus: true,
                ),
            )
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
         onPressed: _incrementGoNext,
         tooltip: 'Increment',
         child: const Icon(Icons.search),
       ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
