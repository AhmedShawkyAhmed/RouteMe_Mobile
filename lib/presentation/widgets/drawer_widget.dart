import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/lang_dialog.dart';
import 'package:mobile/presentation/widgets/logout_dialog.dart';
import 'package:sizer/sizer.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.darkPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 50,
                right: 50,
                bottom: 50,
              ),
              child: Image(
                height: 200,
                image: AssetImage('assets/images/Group_10.png'), 
                ),
              ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const LangDialog();
                  },
                );
              },
              leading: const Icon(
                Icons.language,
                color: AppColors.white,
              ),
              title: Text(
                translate("language"),
                style: TextStyle(color: AppColors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.article_outlined,
                color: AppColors.white,
              ),
              title: Text(
                translate("about"),
                style: TextStyle(color: AppColors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const LogoutDialog();
                  },
                );
              },
              leading: const Icon(
                Icons.logout,
                color: AppColors.white,
              ),
              title: Text(
                translate("logout"),
                style: TextStyle(color: AppColors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}