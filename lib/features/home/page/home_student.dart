import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:intalim/common/services/utils/utils.dart';class HomeStudent extends StatefulWidget {  const HomeStudent({super.key});  @override  State<HomeStudent> createState() => _HomeStudentState();}class _HomeStudentState extends State<HomeStudent> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: SingleChildScrollView(        child: Column(          crossAxisAlignment: CrossAxisAlignment.stretch,          children: [            Container(              child: Card(                color: Color(0xFF7BAEFF), // elevation: 8.0,                margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),                shape: RoundedRectangleBorder(                  borderRadius: BorderRadius.circular(20.0),                ),                child: Column(                  crossAxisAlignment: CrossAxisAlignment.stretch,                  children: [                    Padding(                      padding: const EdgeInsets.all(8.0),                      child: Image.asset(                        'assets/images/home_icon.png', // replace with your actual image path height: 200.0, alignment: Alignment.center, // margin: EdgeInsets.only(top: 24.0, bottom: 24.0),                      ),                    ),                    Padding(                      padding: const EdgeInsets.all(20.0),                      child: Column(                        children: [                          Row(                            children: [                              Expanded(                                child: Text(                                  'lessons_this_week'.tr(),                                  style: TextStyle(                                    fontFamily: 'MontserratMedium',                                    color: Colors.white,                                    fontSize: 16.0,                                  ),                                ),                              ),                              Text(                                '24%',                                style: TextStyle(                                  fontFamily: 'MontserratExtraBold',                                  color: Colors.white,                                  fontSize: 16.0,                                ),                              ),                            ],                          ),                          SizedBox(                            height: 8,                          ),                          Container(                            height: 5,                            child: ClipRRect(                              borderRadius: BorderRadius.circular(5.0), // Set your desired corner radius                              child: LinearProgressIndicator(                                value: 0.5, backgroundColor: Utils.backColor, valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Change to your progress bar color                              ),                            ),                          ),                          SizedBox(height: 8.0),                          Row(                            mainAxisAlignment: MainAxisAlignment.center,                            children: [                              Image.asset(                                height: 18, width: 18, 'assets/images/clock_circle.png', // replace with your actual image path width: 18.0, height: 18.0, color: Colors.white,                              ),                              SizedBox(width: 4.0),                              Expanded(                                child: Text(                                  '24.02.2023',                                  style: TextStyle(                                    fontFamily: 'MontserratRegular',                                    color: Colors.white,                                    fontSize: 16.0,                                  ),                                ),                              ),                              Text(                                'be_finished'.tr(),                                style: TextStyle(                                  fontFamily: 'MontserratRegular',                                  color: Colors.white,                                  fontSize: 16.0,                                ),                              ),                            ],                          ),                        ],                      ),                    ), // Add RecyclerView and other widgets here                  ],                ),              ),            ),            Padding(              padding: const EdgeInsets.all(16.0),              child: Text(                'sections'.tr(),                style: TextStyle(                  fontFamily: 'Montserrat',                  fontWeight: FontWeight.w600,                  color: Colors.black,                  fontSize: 16.0,                ),              ),            ),            Column(              children: [                Row(                  children: [                    Expanded(                      flex: 60,                      child: GestureDetector(                        onTap: () {},                        child: Card(                          elevation: 4.0,                          margin: EdgeInsets.all(8.0),                          shape: RoundedRectangleBorder(                            borderRadius: BorderRadius.circular(25.0),                          ),                          child: Column(                            children: [                              Container(                                height: 150.0,                                width: 300,                                decoration: BoxDecoration(                                  image: DecorationImage(                                    image: AssetImage('assets/images/timetable_home.png'),                                    fit: BoxFit.fill,                                  ),                                ),                                padding: EdgeInsets.all(16.0),                                child: Text(                                  'time_table'.tr(),                                  style: TextStyle(                                    fontFamily: 'Montserrat',                                    fontWeight: FontWeight.w600,                                    color: Colors.white,                                    fontSize: 16.0,                                  ),                                ),                              ),                            ],                          ),                        ),                      ),                    ),                    Expanded(                      flex: 37,                      child: GestureDetector(                        onTap: () {},                        child: Card(                          elevation: 4.0,                          margin: EdgeInsets.all(8.0),                          shape: RoundedRectangleBorder(                            borderRadius: BorderRadius.circular(25.0),                          ),                          child: Column(                            children: [                              Container(                                height: 150.0,                                decoration: BoxDecoration(                                  image: DecorationImage(                                    image: AssetImage('assets/images/history_payments.png'),                                    fit: BoxFit.fill,                                  ),                                ),                                padding: EdgeInsets.all(16.0),                                child: Text(                                  'payment_history'.tr(),                                  style: TextStyle(                                    fontFamily: 'Montserrat',                                    fontWeight: FontWeight.w600,                                    color: Colors.white,                                    fontSize: 16.0,                                  ),                                ),                              ),                            ],                          ),                        ),                      ),                    ),                  ],                ),                Row(                  children: [                    Expanded(                      flex: 100,                      child: GestureDetector(                        onTap: () {},                        child: Card(                          elevation: 4.0,                          margin: EdgeInsets.all(8.0),                          shape: RoundedRectangleBorder(                            borderRadius: BorderRadius.circular(35.0),                          ),                          child: Column(                            children: [                              Container(                                height: 150.0,                                width: 500,                                decoration: BoxDecoration(                                  image: DecorationImage(                                    image: AssetImage('assets/images/blits_questions.png'), fit: BoxFit.fill,                                  ),                                ),                                padding: EdgeInsets.all(16.0),                                child: Text(                                  'penalties'.tr(),                                  style: TextStyle(                                    fontFamily: 'Montserrat',                                    fontWeight: FontWeight.w600,                                    color: Colors.white,                                    fontSize: 16.0,                                  ),                                ),                              ),                            ],                          ),                        ),                      ),                    ),                    Expanded(                      child: Visibility(                        visible: false, // Set to true if you want the card to be visible                        child: GestureDetector(                          onTap: () {},                          child: Card(                            elevation: 4.0,                            margin: EdgeInsets.all(8.0),                            shape: RoundedRectangleBorder(                              borderRadius: BorderRadius.circular(25.0),                            ),                            child: Column(                              children: [                                Container(                                  height: 150.0,                                  decoration: BoxDecoration(                                    image: DecorationImage(                                      image: AssetImage('assets/images/blits_questions.png'), // replace with your actual image path fit: BoxFit.cover,                                    ),                                  ),                                  padding: EdgeInsets.all(16.0),                                  child: Text(                                    'Blits Questions',                                    style: TextStyle(                                      fontFamily: 'Montserrat',                                      color: Colors.white,                                      fontSize: 16.0,                                    ),                                  ),                                ),                              ],                            ),                          ),                        ),                      ),                    ),                  ],                ),              ],            ), // Add other widgets as needed          ],        ),      ),    );  }}