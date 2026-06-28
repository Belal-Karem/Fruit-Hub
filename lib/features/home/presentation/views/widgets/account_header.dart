import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/home/presentation/manager/upload_image/upload_image_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/avatar_edit_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/helper_functions/show_snack_bar.dart';
import '../../../../../core/utils/theme/app_text_style.dart';

class AccountHeader extends StatefulWidget {
  const AccountHeader({super.key});

  @override
  State<AccountHeader> createState() => _AccountHeaderState();
}

class _AccountHeaderState extends State<AccountHeader> {
  File? imageFile;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: getUserData().imageUrl == null
                ? SvgPicture.asset(Assets.imagesProfileImage)
                : CustomNetworkImage(imageUrl: getUserData().imageUrl!),
          ),
          Positioned(
            bottom: -15,
            right: 0,
            left: 0,
            child: AvatarEditButton(
              onTap: () async {
                isLoading = true;
                setState(() {});
                await pickerImage();
                isLoading = false;
                setState(() {});
                if (imageFile != null) {
                  var getUser = getUserData();

                  UserEntity user = UserEntity(
                    email: getUser.email,
                    uId: getUser.uId,
                    name: getUser.name,
                    image: imageFile!,
                  );
                  await context.read<UploadImageCubit>().uploadImage(
                    user,
                    getUser.uId!,
                  );
                } else {
                  showErrorBar(context, 'Please select an image');
                }
              },
            ),
          ),
        ],
      ),
      title: Text(
        getUserData().name,
        textAlign: TextAlign.right,
        style: AppTextStyle.bold13,
      ),
      subtitle: Text(getUserData().email, style: AppTextStyle.regular13),
    );
  }

  Future<void> pickerImage() async {
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context, ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context, ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );

    if (source == null) return;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);

      if (image != null) {
        imageFile = File(image.path);
        setState(() {});
      } else {
        debugPrint('No image selected');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
