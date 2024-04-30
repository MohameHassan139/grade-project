import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:o3d/o3d.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelView extends StatelessWidget {
  ModelView({super.key});
// to control the animation
  // O3DController controller = O3DController();
  //Create controller object to control 3D model.
  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    // return const ModelViewer(
    //   backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
    //   src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
    //   alt: 'A 3D model of an astronaut',
    //   ar: true,
    //   autoRotate: true,
    //   iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
    //   // disableZoom: true,
    // );
    // return O3D.asset(
    //   src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
    //   controller: controller,
    // );
    return Flutter3DViewer(
      //If you don't pass progressBarColor the color of defaultLoadingProgressBar will be grey.
      //You can set your custom color or use [Colors.transparent] for hiding the loadingProgressBar.
      // progressBarColor: Colors.blue,
      controller: controller,
      src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
      //src: 'assets/sheen_chair.glb',
    );
  }
}
