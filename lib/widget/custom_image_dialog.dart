

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomImageDialog extends StatelessWidget {
  const CustomImageDialog({
    super.key,
    this.aspectRatio,
    required this.image,
  });
  final double? aspectRatio;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: EdgeInsets.all(12.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: AspectRatio(
            aspectRatio: aspectRatio ?? 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 2),
                    blurRadius: 2.0,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  InteractiveViewer(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.white,
                      child: FadeInImage(
                        placeholder: AssetImage('assets/images/loading.gif'),
                        image: image,
                        placeholderFit: BoxFit.none,
                        imageErrorBuilder: (_, exception, stackTrace) => Icon(
                          Icons.image_outlined,
                          color: Colors.black26,
                          size: 50.0,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.red.shade300,
                      onPressed: () => Get.back(canPop: false),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      elevation: 4.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
