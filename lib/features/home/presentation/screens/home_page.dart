import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/core/theme/extensions/theme_extension.dart';
import 'package:to_do_app/core/theme/manager/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeader(context),
              Spacer(),
              _buildBody(context),
              Spacer(),
              SvgPicture.asset(
                'assets/icons/work_progress.svg',
                width: 215,
                height: 204,
              ),
              Spacer(),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: () => context.read<ThemeCubit>().toggleTheme(),
        child: SvgPicture.asset('assets/icons/logo.svg', width: 42, height: 42),
      ),
      SizedBox(width: 16),
      Text('Tasky', style: context.textTheme.titleLarge),
    ],
  );
}

Widget _buildBody(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome To Tasky ', style: context.textTheme.titleLarge),
          SvgPicture.asset(
            'assets/icons/waving_hand.svg',
            width: 28,
            height: 28,
          ),
        ],
      ),
      SizedBox(height: 8),
      Text(
        'Your productivity journey starts here. ',
        style: context.textTheme.bodyLarge,
      ),
    ],
  );
}

Widget _buildForm(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Full Name', style: context.textTheme.bodyLarge),
      SizedBox(height: 8),
      TextField(decoration: InputDecoration(hintText: 'e.g. Sarah Khalid')),
      SizedBox(height: 24),
      Center(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Let’s Get Started'),
          ),
        ),
      ),
    ],
  );
}
