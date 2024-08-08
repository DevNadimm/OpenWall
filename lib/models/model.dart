class Images {
  Images({
    required this.imageId,
    required this.imagePortraitUrl,
    required this.imageAlt,
  });

  int imageId;
  String imagePortraitUrl;
  String imageAlt;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        imageId: json["id"] as int,
        imagePortraitUrl: json["src"]["portrait"] as String,
        imageAlt: json["alt"] as String,
      );

  Images.emptyConstructor({
    this.imageId = 0,
    this.imagePortraitUrl = '',
    this.imageAlt = '',
  });
}
