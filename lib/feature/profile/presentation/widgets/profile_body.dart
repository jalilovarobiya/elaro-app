import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:elaro_app/core/constants/app_styles.dart';
import 'package:elaro_app/core/extension/sized_box_extension.dart';
import 'package:elaro_app/core/routes/app_routes.dart';
import 'package:elaro_app/feature/auth/presentation/widgets/button_widget.dart';
import 'package:elaro_app/feature/profile/presentation/bloc/bloc/profile_bloc.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_edit_page.dart';
import 'package:elaro_app/feature/profile/presentation/widgets/profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(const ProfileEvent.fetchData());
    context.locale;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 15,
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.maybeMap(
                success: (profile) {
                  return ProfileInfoTile(
                    name: profile.profile.data?.name ?? "",
                    phone: profile.profile.data?.phone ?? "",
                    last: profile.profile.data?.surname ?? "",
                    address: profile.profile.data?.address ?? "",
                  );
                },
                loading: (_) => ProfileInfoLoadingTile(),
                orElse: () => LoginRequiredWidget(),
              );
            },
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileWidget(
                  onTap: () {
                    context.push(AppRouter.favourite);
                  },
                  icon: CupertinoIcons.heart,
                  title: "favorites",
                ),
                ProfileWidget(
                  onTap: () => context.push(AppRouter.language),
                  actionIcon: Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 3,
                      ),
                      child: Text(
                        language(),
                        style: AppStyle.w700s18h28DarkBluePrimary.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  icon: Icons.language,
                  title: "language",
                ),
                ProfileWidget(
                  onTap: () => context.push(AppRouter.location),

                  icon: CupertinoIcons.location_solid,
                  title: "location",
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileWidget(
                  icon: CupertinoIcons.chat_bubble_2,
                  title: "support",
                ),
                ProfileWidget(icon: CupertinoIcons.info, title: "info"),
                ProfileWidget(
                  onTap: () {
                    // showDialog(
                    //   context: context,
                    //   builder:
                    //       (context) => AlertDialog(
                    //         title: Translator(
                    //           maxLen: 3,
                    //           textAlign: TextAlign.center,
                    //           uz: "Hisobingizni o'chirib tashlamoqchisiz",
                    //           ru: "Вы хотите удалить свой аккаунт",
                    //           crl: "Ҳисобингизни ўчириб ташламоқчисиз",
                    //         ),
                    //         content: Translator(
                    //           textAlign: TextAlign.center,
                    //           uz: "Ishonchingiz komilmi?",
                    //           ru: "Вы уверены?",
                    //           crl: "Ишончингиз комилми?",
                    //         ),
                    //         actions: [
                    //           TextButton(
                    //             onPressed: () {
                    //               context.pop();
                    //             },
                    //             child: Text("cancel".tr()),
                    //           ),
                    //           ElevatedButton(
                    //             onPressed: () async {
                    //               await SecureStorage().deleteAll();
                    //               setState(() {});
                    //               context.pop();
                    //             },
                    //             child: Text("delete".tr()),
                    //           ),
                    //         ],
                    //       ),
                    // );
                    showCustomDeleteDialog(context);
                  },

                  icon: Icons.logout,
                  title: "exit",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String language() {
    final lan = context.locale.languageCode;
    if (lan == "uz") {
      return "O'z";
    } else if (lan == "en") {
      return "Ўз";
    } else if (lan == "ru") {
      return "Ру";
    } else {
      return "O'z";
    }
  }
}

class LoginRequiredWidget extends StatelessWidget {
  const LoginRequiredWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 12),
        Text("required_login".tr(), textAlign: TextAlign.center),
        const SizedBox(height: 12),
        ButtonWidget(
          textColor: Colors.white,
          text: "login".tr(),
          onTap: () {
            context.push(AppRouter.auth);
          },
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class ProfileInfoLoadingTile extends StatelessWidget {
  const ProfileInfoLoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.lightGray200,
      highlightColor: AppColor.lightGray500,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: const ListTile(),
      ),
    );
  }
}

class ProfileInfoTile extends StatelessWidget {
  final String name;
  final String last;
  final String address;
  final String phone;

  const ProfileInfoTile({
    required this.name,
    required this.phone,
    required this.address,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder:
                (context) => ProfileEditPage(
                  firstName: name,
                  lastName: last,
                  address: address,
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: const Icon(Icons.person, size: 30),
          title: Text("$name $last"),
          subtitle: Text(phone),
          trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 24),
        ),
      ),
    );
  }
}

void showCustomDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You are going to delete your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'You won\'t be able to restore your data',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                      ),
                      16.h,
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red.shade400,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: -32,
              child: CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.red,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
