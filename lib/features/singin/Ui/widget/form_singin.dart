// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/features/singin/Ui/widget/singin_bloc_listener.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/color.dart';
import '../../../widget/button.dart';
import '../../../widget/text_from.dart';
import '../../logic/cubit/singin_cubit.dart';

class FormSingin extends StatefulWidget {
  const FormSingin({super.key});

  @override
  State<FormSingin> createState() => _FormSinginState();
}

class _FormSinginState extends State<FormSingin> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<SinginCubit>(context),
      child: Form(
          key: context.read<SinginCubit>().key,
          child: Column(
            children: [
              FromFields(
                  vaildet: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'الرجاء ادخال الاسم';
                    }
                  },
                  paddingContentV: 18.h,
                  hint: 'الاسم بالانجلزية',
                  controller: context.read<SinginCubit>().controllerName!,
                  icon: Icon(
                    Icons.person,
                    color: ColorManger.font,
                    size: 30,
                  ),
                  keyboardType: TextInputType.name,
                  context: context),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1.0),
                child: Align(
                  child: Text(
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                    SinginCubit.get(context).site == Check.student
                        ? 'يكتب هذا الاسم في الشهادة'
                        : 'يكتب هذا الاسم في معلومات الكورس',
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
              verticalBox(10.h),
              FromFields(
                  vaildet: (value) {
                    if (value!.isEmpty || value == null) {
                      return 'الرجاء ادخال البريد الالكتروني';
                    }
                  },
                  paddingContentV: 18.h,
                  hint: 'البريد الاكتروني',
                  controller: context.read<SinginCubit>().controllerEmail!,
                  icon: Icon(
                    Icons.email_outlined,
                    size: 30,
                    color: ColorManger.font,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  context: context),
              verticalBox(10.h),
              FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال كلمة المرور';
                  }
                },
                paddingContentV: 18.h,
                hint: 'كلمة المرور',
                controller: context.read<SinginCubit>().controllerPassword!,
                keyboardType: TextInputType.number,
                obscure: SinginCubit.get(context).obscure,
                context: context,
                icon: IconButton(
                  color: ColorManger.icon,
                  onPressed: () {
                    setState(() {
                      SinginCubit.get(context)
                          .cnangeObscure(SinginCubit.get(context).obscure);
                    });
                  },
                  icon: Icon(
                    SinginCubit.get(context).obscure
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: ColorManger.font,
                    size: 30,
                  ),
                ),
              ),
              verticalBox(10.h),
              FromFields(
                vaildet: (value) {
                  if (value!.isEmpty || value == null) {
                    return 'الرجاء ادخال كلمة المرور';
                  }
                },
                paddingContentV: 18.h,
                hint: ' تأكيد كلمة المرور',
                controller: context.read<SinginCubit>().controllerPasswordCon!,
                keyboardType: TextInputType.number,
                obscure: SinginCubit.get(context).obscure1,
                context: context,
                icon: IconButton(
                  color: ColorManger.icon,
                  onPressed: () {
                    setState(() {
                      SinginCubit.get(context)
                          .cnangeObscure1(SinginCubit.get(context).obscure1);
                    });
                  },
                  icon: Icon(
                    SinginCubit.get(context).obscure1
                        ? Icons.visibility_off
                        : Icons.visibility,
                    size: 30,
                    color: ColorManger.icon,
                  ),
                ),
              ),
              verticalBox(20.h),
              SinginBlocListener(),
              button(
                  text: ' إنشاء حساب',
                  paddingH: 135.w,
                  paddingV: 20.h,
                  function: () {
                    VildatorSingin(context);
                  })
            ],
          )),
    );
  }
}

void VildatorSingin(BuildContext context) {
  print(SinginCubit.get(context).site);
  if (context.read<SinginCubit>().key.currentState!.validate()) {
    context.read<SinginCubit>().emitSingin();
  }
}
