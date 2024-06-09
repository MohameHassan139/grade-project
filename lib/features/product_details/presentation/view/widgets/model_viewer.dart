import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:o3d/o3d.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelView extends StatelessWidget {
  ModelView({super.key, required this.obj});
  String obj;

  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
   
    return Flutter3DViewer(
      controller: controller,
      src: obj!,
      // src: "https://api.alsafwa1.com/storage/48/ROUND-SOFA.obj"
        // obj!.isEmpty
        //     ? 'https://modelviewer.dev/shared-assets/models/Astronaut.glb'
        //     : obj!,
        
    );
  }
}
