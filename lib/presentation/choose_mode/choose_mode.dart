import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

import '../../common/widgets/button/basic_app_button.dart';
import '../../core/configs/assets/app_vectors.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AppImages.chooseModeBG,
                )),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo)),
              const Spacer(),
              const Text(
                "Choose Mode",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                color: Color(0xff30393C),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                AppVectors.moon,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Dark Mode",
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .updateTheme(ThemeMode.dark);
                        },
                        child: ClipOval(
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: Color(0xff30393C),
                                shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              AppVectors.sun,
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Light Mode",
                        style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const SignupOrSigninPage()));
                  },
                  title: "Continue"),
            ],
          ),
        ),
      ],
    ));
  }
}
