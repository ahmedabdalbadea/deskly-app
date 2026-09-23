import 'package:deskly_app/core/theme/app_colors.dart';
import 'package:deskly_app/core/theme/app_text_styles.dart';
import 'package:deskly_app/features/home/manager/user_cubit/user_cubit.dart';
import 'package:deskly_app/features/home/view/widget/notification_button.dart';
import 'package:deskly_app/features/home/view/widget/profile_avatar.dart';
import 'package:deskly_app/features/home/view/widget/user_greeting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserGreetingBlocBuilder extends StatelessWidget {
  const UserGreetingBlocBuilder({super.key});

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good morning,';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreetingMessage();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          return Row(
            children: [
              const SizedBox(height: 8),
              UserGreeting(
                greeting: greeting,
                userName: state.user.name.split(" ")[0],
              ),
              const Spacer(),
              NotificationButton(onPressed: () {}),
              const SizedBox(width: 10),
              ProfileAvatar(
                imageUrl: state.user.imageProfile,
                userName: state.user.name,
                onPressed: () {},
              ),
            ],
          );
        }

        if (state is UserError) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.regular13(
                context,
              ).copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          );
        }

        return Skeletonizer(
          enabled: true,
          child: Row(
            children: [
              const SizedBox(height: 8),
              UserGreeting(greeting: greeting, userName: 'User Name'),
              const Spacer(),
              NotificationButton(onPressed: () {}),
              const SizedBox(width: 10),
              ProfileAvatar(userName: 'User Name', onPressed: () {}),
            ],
          ),
        );
      },
    );
  }
}
