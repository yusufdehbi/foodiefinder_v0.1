import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:pre_test/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //intial value
  String resTypeDropdownValue = "Moroccan";
  String resPriceDropdownValue = '\$';

  //values
  var resTypes = ["Moroccan", "Cham", "Italy", "Chamal", "Tsraditional"];
  List<String> resPrices = [
    '\$',
    '\$' '\$',
    '\$' '\$' '\$',
    '\$' '\$' '\$',
    '\$' '\$' '\$' '\$',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("New Try"),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search for a restaurant',
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton(
                    value: resTypeDropdownValue,
                    items: resTypes.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        resTypeDropdownValue = newValue!;
                      });
                    },
                  ),
                  DropdownButton(
                    value: resPriceDropdownValue,
                    items: resPrices.map((String prices) {
                      return DropdownMenuItem(
                          value: prices, child: Text(prices));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        resPriceDropdownValue = newValue!;
                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Icon(Icons.done))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                width: double.infinity,
                height: 400.0,
                child: MapView(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.list),
        ),
      ),
    );
  }
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(34.0500322, -6.8127248),
        zoom: 20.5,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
