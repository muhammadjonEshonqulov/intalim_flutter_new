import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intalim/app/router.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/db/cache.dart';

import '../../../common/widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>  {
  String fullName = "";
  String organizationUser = "";


  @override
  void initState() {
    _getProfile();
    super.initState();
  }

  void _getProfile() async {
    String organ = await cache.getString(cache.organization_user_uz)??"";
    String full = await cache.getString(cache.fullname)??"";

    setState(() {
      fullName = full;
      organizationUser = organ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: CustomAppBar(titleName: "profile".tr()),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('assets/images/person_default.png'),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fullName,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    organizationUser,
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "general".tr(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            InkWell(
                              onTap: () {
                                // Handle the card click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/own_data.png",
                                      width: 24.0,
                                      height: 24.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        "own_information".tr(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, size: 20.0),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Handle the card click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/theme_settings.png",
                                      width: 24.0,
                                      height: 24.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        "theme".tr(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, size: 20.0),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Handle the card click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/language_settings.png",
                                      width: 24.0,
                                      height: 24.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        "change_language".tr(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, size: 20.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.all(10.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "useful_data".tr(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            InkWell(
                              onTap: () {
                                // Handle the card click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/love.png",
                                      width: 24.0,
                                      height: 24.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        "give_rate".tr(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, size: 20.0),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Handle the card click
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/help.png",
                                      width: 24.0,
                                      height: 24.0,
                                    ),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                      child: Text(
                                        "help".tr(),
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios, size: 20.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _showLogoutDialog(context);
                      },
                      child: Container(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logout.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Text(
                                    "logout".tr(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: Colors.white,
          title: Text('logout_title'.tr(),  style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),),
          content:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [

                  Text(
                    'logout_message'.tr(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        // await cache.clear();
                        router.go(Routes.login);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'logout'.tr(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Utils.colorPrimary, // Change color as needed
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'cancel'.tr(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0,
                            color: Utils.colorPrimary
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
