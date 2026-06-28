import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/home/presentation/manager/upload_image/upload_image_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/helper_functions/show_snack_bar.dart';
import '../../../../../core/utils/app_images.dart';
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
            child: CustomNetworkImage(imageUrl: getUserData().imageUrl!),
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
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = File(image.path);
        // widget.onFileChanged(imageFile!);
        setState(() {});
      } else {
        debugPrint('No image selected');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}

class AvatarEditButton extends StatelessWidget {
  const AvatarEditButton({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: CircleAvatar(
          backgroundColor: Color(0xffF9F9F9),
          radius: 12,
          child: SvgPicture.asset(Assets.imagesCameraIcon),
        ),
      ),
    );
  }
}
