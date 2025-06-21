import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeoFence extends StatelessWidget{
    const GeoFence({super.key});

    @override
    Widget build(BuildContext context){
        return Scaffold(
            appBar: AppBar(
                title: Text(
                    'GeoFence',
                    style: TextStyle(
                    fontFamily: 'PlayfairDisplay',
                    fontSize: 24.0,
                    color: Theme.of(context).secondaryHeaderColor,
                    ),
                ),
                
                centerTitle: true,

                backgroundColor: Theme.of(context).colorScheme.primary,
            )
        );
    }
    
}