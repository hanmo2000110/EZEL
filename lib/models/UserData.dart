import 'package:freezed_annotation/freezed_annotation.dart';

part 'UserData.freezed.dart';
part 'UserData.g.dart';

@freezed
class UserData with _$UserData {
  factory UserData({
    required String email,
    required String name,
    required bool isAdmin,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
