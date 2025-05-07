class Game {
  final int id;
  final int type;
  final String name;
  final bool discounted;
  final int discountPercent;
  final int originalPrice;
  final int finalPrice;
  final String currency;
  final String largeCapsuleImage;
  final String smallCapsuleImage;
  final bool windowsAvailable;
  final bool macAvailable;
  final bool linuxAvailable;
  final bool streamingVideoAvailable;
  final String? discountExpiration;
  final String headerImage;
  final String controllerSupport;

  Game({
    required this.id,
    required this.type,
    required this.name,
    required this.discounted,
    required this.discountPercent,
    required this.originalPrice,
    required this.finalPrice,
    required this.currency,
    required this.largeCapsuleImage,
    required this.smallCapsuleImage,
    required this.windowsAvailable,
    required this.macAvailable,
    required this.linuxAvailable,
    required this.streamingVideoAvailable,
    this.discountExpiration,
    required this.headerImage,
    required this.controllerSupport,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: _parseInt(json['id']),
      type: _parseInt(json['type']),
      name: json['name']?.toString() ?? 'Unknown Game',
      discounted: json['discounted'] as bool? ?? false,
      discountPercent: _parseInt(json['discount_percent']),
      originalPrice: _parseInt(json['original_price']),
      finalPrice: _parseInt(json['final_price']),
      currency: json['currency']?.toString() ?? 'USD',
      largeCapsuleImage: json['large_capsule_image']?.toString() ?? '',
      smallCapsuleImage: json['small_capsule_image']?.toString() ?? '',
      windowsAvailable: json['windows_available'] as bool? ?? false,
      macAvailable: json['mac_available'] as bool? ?? false,
      linuxAvailable: json['linux_available'] as bool? ?? false,
      streamingVideoAvailable: json['streamingvideo_available'] as bool? ?? false,
      discountExpiration: json['discount_expiration']?.toString(),
      headerImage: json['header_image']?.toString() ?? '',
      controllerSupport: json['controller_support']?.toString() ?? 'none',
    );
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}