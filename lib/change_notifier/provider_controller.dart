import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar =
      'https://yt3.ggpht.com/ytc/AKedOLQwsaJxj8Ybra9SLnJX0fr8bxgXpv18nrxT6HTp=s900-c-k-c0x00ffffff-no-rj';
  String birthDate = 'Data';

  void alterarDados() {
    name = 'Elcinho';
    imgAvatar =
        'https://yt3.ggpht.com/ytc/AKedOLQwsaJxj8Ybra9SLnJX0fr8bxgXpv18nrxT6HTp=s900-c-k-c0x00ffffff-no-rj';
    birthDate = '01/01/2001';
    notifyListeners();
  }
}
