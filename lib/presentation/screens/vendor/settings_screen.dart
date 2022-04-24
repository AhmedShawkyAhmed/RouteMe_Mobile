import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:mobile/data/local/cache_helper.dart';
import 'package:mobile/presentation/styles/colors.dart';
import 'package:mobile/presentation/widgets/language_dialog.dart';
import 'package:mobile/presentation/widgets/logout_dialog.dart';
import 'package:mobile/presentation/widgets/toast.dart';
import 'package:sizer/sizer.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          translate("settings"),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.darkGray,
          ),
        ),
        centerTitle: true,
        leading:
            CacheHelper.getDataFromSharedPreference(key: "type") == "Driver"
                ? InkWell(
                    onTap: () => Navigator.pushNamed(context, "/tasks"),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.darkGray,
                    ),
                  )
                : const SizedBox(),
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
                    return const LanguageDialog();
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
              onTap: () {
                showToast(translate('soon'));
              },
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
                showToast(translate('soon'));
              },
              leading: const Icon(
                Icons.article_outlined,
              ),
              title: Text(
                translate("terms"),
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
