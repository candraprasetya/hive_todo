part of 'models.dart';

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? age;
  @HiveField(2)
  final String? phoneNumber;
  @HiveField(3)
  final int? totalOutcome;

  Contact({this.name, this.age, this.phoneNumber, this.totalOutcome});
}
