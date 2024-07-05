import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late GoogleMapController mapController;
  // LatLng はlatitude(緯度)とlongitude(経度)を表すクラス
  final LatLng _center = const LatLng(45.521563, -122.677433);

  // GoogleMapController オブジェクトを取得するためのコールバック関数
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        // GoogleMap ウィジェットを使って地図を表示
        body: GoogleMap(
          // プログラムからマップを操作するためのコントローラ
          onMapCreated: _onMapCreated,
          // 初期表示位置を指定
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
