import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:interview/Constants/map_json.dart';
import 'package:interview/Data%20Providers/property_data.dart';
import 'package:interview/Widgets/Map/custom_marker.dart';

class MapPage extends StatefulWidget {
  int id;
  MapPage({
    super.key,
    required this.id,
  });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late PageController pageController;

  @override
  void initState() {
    _loadMapStyle();
    addCustomIcon();
    _addMarkers();

    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.4);
  }

  @override
  void dispose() {
    mapController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await _getFileData('assets/json/night_mode.json');
    setState(() {});
  }

  Future<String> _getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  // to change  the marker to custom image
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      "assets/icons/flat.png",
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: CameraPosition(
        target: LatLng(properties[0].latitude, properties[0].longitude),
        zoom: 10,
      ),
      markers: _getMarkersById(widget.id),
    );
  }

  bool _isMapCreated = false;
  bool _nightMode = true; // Set night mode as default
  String _mapStyle = '';

  Widget _nightModeToggler() {
    return TextButton(
      child: Text('${_nightMode ? 'Disable' : 'Enable'} Night Mode'),
      onPressed: () async {
        setState(() {
          _nightMode = !_nightMode;
          _mapStyle = _nightMode ? nightModeStyle : '';
        });
        await mapController.setMapStyle(_mapStyle);
      },
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _isMapCreated = true;
      if (_nightMode) {
        controller.setMapStyle(_mapStyle); // Apply default night mode style
      }
    });
  }

  Set<Marker> marker = {};
  void _addMarkers() async {
    marker = await _getMarkersForId2();
    setState(() {}); // Update the state to rebuild the GoogleMap widget
  }

  // Function to get markers based on the selected ID
  Set<Marker> _getMarkersById(int id) {
    switch (id) {
      case 1:
        return _getMarkersForId1();
      case 2:
        return marker;
      case 3:
        return _getMarkersForId3();
      case 4:
        return _getMarkersForId4();
      default:
        return Set<Marker>();
    }
  }

  //  markers Id for Cozy  Area id 1
  Set<Marker> _getMarkersForId1() {
    return Set<Marker>.of(
      properties.asMap().entries.map((entry) {
        return Marker(
          markerId: MarkerId(entry.key.toString()),
          icon: markerIcon,
          position: LatLng(entry.value.latitude, entry.value.longitude),
        );
      }),
    );
  }

//  markers for ID 3
  Set<Marker> _getMarkersForId3() {
    return Set<Marker>.of(
      properties.asMap().entries.map((entry) {
        return Marker(
          markerId: MarkerId(entry.hashCode.toString()),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          position: LatLng(entry.value.latitude, entry.value.longitude),
        );
      }),
    );
  }

//  markers for ID 4
  Set<Marker> _getMarkersForId4() {
    return Set<Marker>.of(
      properties.asMap().entries.map((entry) {
        return Marker(
          markerId: MarkerId(entry.key.toString()),
          // icon: markerIconForId4, // Customize marker icon as needed
          position: LatLng(entry.value.latitude, entry.value.longitude),
        );
      }),
    );
  }

  // merker Id by Price id 3
  Future<Set<Marker>> _getMarkersForId2() async {
    List<Marker> markersList = [];
    for (var entry in properties.asMap().entries) {
      ByteData markerImageData = await createCustomMarkerIconImage(
          priceText: '\$${entry.value.price}');
      BitmapDescriptor markerIcon =
          BitmapDescriptor.fromBytes(markerImageData.buffer.asUint8List());
      Marker marker = Marker(
        markerId: MarkerId(entry.key.toString()),
        position: LatLng(entry.value.latitude, entry.value.longitude),
        icon: markerIcon,
      );
      markersList.add(marker);
    }
    return markersList.toSet();
  }
}
