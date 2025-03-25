import 'package:flutter/material.dart';
import 'package:takrorlash/core/config/app_routes.dart';
import 'package:takrorlash/core/theme/dimens.dart';
import 'package:takrorlash/core/widgets/dialog.dart';

import '../core/theme/colors.dart';
import '../core/theme/icons.dart';
import '../core/widgets/icon_button.dart';
import '../core/widgets/text_widget.dart';
import '../model/picture_charade.dart';
import '../service/app_controller.dart';

///img path
const coin = 'assets/images/img.png';

class GamePage extends StatefulWidget {
  final List<PictureCharade> items;
  const GamePage({super.key, required this.items});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int index = 0;
  int level = 1;
  int coins = 100;
  late List<PictureCharade> items;
  @override
  void initState() {
    super.initState();

     debugPrint(
      "GamePage: widget.items uzunligi - ${widget.items.length} ta element",
    );

    if (widget.items.isEmpty) {
      debugPrint("⚠️ Xatolik: widget.items bo'sh bo'lib keldi!");
    } else {
      items = widget.items;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: _buildAppBar(coins: coins, level: level),
      body:
          widget.items.isEmpty
              ? Center(child: Text("No items available"))
              : ListView.builder(
                controller: controller,
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _light_button(),
                      Text("${widget.items.length} ITEMS"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 200,
                            height: 310,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 250,
                                  child: Card(
                                    child: Image.asset(
                                      widget.items[1].left.imageUrl,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Card(
                                    color: Color(
                                      widget.items[index].left.color,
                                    ),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          for (
                                            var i = 0;
                                            i < widget.items[index].left.fill;
                                          )
                                            SizedBox(
                                              width: 8,
                                              height: 5,
                                              child: Card(
                                                color: AppColors.white,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 200,
                            height: 310,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 250,
                                  child: Card(
                                    child: Image.asset(
                                      widget.items[index].right.imageUrl,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: Card(
                                    color: Color(
                                      widget.items[index].right.color,
                                    ),
                                    child: Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          for (
                                            var i = 0;
                                            i < widget.items[index].right.fill;
                                          )
                                            SizedBox(
                                              width: 8,
                                              height: 5,
                                              child: Card(
                                                color: AppColors.white,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
    );
  }

  //app Bar + dialog qoshildi
  AppBar _buildAppBar({required int coins, required int level}) {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: IconButton(onPressed: (){CustomDialog.myDialog(context);}, icon: AppIcons.back),
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: TextWidgetLevel(level: level),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 120,
                    height: 25,
                    child: Card(
                      color: AppColors.grey,

                      child: Row(
                        children: [
                          SizedBox(width: 9),

                          SizedBox(
                            height: 25,
                            child: Image.asset(coin, fit: BoxFit.contain),
                          ),
                          SizedBox(width: 15),
                          TextWidgetCoin(coins: coins),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      actions: [
        SizedBox(width: 15),

        AppIconButton(
          colorIcon: AppColors.black,
          colorBackround: AppColors.black,
          icon: AppIcons.menu,
          function: () {},
          radius: 2,
        ),
      ],
    );
  }

  ///o'ng tarafdagi yashil button
  Align _light_button() {
    return Align(
      alignment: Alignment(0.8, -0.9),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          children: [
            Card(
              color: Colors.green,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      //    coinCount -= 100;
                    });
                  },
                  icon: Icon(Icons.lightbulb, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
