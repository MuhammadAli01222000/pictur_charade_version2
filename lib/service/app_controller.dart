

import '../model/picture_charade.dart';
import 'data_source.dart';

class AppController {
  AppController._();

  static final _instance = AppController._();

  factory AppController() => _instance;

  Future<List<PictureCharade>> readData() async {
    final data = await DataSource.read();
    return data.map((item) => PictureCharade.fromMap(item)).toList();
  }
}