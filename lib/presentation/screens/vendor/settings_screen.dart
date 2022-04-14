import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/lang_dialog.dart';
import 'package:mobile/presentation/widgets/logout_dialog.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        title: Text(
          translate("settings"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.darkGray,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: 100.w,
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
                height: 100,
                image: NetworkImage(
                  'https://pngimg.com/uploads/nike/nike_PNG6.png',
                ),
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
              ),
              title: Text(
                translate("language"),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.article_outlined,
              ),
              title: Text(
                translate("about"),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
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
              ),
              title: Text(
                translate("logout"),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
