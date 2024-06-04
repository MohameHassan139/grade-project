import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';
// import 'package:o3d/o3d.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class ModelView extends StatelessWidget {
  ModelView({super.key, this.obj});
  String? obj;

  Flutter3DController controller = Flutter3DController();

  @override
  Widget build(BuildContext context) {
    return Flutter3DViewer(
      controller: controller,
        src:
            "http://ayasalah448.atwebpages.com/uploads/uploads/Free%20model%20Drawer%28Final%29%20.obj"
        // obj!.isEmpty
        //     ? 'https://modelviewer.dev/shared-assets/models/Astronaut.glb'
        //     : obj!,
      //src: 'assets/sheen_chair.glb',
    );
  }
}
