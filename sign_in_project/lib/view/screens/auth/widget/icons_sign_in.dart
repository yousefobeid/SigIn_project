import 'package:flutter/material.dart';

class IconsSignIn extends StatelessWidget {
  const IconsSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon('assets/icons/google.png'),
          _buildIcon('assets/icons/facebook.png'),
        ],
      ),
    );
  }

  Widget _buildIcon(String iconNmae) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 50,
        width: 50,
        child: Image.asset(iconNmae, fit: BoxFit.cover),
      ),
    );
  }
}
