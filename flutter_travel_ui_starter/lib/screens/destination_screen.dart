import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/models/activity_model.dart';
import 'package:flutter_travel_ui_starter/models/destination_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 6.0)],
                ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 25.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city, style: TextStyle(color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.w600)),
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
                          widget.destination.country,
                          style: TextStyle(color: Colors.white70, fontSize: 20.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 20.0,
                child: Icon(
                  Icons.location_on,
                  size: 25.0,
                  color: Colors.white70,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                itemCount: widget.destination.activities.length,
                itemBuilder: (BuildContext context, int index) {
                  Activity activity = widget.destination.activities[index];
                  return Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 10.0, 5.0),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(95.0, 5.0, 5.0, 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    child: Text(
                                      activity.name,
                                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '\$${activity.price}',
                                        style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'per pax',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  activity.type,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              _buildRatingStar(activity.rating),
                              SizedBox(height: 10.0),
                              Row(
                                  children: activity.startTimes
                                      .map((time) => Container(
                                            margin: EdgeInsets.only(right: 10.0),
                                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).accentColor,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Text(time),
                                          ))
                                      .toList())
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10.0,
                        left: 15.0,
                        top: 10.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: AssetImage(activity.imageUrl),
                            width: 110,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget _buildRatingStar(int rating) {
    var textStr = '';
    for (var i = 0; i < rating; i++) {
      textStr += '⭐️ ';
    }
    textStr.trim();
    return Text(
      textStr,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
