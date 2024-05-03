import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARtest extends StatefulWidget {
  ARtest({super.key});

  @override
  State<ARtest> createState() => _ARtestState();
}

class _ARtestState extends State<ARtest> {
  late ArCoreController arCoreController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('widget.title'),
        ),
        body: ArCoreView(
          onArCoreViewCreated: _onArCoreViewCreated,
          enableTapRecognizer: true,
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    diplayCube(controller);
  }

  diplayCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.amber,
      metallic: 2,
    );
    final cube =
        ArCoreCube(size: vector.Vector3(0.4, 0.4, 0.4), materials: [material]);
    final node =
        ArCoreNode(shape: cube, position: vector.Vector3(-.5, .5, -3.5));
    arCoreController.addArCoreNode(node);
  }

  // void _onArCoreViewCreated(ArCoreController controller) {
  //   arCoreController = controller;
  //   arCoreController.onNodeTap = (name) => onTapHandler(name);
  //   arCoreController.onPlaneTap = _handleOnPlaneTap;
  // }

  // void onTapHandler(String name) {
  //   showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) =>
  //         AlertDialog(content: Text('onNodeTap on $name')),
  //   );
  // }

  // void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
  //   final hit = hits.first;

  //   final moonMaterial = ArCoreMaterial(color: Colors.grey);

  //   final moonShape = ArCoreSphere(
  //     materials: [moonMaterial],
  //     radius: 0.03,
  //   );

  //   final moon = ArCoreNode(
  //     shape: moonShape,
  //     position: vector.Vector3(0.2, 0, 0),
  //     rotation: vector.Vector4(0, 0, 0, 0),
  //   );

  //   final earthMaterial = ArCoreMaterial(
  //     color: Color.fromARGB(120, 66, 134, 244),
  //   );

  //   final earthShape = ArCoreSphere(
  //     materials: [earthMaterial],
  //     radius: 0.1,
  //   );

  //   final earth = ArCoreNode(
  //       shape: earthShape,
  //       children: [moon],
  //       position: plane.pose.translation + vector.Vector3(0.0, 1.0, 0.0),
  //       rotation: plane.pose.rotation);

  //   arCoreController.addArCoreNodeWithAnchor(earth);
  // }
}
