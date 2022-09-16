import 'package:animals/library/core/utilities/u_get_for_url.dart';

class MBirdSound {
  String? id;
  String? gen;
  String? sp;
  String? ssp;
  String? en;
  String? rec;
  String? cnt;
  String? loc;
  String? lat;
  String? lng;
  String? alt;
  String? type;
  String? url;
  String? file;
  String? fileName;
  ImageLinks? imageLinks;
  String? lic;
  String? q;
  String? length;
  String? time;
  String? date;
  String? uploaded;
  List<String>? also;
  String? rmk;
  String? birdSeen;
  String? playbackUsed;
  String? soundLink;

  MBirdSound({
    this.id,
    this.gen,
    this.sp,
    this.ssp,
    this.en,
    this.rec,
    this.cnt,
    this.loc,
    this.lat,
    this.lng,
    this.alt,
    this.type,
    this.url,
    this.file,
    this.fileName,
    this.imageLinks,
    this.lic,
    this.q,
    this.length,
    this.time,
    this.date,
    this.uploaded,
    this.also,
    this.rmk,
    this.birdSeen,
    this.playbackUsed,
    this.soundLink,
  });

  MBirdSound.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gen = json['gen'];
    sp = json['sp'];
    ssp = json['ssp'];
    en = json['en'];
    rec = json['rec'];
    cnt = json['cnt'];
    loc = json['loc'];
    lat = json['lat'];
    lng = json['lng'];
    alt = json['alt'];
    type = json['type'];
    url = UGetForUrl().encodeLink(json['url']);
    file = UGetForUrl().encodeLink(json['file']);
    fileName = json['file-name'];
    imageLinks = json['sono'] != null
        ? ImageLinks.fromJson(json['sono'])
        : null;
    lic = json['lic'];
    q = json['q'];
    length = json['length'];
    time = json['time'];
    date = json['date'];
    uploaded = json['uploaded'];
    also = json['also'].cast<String>();
    rmk = json['rmk'];
    birdSeen = json['bird-seen'];
    playbackUsed = json['playback-used'];
    soundLink = UGetForUrl().encodeLink(
        "https://xeno-canto.org/sounds/uploaded/${imageLinks!.small!.split("/")[5]}/$fileName");
  }
}

class ImageLinks {
  String? small;
  String? med;
  String? large;
  String? full;

  ImageLinks({this.small, this.med, this.large, this.full});

  ImageLinks.fromJson(Map<String, dynamic> json) {
    small = UGetForUrl().encodeLink(json['small']);
    med = UGetForUrl().encodeLink(json['med']);
    large = UGetForUrl().encodeLink(json['large']);
    full = UGetForUrl().encodeLink(json['full']);
  }
}
