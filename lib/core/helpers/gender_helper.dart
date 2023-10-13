
import 'package:desafio_flutter_urbetrack/application/localizations/i18n.dart';
import 'package:flutter/material.dart';

abstract class GenderHelper {

  static String getTranslatedGender(BuildContext context, String gender) {
    String translatedGender;
    if (gender == 'male') {
      translatedGender = I18n.of(context).translate(gender);
    } else if (gender == 'female') {
      translatedGender = I18n.of(context).translate(gender);
    } else {
      translatedGender = I18n.of(context).translate('other_gender');
    }
    return translatedGender;
  }
}