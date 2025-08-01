import 'package:elaro_app/feature/profile/presentation/widgets/profile_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ProfileInfoTile extends StatelessWidget {
  final String name;
  final String last;
  final String address;
  final String phone;
  final bool ontap;

  const ProfileInfoTile({
    required this.name,
    required this.phone,
    required this.address,
    required this.last,
    this.ontap = true,
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
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: const Icon(Icons.person, size: 30),
          title: Text("$name $last"),
          subtitle: Text(phone),
          trailing: Icon(
            ontap ? Icons.arrow_forward_ios_sharp : null,
            size: 24,
          ),
        ),
      ),
    );
  }
}
