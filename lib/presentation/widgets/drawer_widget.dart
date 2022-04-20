import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/language_dialog.dart';
import 'package:mobile/presentation/widgets/logout_dialog.dart';
import 'package:sizer/sizer.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 30.h,
              decoration: const BoxDecoration(
                color: AppColors.darkPurple
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                ),
                child: Image(
                  height: 200,
                  image: AssetImage(
                    'assets/images/Group_10.png',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return const LanguageDialog();
                  },
                );
              },
              leading: const Icon(
                Icons.language,
                color: AppColors.darkGray,
              ),
              title: Text(
                translate("language"),
                style: const TextStyle(
                  color: AppColors.darkGray,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkGray,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.article_outlined,
                color: AppColors.darkGray,
              ),
              title: Text(
                translate("about"),
                style: const TextStyle(
                  color: AppColors.darkGray,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkGray,
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
                color: AppColors.darkGray,
              ),
              title: Text(
                translate("logout"),
                style: const TextStyle(
                  color: AppColors.darkGray,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.darkGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
