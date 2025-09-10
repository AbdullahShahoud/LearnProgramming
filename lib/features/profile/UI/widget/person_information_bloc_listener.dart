import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_programtion/core/helper/extention.dart';
import 'package:learn_programtion/core/routing/router.dart';
import 'package:learn_programtion/core/theming/color.dart';
import 'package:learn_programtion/core/theming/font_style.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_state.dart';

import '../../logic/model/changEmail/chang_email_response.dart';

class PersonInformationBlocListener extends StatefulWidget {
  const PersonInformationBlocListener({super.key});

  @override
  State<PersonInformationBlocListener> createState() =>
      _PersonInformationBlocListenerState();
}

class _PersonInformationBlocListenerState
    extends State<PersonInformationBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileAndNotificationCubit,
        ProfileAndNotificationState>(
      child: SizedBox.shrink(),
      listener: (context, state) {
        state.whenOrNull(successPersoinInformation: (data) {
          succcessInformation(context, data);
        }, errorPersoinInformation: (error) {
          errorInformation(context, error);
        }, loadingPersoinInformation: () {
          loadingInformation(context);
        });
      },
      listenWhen: (previous, current) =>
          current is LoadingPersoinInformation ||
          current is SuccessPersoinInformation ||
          current is ErrorPersoinInformation,
    );
  }
}

void succcessInformation(
    BuildContext context, ChangeEmailResponse changeEmailResponse) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            icon: Icon(
              Icons.check,
              color: Colors.green,
              size: 50,
            ),
            content: Center(
              child: Text(
                'تم تعديل الاسم والايميل ',
                textDirection: TextDirection.rtl,
                style: FontStyleAndText.fontmedia,
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.primary_ColorBlue),
                  onPressed: () {
                    context.pushNamed(Routers.home_page);
                  },
                  child: Text('موافق'))
            ],
          ));
}

void errorInformation(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: Text(
              '${error}',
              textDirection: TextDirection.rtl,
              style: FontStyleAndText.font_big,
            ),
            icon: Icon(
              Icons.error,
              size: 50,
              color: Colors.red,
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.primary_ColorBlue),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'حسناً',
                  ))
            ],
          ));
}

void loadingInformation(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(
              color: ColorManger.primary_ColorBlue,
            ),
          ));
}
