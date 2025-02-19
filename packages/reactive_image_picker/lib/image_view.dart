import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_image_picker/image_file.dart';

class ImageView extends StatelessWidget {
  final SelectedFileImage image;

  const ImageView({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final file = image.file;

    if (file != null) {
      return kIsWeb
          ? Image.network(file.path)
          : Image.file(file, fit: BoxFit.cover);
    }

    final url = image.url;
    if (url != null) {
      return Image.network(url);
    }

    return const SizedBox.shrink();
  }
}
