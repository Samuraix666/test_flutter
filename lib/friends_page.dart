import 'dart:math';

import 'package:dest/friend.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class FriendsPage extends StatefulWidget {
  static const routeName = "/freinds";

  const FriendsPage({super.key});

  // final String title;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  String? _teamName;
  final List<Friend> _friends = [];
  final List<Color> _color = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.purple
  ];

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final teamName = prefs.getString(teamNameKey);

    setState(() {
      _teamName = "$teamName's team";
    });

    if (kDebugMode) {
      print("Load_Name $_teamName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_teamName ?? ""),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: _itemBuilder,
          separatorBuilder: _separatorBuilder,
          itemCount: _friends.length,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPerson,
        tooltip: 'Increment',
        child: const Icon(Icons.plus_one),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Container(
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black),
            right: BorderSide(),
            bottom: BorderSide(),
          ),
          borderRadius: BorderRadius.circular(25),
          color: Colors.redAccent[100],
        ),
        height: 100,
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: _friends[index].color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              _friends[index].name,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ));
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return const SizedBox(height: 10);
  }

  Future<void> _addPerson() async {
    final friend = Friend(
      _friends.length, "Kent", _color[Random().nextInt(_color.length)],
    );
    setState(() {
      _friends.add(friend);
    });
  }
}

/*
Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}*/
