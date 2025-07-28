import 'package:elaro_app/core/constants/app_images.dart';
import 'package:elaro_app/core/widgets/custom_appbar.dart';
import 'package:elaro_app/core/widgets/custom_toast.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_edit_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.address,
  });

  final String firstName;
  final String lastName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          failure: (e) {
            CustomToast.showToast(
              context,
              AppImages.error,
              e.error,
              Colors.white,
              Colors.red,
            );
          },
          success: (s) {},
        );
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          titleUz: "Profilni tahrirlash",
          titleRu: "Редактировать профиль",
          titleCrl: "Профилни таҳрилаш",
        ),
        body: ProfileEditBody(
          firstName: firstName,
          lastName: lastName,
          address: address,
        ),
      ),
    );
  }
}
