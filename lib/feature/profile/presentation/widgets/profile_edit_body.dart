import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/core/widgets/translator.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/app_textfiled.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/button_widget.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileEditBody extends StatefulWidget {
  const ProfileEditBody({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.address,
  });

  final String firstName;
  final String lastName;
  final String address;

  @override
  State<ProfileEditBody> createState() => _ProfileEditBodyState();
}

class _ProfileEditBodyState extends State<ProfileEditBody> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    firstNameController.text = widget.firstName;
    lastNameController.text = widget.lastName;
    addressController.text = widget.address;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          Translator(
            uz: "Ism",
            ru: "Имя",
            crl: "Исм",
            style: AppStyle.w400s13h18DarkBlue300,
          ),
          AppTextfiled(controller: firstNameController),
          const Divider(thickness: 1, height: 1),
          const SizedBox(height: 12),
          Translator(
            uz: "Familya",
            ru: "Фамилия",
            crl: "Фамилия",
            style: AppStyle.w400s13h18DarkBlue300,
          ),
          AppTextfiled(controller: lastNameController),
          const Divider(thickness: 1, height: 1),
          const SizedBox(height: 12),
          Translator(
            uz: "Manzil",
            ru: "Адрес",
            crl: "Манзил",
            style: AppStyle.w400s13h18DarkBlue300,
          ),
          ZoomTapAnimation(
            onTap: () async {
              final address = await context.push(AppRouter.region);
              if (address == null) return;
              try {
                addressController.text = address.toString();
              } catch (e) {}
            },
            child: AppTextfiled(enable: false, controller: addressController),
          ),
          const Divider(thickness: 1, height: 1),
          const SizedBox(height: 12),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return ButtonWidget(
                isLoading: state.whenOrNull(loading: () => true) ?? false,
                text: "save".tr(),
                onTap: () {
                  context.read<ProfileBloc>().add(
                        ProfileEvent.editProfile(
                          name: firstNameController.text,
                          surname: lastNameController.text,
                          address: addressController.text,
                        ),
                      );
                  context.pop();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
