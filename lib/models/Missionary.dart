import 'package:freezed_annotation/freezed_annotation.dart';

part 'Missionary.freezed.dart';
part 'Missionary.g.dart';

@freezed
class Missionary with _$Missionary {
  factory Missionary({
    required String name,
    required String bibleName,
    required String birth,
    required String h_type,
    required String p_group,
    required String area,
    required bool secure,
    required String country,
    required String city,
    required String detail,
    required String in_addr,
    required String out_addr,
    required String email,
    required String sns,
    required String m_id,
  }) = _Missionary;

  factory Missionary.fromJson(Map<String, dynamic> json) =>
      _$MissionaryFromJson(json);
}
