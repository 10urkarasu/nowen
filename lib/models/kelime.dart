import 'dart:convert';
/// turkish : "t"
/// english : "t"
/// photo : "t"
/// audio : "t"
/// video : "t"

Kelime kelimeFromJson(String str) => Kelime.fromJson(json.decode(str));
String kelimeToJson(Kelime data) => json.encode(data.toJson());
class Kelime {
  Kelime({
      String? turkish, 
      String? english, 
      String? photo, 
      String? audio, 
      String? video,}){
    _turkish = turkish;
    _english = english;
    _photo = photo;
    _audio = audio;
    _video = video;
}

  Kelime.fromJson(dynamic json) {
    _turkish = json['turkish'];
    _english = json['english'];
    _photo = json['photo'];
    _audio = json['audio'];
    _video = json['video'];
  }
  String? _turkish;
  String? _english;
  String? _photo;
  String? _audio;
  String? _video;
Kelime copyWith({  String? turkish,
  String? english,
  String? photo,
  String? audio,
  String? video,
}) => Kelime(  turkish: turkish ?? _turkish,
  english: english ?? _english,
  photo: photo ?? _photo,
  audio: audio ?? _audio,
  video: video ?? _video,
);
  String? get turkish => _turkish;
  String? get english => _english;
  String? get photo => _photo;
  String? get audio => _audio;
  String? get video => _video;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['turkish'] = _turkish;
    map['english'] = _english;
    map['photo'] = _photo;
    map['audio'] = _audio;
    map['video'] = _video;
    return map;
  }

}