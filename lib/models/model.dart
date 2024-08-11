class Images {
  Images({
    required this.imageId,
    required this.imagePortraitUrl,
    required this.imageOriginalUrl,
    required this.imageAlt,
  });

  int imageId;
  String imagePortraitUrl;
  String imageOriginalUrl;
  String imageAlt;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageId: json["id"] as int,
        imagePortraitUrl: json["src"]["portrait"] as String,
        imageOriginalUrl: json["src"]["original"] as String,
        imageAlt: json["alt"] as String,
      );

  Images.emptyConstructor({
    this.imageId = 0,
    this.imagePortraitUrl = '',
    this.imageOriginalUrl = '',
    this.imageAlt = '',
  });
}
