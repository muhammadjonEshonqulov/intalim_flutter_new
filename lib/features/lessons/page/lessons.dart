import 'dart:convert';import 'package:easy_localization/easy_localization.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:intalim/app/router.dart';import 'package:intalim/features/lessons/model/lessons_event.dart';import '../../../common/services/utils/utils.dart';import '../block/lessons_bloc.dart';import '../model/lesson_data.dart';import '../repository/lessons_repository.dart';class LessonsPageWithRepo extends StatelessWidget {  const LessonsPageWithRepo({super.key});  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => LessonsBloc(context.read<LessonsRepository>()),      child: const LessonsScreen(),    );  }}class LessonsScreen extends StatefulWidget {  const LessonsScreen({super.key});  @override  State<LessonsScreen> createState() => _LessonsScreen();}class _LessonsScreen extends State<LessonsScreen> {  late LessonsBloc _lessonsBloc;  @override  void initState() {    _lessonsBloc = BlocProvider.of<LessonsBloc>(context);    _lessonsBloc.add(LessonsEventData());    super.initState();  }  @override  Widget build(BuildContext context) {    return Scaffold(        backgroundColor: Utils.backColor,        body: StreamBuilder<List<LessonData>>(          stream: _lessonsBloc.lessonsFromLocal,          builder: (context, snapshot) {            if (snapshot.hasData) {              final tasks = snapshot.data;              return ListView.builder(                itemCount: tasks?.length,                itemBuilder: (context, index) {                  return LessonItem(lessonData: tasks?[index]);                },              );            } else {              return Center(child: Text("loading".tr()));            }          },        ));  }}class LessonItem extends StatelessWidget {  final LessonData? lessonData;  const LessonItem({required this.lessonData});  @override  Widget build(BuildContext context) {    Name lessonName = Name.fromJson(json.decode(lessonData?.lesson ?? ""));    return Card(      margin: EdgeInsets.all(8.0),      color: Colors.white,      shape: RoundedRectangleBorder(        borderRadius: BorderRadius.all(Radius.circular(8.0)),      ),      elevation: 0.0,      child: InkWell(        onTap: () {          router.push(Routes.topic, extra: {            "eduTypeLessonId": lessonData?.id,            "eduTypeLessonName": lessonName.uz?.toString() ?? "",          });        },        child: Padding(          padding: EdgeInsets.all(8.0),          child: Row(            children: [              Image.asset(                'assets/images/lesson_icon.png',                width: 40.0,                height: 40.0,                fit: BoxFit.cover,              ),              Expanded(                child: Padding(                  padding: EdgeInsets.all(8.0),                  child: Text(                    lessonName.uz.toString() ?? "",                    style: TextStyle(                      fontFamily: 'Montserrat',                      fontWeight: FontWeight.w600,                      color: Colors.black,                      fontSize: 14.0,                    ),                  ),                ),              ),              Image.asset(                'assets/images/more.png',                width: 30.0,                height: 30.0,                fit: BoxFit.cover,              ),            ],          ),        ),      ),    );  }}