// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Missionary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Missionary _$$_MissionaryFromJson(Map<String, dynamic> json) =>
    _$_Missionary(
      name: json['name'] as String,
      bibleName: json['bibleName'] as String,
      birth: json['birth'] as String,
      h_type: json['h_type'] as String,
      p_group: json['p_group'] as String,
      area: json['area'] as String,
      secure: json['secure'] as bool,
      country: json['country'] as String,
      city: json['city'] as String,
      detail: json['detail'] as String,
      in_addr: json['in_addr'] as String,
      out_addr: json['out_addr'] as String,
      email: json['email'] as String,
      sns: json['sns'] as String,
      m_id: json['m_id'] as String,
    );

Map<String, dynamic> _$$_MissionaryToJson(_$_Missionary instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bibleName': instance.bibleName,
      'birth': instance.birth,
      'h_type': instance.h_type,
      'p_group': instance.p_group,
      'area': instance.area,
      'secure': instance.secure,
      'country': instance.country,
      'city': instance.city,
      'detail': instance.detail,
      'in_addr': instance.in_addr,
      'out_addr': instance.out_addr,
      'email': instance.email,
      'sns': instance.sns,
      'm_id': instance.m_id,
    };
