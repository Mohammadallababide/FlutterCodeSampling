import 'package:json_annotation/json_annotation.dart';

import 'enums/ProfileType.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final String id;
  @JsonKey(required: false)
  final String email;
  @JsonKey(required: false)
  final String name;
  @JsonKey(required: false)
  final bool isConfirmed;
  @JsonKey(required: false)
  final String password;
  @JsonKey(required: false)
  final String address;
  @JsonKey(required: false)
  final String imageUrl;
  @JsonKey(required: false)
  final ProfileType profileType;
  @JsonKey(required: false)
  final String profileId;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.isConfirmed,
    required this.password,
    required this.address,
    required this.imageUrl,
    required this.profileType,
    required this.profileId,
  });

  factory User.fromJson(json) => _$UserFromJson(json);
  toJson() => _$UserToJson(this);
}
