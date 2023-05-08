import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Core/utils/functions/custom_alert.dart';
import '../../../../../constant.dart';
import '../../view_models/edit_profile_cubit/edit_profile_cubit.dart';
import '../../view_models/edit_profile_cubit/edit_profile_state.dart';

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        var profileImage =
            BlocProvider.of<EditProfileCubit>(context).profileImage;
        return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.height / 9.8,
                backgroundColor: Colors.transparent,
                child: profileImage == null
                    ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:image,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline),
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                )
                    : ClipOval(
                  child: Image(
                    image: FileImage(profileImage),
                    height: double.infinity,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  customAlert(
                      context: context,
                      getGallery: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<EditProfileCubit>(context)
                            .getProfileImage(ImageSource.gallery);
                      },
                      getCamera: () {
                        Navigator.of(context).pop();
                        BlocProvider.of<EditProfileCubit>(context)
                            .getProfileImage(ImageSource.camera);
                      });
                },
                icon: const CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
