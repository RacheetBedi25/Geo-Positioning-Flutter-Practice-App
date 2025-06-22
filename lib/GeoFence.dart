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

    final double topGap = 170.0;
    final double buttonGap = 40.0;

    late GoogleMapController mapController;

    LatLng _center = LatLng(-23.5557714, -46.6395571);

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
                            
                            child: GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                        target: _center,
                                        zoom: 11.0
                                    )
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

                                        },
                                        'Add GeoFence',
                                    ),
                                    createButtonRow(
                                        context,
                                        MainAxisAlignment.center,
                                        EdgeInsets.only(top: 20),
                                        (){

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