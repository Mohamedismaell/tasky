import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/routes/app_routes.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/features/home/presentation/widgets/custom_list_tasks.dart';
import 'package:to_do_app/features/home/presentation/widgets/home_header.dart';
import 'package:to_do_app/features/home/presentation/widgets/priority_tasks.dart';
import 'package:to_do_app/features/home/presentation/widgets/progerss.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = cacheHelper.getData(key: 'username');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: _buildFlotingButton(context),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeHeader(userName: userName)),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello $userName, Your work Is almost done !  ',
                        style: context.textTheme.titleLarge,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.bottom,
                        child: SvgPicture.asset(
                          'assets/images/waving_hand.svg',
                          width: 32.w,
                          height: 32.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              SliverToBoxAdapter(child: Progerss()),
              SliverToBoxAdapter(child: SizedBox(height: 8.h)),
              SliverToBoxAdapter(child: PriorityTasks()),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              SliverToBoxAdapter(
                child: Text('My Tasks', style: context.textTheme.titleLarge),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 16.h)),
              CustomeListTasks(allTaks: true),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildFlotingButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: ElevatedButton.icon(
      onPressed: () => context.push(AppRoutes.addtask),
      icon: Icon(Icons.add),
      label: Text(
        'Add New Task',
        style: context.textTheme.bodyMedium!.copyWith(
          color: AppColors.textPrimaryDark,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      ),
    ),
  );
}
