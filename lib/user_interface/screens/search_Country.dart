import 'package:flutter/material.dart';
import 'package:hagglex/user_interface/widgets/app_background.dart';

class SearchCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Search Country',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 13),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF8A7FA8),
                      ),
                      filled: true,
                      fillColor: Color(0xFF584782),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0xFF8A7FA8),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  child: Image.asset(
                                      'assets/images/nigerian_flag.png'),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '(+234) Nigeria',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
