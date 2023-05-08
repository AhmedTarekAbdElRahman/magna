import 'package:flutter/material.dart';
import '../../../constant.dart';

void customAlert({required BuildContext context, required VoidCallback getGallery,required VoidCallback getCamera}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: const Text('Please choose media to select'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  //if user click this button, user can upload image from gallery
                  onPressed: getGallery,
                  child: Row(
                    children: const [
                      Icon(
                        Icons.image,
                      ),
                      Text(
                        'From Gallery',
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: getCamera,
                  child: Row(
                    children: const [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
  //image
}