// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //


// class MapTabPage extends StatefulWidget {
//   const MapTabPage({super.key});



//   @override
//   State<MapTabPage> createState() => _MapTabPageState();
// }

// class _MapTabPageState extends State<MapTabPage> {
//   final Completer<GoogleMapController> _controllerGoogleMap = Completer();
//   GoogleMapController? newGoogleMapController;

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );
//   blackThemeGoogleMap()
//   {
//    // newGoogleMapController!.setMapStyle();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Stack(
//         children: [
//           GoogleMa ooe:MapType.normal,
//             myLocationEnabled:true,
//             initialCameraPosition: _kGooglePlex ,
//             onMapCreated:
//             (GoogleMapController controller)
//             {
//               _controllerGoogleMap.complete(controller);
//               newGoogleMapController = controller;
//               //for theme change
//               //newGoogleMapController!.setMapStyle();
//             }
//           ),
//         ],
//       ),
//     );
//   }
// }
