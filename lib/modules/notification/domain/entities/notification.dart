import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/notification/enums/notification_type.dart';

class NotificationEvent {
  final String id;
  final NotificationType type;
  final List<User> actors;
  final DateTime timeStamp;
  final dynamic data;

  NotificationEvent({
    required this.id,
    required this.type,
    required this.actors,
    required this.timeStamp,
    this.data,
  });
}
