import 'dart:io';
import 'development.dart' as dev;
import 'production.dart' as prod;

main(List<String> args) => Platform.environment['ANGEL_ENV'] == 'production'
    ? prod.main(args)
    : dev.main(args);
