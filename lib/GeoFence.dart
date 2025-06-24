import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GeoFence extends StatefulWidget{
    const GeoFence({super.key});

    @override
    State createState(){
        return _GeoFenceState();
    }
}

class _GeoFenceState extends State<GeoFence>{

  Set<Circle> circles = {};
  int numCreated = 0;

    final double topGap = 170.0;
    final double buttonGap = 40.0;

    late GoogleMapController mapController;

    Position? curPos;
    @override
    void initState(){
        super.initState();
        determinePosition().then((position){
            setState(() {
              curPos = position;
            });
        });
    }
    Future<Position> determinePosition() async{
        bool serviceEnabled;
        LocationPermission permission;
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
            return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
            permission = await Geolocator.requestPermission();
            if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
            }
        }
        
        if (permission == LocationPermission.deniedForever) {
            return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
        } 

        final LocationSettings locationSettings = LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 100,
        );
        Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
        return position;
    }

    void _onMapCreated(GoogleMapController controller){
        mapController = controller;
    }


    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'GeoFence',
                    style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 39.0,
                    color: Theme.of(context).secondaryHeaderColor,
                    ),
                ),
                
                centerTitle: true,

                backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Stack(

                children: <Widget>[

                    Positioned(

                        top: 100,
                        left:40,

                        child: Container(

                            constraints: BoxConstraints(
                                maxHeight: 300,
                                maxWidth: 300
                            ),
                            
                            child: curPos == null ? Center(child:CircularProgressIndicator()) :
                                    GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(curPos!.latitude, curPos!.longitude),
                                        zoom: 20.0
                                    ),
                                    circles: circles,
                            ),
                        )
                    ),

                    Positioned(

                        top: 400,
                        left: 50,

                        child: Container(
                            
                            child: Column(
                                children: [
                                    createButtonRow(
                                        context,
                                        MainAxisAlignment.center,
                                        EdgeInsets.only(top: 30),
                                        (){
                                          if(curPos != null){
                                            addGeofence(LatLng(curPos!.latitude, curPos!.longitude), 900);
                                          }
                                        },
                                        'Add GeoFence',
                                    ),
                                    createButtonRow(
                                        context,
                                        MainAxisAlignment.center,
                                        EdgeInsets.only(top: 20),
                                        (){
                                          removeGeofence(LatLng(curPos!.latitude, curPos!.longitude));
                                        },
                                        'Remove GeoFence'
                                    ),
                                ]
                            )
                        )
                    ),
                ]
            ),
        );
    }

    void addGeofence(LatLng position, double radius){
      setState(() {
        circles.add(
          Circle(
            circleId: CircleId.new('GeoFence $numCreated'),
            center: position,
            radius: radius,
          ),
        );
      });
    }

    void removeGeofence(LatLng position){
      Circle removeDesired = Circle(circleId: CircleId.new('none'));
      for(int i = 0; i<circles.length; i++){
        LatLng nowCur = circles.elementAt(i).center;
        if(distanceBetween(position.latitude, position.longitude, nowCur.latitude, nowCur.longitude) <= 900){
          removeDesired = circles.elementAt(i);
        }
      }
      setState(() {
        circles.remove(removeDesired);
      });
    }

  static double distanceBetween(
  double startLatitude,
  double startLongitude,
  double endLatitude,
  double endLongitude,
) =>
    GeolocatorPlatform.instance.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );

    Row createButtonRow(
    BuildContext context,
    MainAxisAlignment mainAlignment,
    EdgeInsets margin,
    VoidCallback onPressed,
    String text,)
    {
    return Row(
      mainAxisAlignment: mainAlignment,
      children: [
        Container(
          margin: margin,
          width: 270,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Theme.of(context).primaryColorLight,
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontFamily: 'PlayfairDisplay', fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
    
}