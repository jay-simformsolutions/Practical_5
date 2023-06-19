// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrofitModel _$RetrofitModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['url'],
  );
  return RetrofitModel(
    id: json['id'] as int?,
    url: json['url'] as String?,
    jsonPlaceHolder: $enumDecodeNullable(
        _$EnumOfJsonPlaceHolderEnumMap, json['title'],
        unknownValue: EnumOfJsonPlaceHolder.title),
  );
}

Map<String, dynamic> _$RetrofitModelToJson(RetrofitModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('url', instance.url);
  val['title'] = _$EnumOfJsonPlaceHolderEnumMap[instance.jsonPlaceHolder];
  return val;
}

const _$EnumOfJsonPlaceHolderEnumMap = {
  EnumOfJsonPlaceHolder.title: 'title',
  EnumOfJsonPlaceHolder.unknown: 'unknown',
};
