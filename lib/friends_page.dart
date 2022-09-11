import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget{

  static const routeName = "/freinds";

  const FriendsPage({super.key});
  // final String title;

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _colorFromHex("660099"),
    );
  }
}
Color _colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}