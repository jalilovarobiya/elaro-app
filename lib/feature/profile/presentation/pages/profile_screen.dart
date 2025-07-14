import 'package:clean_arxitekture/core/constants/app_colors.dart';
import 'package:clean_arxitekture/core/widgets/custom_button.dart';
import 'package:clean_arxitekture/feature/profile/presentation/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 15,
            children: [
              Text(
                "Xarid qilish, buyurtmalarni kuzatish va bo'lib bo'lib to'lash uchun tizimga kiring",
                textAlign: TextAlign.center,
              ),
              CustomButton(
                text: "Kirish",
                onPressed: () {},
                color: AppColor.primary,
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.favorite_border),
                      title: "Sevimlilar",
                    ),
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.public_outlined),
                      title: "Ilova tili",
                    ),
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.location_on_outlined),
                      title: "Bizning do'konlarimiz",
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.question_answer_outlined),
                      title: "Qo'llab-quvvatlash markazi",
                    ),
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.error_outline),
                      title: "Ma'lumot",
                    ),
                    ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.logout),
                      title: "Chiqish",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
