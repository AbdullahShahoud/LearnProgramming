import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/core/helper/extention.dart';

import '../../../../core/routing/router.dart';
import '../../../../core/theming/font_style.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_cubit.dart';
import '../../courses/logic/courses_cubit/cubit/courser_cubit_state.dart';

class ItemsTest extends StatefulWidget {
  const ItemsTest({super.key});

  @override
  State<ItemsTest> createState() => _ItemsTestState();
}

class _ItemsTestState extends State<ItemsTest> {
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      context
          .read<CourserCubitTeacher>()
          .quiz
          .add(context.read<CourserCubitTeacher>().finals!);
      super.initState();
    }

    return Scaffold(
        body: BlocConsumer<CourserCubitTeacher, CourserCubitTeacherState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubb = context.read<CourserCubitTeacher>().quiz;
        return Container(
            height: 700.h,
            child: ListView.builder(
              itemCount: cubb.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.read<CourserCubitTeacher>().selectTest =
                        cubb[index];
                    context.pushNamed(Routers.add_test);
                  },
                  child: Container(
                    height: 65.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(48, 121, 98, 248),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
                    child: Text(
                      index == cubb.length
                          ? 'الاختبار النهائي'
                          : ' ${index} الاختبار ',
                      style: FontStyleAndText.fontmedia,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ),
            ));
      },
    ));
  }
}
