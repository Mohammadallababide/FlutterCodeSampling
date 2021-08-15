// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['id']);
  return User(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    isConfirmed: json['isConfirmed'] as bool,
    password: json['password'] as String,
    address: json['address'] as String,
    imageUrl: json['imageUrl'] as String,
    profileType: _$enumDecode(_$ProfileTypeEnumMap, json['profileType']),
    profileId: json['profileId'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'isConfirmed': instance.isConfirmed,
      'password': instance.password,
      'address': instance.address,
      'imageUrl': instance.imageUrl,
      'profileType': _$ProfileTypeEnumMap[instance.profileType],
      'profileId': instance.profileId,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ProfileTypeEnumMap = {
  ProfileType.ADMIN: 'ADMIN',
  ProfileType.TEACHER: 'TEACHER',
  ProfileType.SCHOOL: 'SCHOOL',
};
