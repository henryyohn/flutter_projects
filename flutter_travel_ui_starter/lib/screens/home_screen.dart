import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> _icons = [FontAwesomeIcons.plane, FontAwesomeIcons.bed, FontAwesomeIcons.walking, FontAwesomeIcons.biking];

  int _selectedIndex = 0;

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Theme.of(context).accentColor : Color(0XFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(_icons[index], size: 25.0, color: _selectedIndex == index ? Theme.of(context).primaryColor : Color(0XFFB4C1C4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 120.0, left: 20.0),
            child: Text('What would you like to find?', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: _icons.asMap().entries.map((MapEntry map) => _buildIcon(map.key)).toList()),
          SizedBox(height: 20.0),
          DestinationCarousel(),
        ],
      ),
    );
  }
}
