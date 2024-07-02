enum PresetDevice {
  /// iPhone (classic) - Apple iPhone 2007
  classicIphone('classic-iphone'),

  /// Android (classic) - T-Mobile G1 2008
  classicAndroid('classic-android'),

  /// vPhone
  vphone('vphone'),

  /// vPhone (small)
  vphoneSmall('vphone-small'),

  /// vPhone (large)
  vphoneLarge('vphone-large'),

  /// rotom
  rotom('rotom'),

  /* 2022 */

  iphone14('iphone-14'),
  iphoneSE3('iphone-se-3rd'),
  galaxyS22('galaxy-s22');

  /* 2023 */

  // iphone15,
  // galaxyS23,

  const PresetDevice(this.id);
  final String id;
}
