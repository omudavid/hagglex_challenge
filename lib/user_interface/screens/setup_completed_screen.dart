import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';

class SetupCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Column(
              children: [
                SvgPicture.asset('assets/svg/completed.svg'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Setup Complete',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Thank you for setting up your HaggleX account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ConstrainedBox(
                constraints:
                    BoxConstraints.tightFor(width: double.infinity, height: 50),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xFFFFC175)),
                  onPressed: () {},
                  child: Text(
                    'START EXPLORING',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
