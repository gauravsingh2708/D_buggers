import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose location'),
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'asset/img/67106-map-tracking-location-system-mark-green-red.png',
                        ))),
              ),
                Center(
                  child: Text(
                    'Current Location',
                    style: TextStyle(color: Colors.white)
                  ),
                ),
//              if (settingsRepo.deliveryAddress.value?.address != null)
              SizedBox(
                height: 100,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    LocationResult result = await showLocationPicker(
                      context,
                      "AIzaSyA0ztr7esW-B9pyRKUYEa5d8CxLPnCdtdA",
                      initialCenter: LatLng(0, 0),
//                      automaticallyAnimateToCurrentLocation: true,
                      //mapStylePath: 'assets/mapStyle.json',
                      myLocationButtonEnabled: true,
                      //resultCardAlignment: Alignment.bottomCenter,
                    // ignore: missing_return
                    ).then((result) {
                      print(result.address);
                      prefs.setString('location', '${result.address}');
                      Navigator.of(context).pushReplacementNamed('/Home',);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1),
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                          'Choose Location',
                          style: TextStyle(color: Colors.white,fontSize: 25),
                        )),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
