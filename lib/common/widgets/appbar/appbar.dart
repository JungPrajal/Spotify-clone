import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark.mode.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';

class BasicAppbar extends StatelessWidget {
  const BasicAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white.withOpacity(0.03)
                    : Colors.black.withOpacity(0.03),
                shape: BoxShape.circle),
            child: Icon(
              Icons.arrow_back,
              size: 15,
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          )),
    );
  }
}
