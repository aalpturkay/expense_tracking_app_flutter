import 'package:expense_tracking_app/enums/http_status_type.dart';

extension HttpStatusExt on HttpStatusType {
  int get toStatusCode {
    switch (this) {
      case HttpStatusType.conflict:
        return 409;
      case HttpStatusType.created:
        return 201;
      case HttpStatusType.unauthorized:
        return 401;

      default:
        return 404;
    }
  }
}
