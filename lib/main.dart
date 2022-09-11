import 'package:dest/friends_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red,),
      home: const MyHomePage(title: 'Secret Santa'),
      routes: {
        FriendsPage.routeName :(BuildContext context)=> const FriendsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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

  void _incrementGoNext() {
    Navigator.of(context).pushNamed(FriendsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
