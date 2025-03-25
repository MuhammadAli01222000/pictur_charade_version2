import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../page/home_page.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';

sealed class CustomDialog{
  static   void myDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: Center(
            child: Container(
            width: AppDimens.d300,height: AppDimens.d100,
             decoration: BoxDecoration(
               color: AppColors.grey,
                 borderRadius: BorderRadius.circular(AppDimens.d12),
             ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  Center(
                    child: Text(
                      "ORTGA QAYTMOQCHIMISIZ",
                      style: GoogleFonts.russoOne(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.blue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        print('push ');
                        Navigator. pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>  HomePage(items: [],),
                          ),
                        );                  },
                      child: Text("YES", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.redAccent, Colors.blue],
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {
                        print('push ');
                        Navigator.pop(context);
                      },
                      child: Text("NO", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Spacer(),],),
                  Spacer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}