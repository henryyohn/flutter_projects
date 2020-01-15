import 'package:flutter/material.dart';

import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:flutter_travel_ui_starter/screens/destination_screen.dart';
import 'package:flutter_travel_ui_starter/screens/destination_screen_better.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Top Destinations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
              GestureDetector(
                  onTap: () => print('see all'), child: Text('See All', style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16.0))),
            ],
          ),
        ),
        Container(
          height: 300.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: destinations.length,
              itemBuilder: (BuildContext context, int index) {
                Destination _destination = destinations[index];
                return GestureDetector(
//                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreen(destination: _destination))),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationScreenB(destination: _destination))),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
                    width: 210.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 0.0,
                          child: Container(
                            height: 120.0,
                            width: 200.0,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('${_destination.activities.length} activities', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
                                  SizedBox(height: 10.0),
                                  Text(_destination.description, style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                              boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 6.0)]),
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: _destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image(height: 180.0, width: 180.0, image: AssetImage(_destination.imageUrl), fit: BoxFit.cover),
                                ),
                              ),
                              Positioned(
                                left: 10.0,
                                bottom: 5.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _destination.city,
                                      style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(
                                          _destination.country,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
