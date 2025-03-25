import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:takrorlash/core/config/app_routes.dart';
import 'package:takrorlash/core/theme/dimens.dart';
import 'package:takrorlash/page/splash_page.dart';
import 'package:just_audio/just_audio.dart';
import '../core/theme/colors.dart';
import '../core/theme/icons.dart';
import '../core/widgets/icon_button.dart';
import '../core/widgets/text_widget.dart';
import '../model/picture_charade.dart';
import 'game_page.dart';

///img path
const backround = 'assets/images/images_card/backround.png';

///sound
const gameSound = 'assets/sound/game_sound.mp3';

class HomePage extends StatefulWidget {
  final List<PictureCharade> items;

  const HomePage({super.key, required this.items});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _audioPlayer = AudioPlayer();

  void music() {
    _playSoundWrong(_audioPlayer);
  }

  Future<void> _playSoundWrong(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.setAsset("assets/sound/win.wav");
      await audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  void gamePlay() {
    _soundGame(_audioPlayer);
  }

  Future<void> _soundGame(AudioPlayer audioPlayer) async {
    try {
      await audioPlayer.setAsset(gameSound);
      await audioPlayer.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final list=widget.items;
    return Scaffold(
      //   appBar: _buildPreferredSize(),
      body: SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppDimens.d300 + 100,
                height: AppDimens.d600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(backround),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Text("Current Level: 1"),
                    Text("${widget.items}"),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.redAccent, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,MaterialPageRoute(builder: (context){
                              return GamePage(items:widget.items);
                          })
                          );

                        },
                        child: Text(
                          "Play current level",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.redAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          onPressed: () {
                            if (widget.items.isNotEmpty) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.gamePage,
                                arguments: list,
                              );
                            } else {
                              debugPrint("Xatoli");
                            }
                          };

                        },
                        child: Text("Play first level"),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildPreferredSize() {
    return PreferredSize(
      preferredSize: Size.fromHeight(20),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "\nPicture Charade",
          style: GoogleFonts.sahitya(color: Colors.redAccent),
        ),
      ),
    );
  }

  ///appbar
  AppBar _buildAppBar({required int coins, required int level}) {
    return AppBar(
      backgroundColor: Colors.white70,
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
                    height: 45,
                    child: Card(
                      color: AppColors.grey,

                      child: Row(
                        children: [
                          SizedBox(width: 9),

                          SizedBox(
                            height: 35,
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
                      /// -= 100;          todo result coin
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
