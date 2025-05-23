// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profil_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfilModel _$ProfilModelFromJson(Map<String, dynamic> json) {
  return _ProfilModel.fromJson(json);
}

/// @nodoc
mixin _$ProfilModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this ProfilModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfilModelCopyWith<ProfilModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfilModelCopyWith<$Res> {
  factory $ProfilModelCopyWith(
          ProfilModel value, $Res Function(ProfilModel) then) =
      _$ProfilModelCopyWithImpl<$Res, ProfilModel>;
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class _$ProfilModelCopyWithImpl<$Res, $Val extends ProfilModel>
    implements $ProfilModelCopyWith<$Res> {
  _$ProfilModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfilModelImplCopyWith<$Res>
    implements $ProfilModelCopyWith<$Res> {
  factory _$$ProfilModelImplCopyWith(
          _$ProfilModelImpl value, $Res Function(_$ProfilModelImpl) then) =
      __$$ProfilModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String email});
}

/// @nodoc
class __$$ProfilModelImplCopyWithImpl<$Res>
    extends _$ProfilModelCopyWithImpl<$Res, _$ProfilModelImpl>
    implements _$$ProfilModelImplCopyWith<$Res> {
  __$$ProfilModelImplCopyWithImpl(
      _$ProfilModelImpl _value, $Res Function(_$ProfilModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$ProfilModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfilModelImpl implements _ProfilModel {
  _$ProfilModelImpl({this.name = "", this.email = ""});

  factory _$ProfilModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfilModelImplFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'ProfilModel(name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfilModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email);

  /// Create a copy of ProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfilModelImplCopyWith<_$ProfilModelImpl> get copyWith =>
      __$$ProfilModelImplCopyWithImpl<_$ProfilModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfilModelImplToJson(
      this,
    );
  }
}

abstract class _ProfilModel implements ProfilModel {
  factory _ProfilModel({final String name, final String email}) =
      _$ProfilModelImpl;

  factory _ProfilModel.fromJson(Map<String, dynamic> json) =
      _$ProfilModelImpl.fromJson;

  @override
  String get name;
  @override
  String get email;

  /// Create a copy of ProfilModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfilModelImplCopyWith<_$ProfilModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
