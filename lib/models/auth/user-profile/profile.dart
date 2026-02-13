import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@freezed
sealed class Profile with _$Profile {
  const factory Profile({
    required String id,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'is_verified') required bool isVerified,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
