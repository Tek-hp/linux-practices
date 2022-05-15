import 'package:logger/logger.dart';

final logger = Logger();

void showInfo(String info) {
  logger.i(info);
}

void showError(String error) {
  logger.e(error);
}

void showWarning(String warning) {
  logger.w(warning);
}
