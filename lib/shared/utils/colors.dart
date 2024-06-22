import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors();

  final primaryColor = const Color.fromRGBO(16, 16, 16, 1.0);
  final backgroundColor = const Color.fromRGBO(255, 255, 255, 1.0);
  final secondaryColor = const Color.fromRGBO(242, 122, 71, 1.0);

  //Primary Neutral Palette
  //Dark
  final neutral900_070304 = const Color.fromRGBO(7, 3, 4, 1.0);
  final neutral800_090506 = const Color.fromRGBO(9, 5, 6, 1.0);
  final neutral700_0B0808 = const Color.fromRGBO(11, 8, 8, 1.0);
  final neutral600_0D0B0B = const Color.fromRGBO(13, 11, 11, 1.0);
  final neutral500_101010 = const Color.fromRGBO(16, 16, 16, 1.0);

  //Light
  final neutral400_6F6F6F = const Color.fromRGBO(111, 111, 111, 1.0);
  final neutral300_B7B7B7 = const Color.fromRGBO(183, 183, 183, 1.0);
  final neutral200_E7E7E7 = const Color.fromRGBO(231, 231, 231, 1.0);
  final neutral100_F3F3F3 = const Color.fromRGBO(243, 243, 243, 1.0);
  final neutral0_FFFFFF = const Color.fromRGBO(255, 255, 255, 1.0);

  // Success Palette
  // Dark
  final success900_16671A = const Color.fromRGBO(22, 103, 26, 1.0);
  final success800_2B7D25 = const Color.fromRGBO(43, 125, 37, 1.0);
  final success700_479B36 = const Color.fromRGBO(71, 155, 54, 1.0);
  final success600_66B949 = const Color.fromRGBO(102, 185, 73, 1.0);
  final success500_89D860 = const Color.fromRGBO(137, 216, 96, 1.0);

  // Light
  final success400_7FE2F7 = const Color.fromRGBO(127, 226, 247, 1.0);
  final success300_C9F3A0 = const Color.fromRGBO(201, 243, 160, 1.0);
  final success200_E1FBC1 = const Color.fromRGBO(225, 251, 193, 1.0);
  final success100_F2FDDF = const Color.fromRGBO(242, 253, 223, 1.0);

  // Error Palette
  // Dark
  final error900_7D0D10 = const Color.fromRGBO(125, 13, 16, 1.0);
  final error800_981C19 = const Color.fromRGBO(152, 28, 25, 1.0);
  final error700_BD3325 = const Color.fromRGBO(189, 51, 37, 1.0);
  final error600_E04F33 = const Color.fromRGBO(224, 79, 51, 1.0);
  final error500_FF7144 = const Color.fromRGBO(255, 113, 68, 1.0);

  // Light
  final error400_FF9E71 = const Color.fromRGBO(255, 158, 113, 1.0);
  final error300_FFBA8C = const Color.fromRGBO(255, 186, 140, 1.0);
  final error200_FFD6B3 = const Color.fromRGBO(255, 214, 179, 1.0);
  final error100_FFEDD8 = const Color.fromRGBO(255, 237, 216, 1.0);

  // Warning Palette
  // Dark
  final warning900_736B16 = const Color.fromRGBO(115, 107, 22, 1.0);
  final warning800_8C821D = const Color.fromRGBO(140, 130, 29, 1.0);
  final warning700_AEA227 = const Color.fromRGBO(174, 162, 39, 1.0);
  final warning600_CFC331 = const Color.fromRGBO(207, 195, 49, 1.0);
  final warning500_F1E43A = const Color.fromRGBO(241, 228, 58, 1.0);

  // Light
  final warning400_F7ED59 = const Color.fromRGBO(247, 237, 89, 1.0);
  final warning300_FCF476 = const Color.fromRGBO(252, 244, 118, 1.0);
  final warning200_FEFAA2 = const Color.fromRGBO(254, 250, 162, 1.0);
  final warning100_FFFCD0 = const Color.fromRGBO(255, 252, 208, 1.0);

  // Brand Palette
  // Dark
  final brand900_62740D = const Color.fromRGBO(98, 116, 13, 1.0);
  final brand800_798C16 = const Color.fromRGBO(121, 140, 22, 1.0);
  final brand700_99AE23 = const Color.fromRGBO(153, 174, 35, 1.0);
  final brand600_BAD033 = const Color.fromRGBO(186, 208, 51, 1.0);
  final brand500_DDF247 = const Color.fromRGBO(221, 242, 71, 1.0);

  // Light
  final brand400_E8F774 = const Color.fromRGBO(232, 247, 116, 1.0);
  final brand300_F0FB90 = const Color.fromRGBO(240, 251, 144, 1.0);
  final brand200_F7FDB5 = const Color.fromRGBO(247, 253, 181, 1.0);
  final brand100_FBFEDA = const Color.fromRGBO(251, 254, 218, 1.0);

  // Information Palette
  // Dark
  final info900_003778 = const Color.fromRGBO(0, 55, 120, 1.0);
  final info800_014d90 = const Color.fromRGBO(1, 77, 144, 1.0);
  final info700_006DB4 = const Color.fromRGBO(0, 109, 180, 1.0);
  final info600_0091D8 = const Color.fromRGBO(0, 145, 216, 1.0);
  final info500_00BAFB = const Color.fromRGBO(0, 186, 251, 1.0);

  // Light
  final info400_2CD6FC = const Color.fromRGBO(44, 214, 252, 1.0);
  final info300_5FE7FD = const Color.fromRGBO(95, 231, 253, 1.0);
  final info200_98F5FE = const Color.fromRGBO(152, 245, 254, 1.0);
  final info100_CCFDFE = const Color.fromRGBO(204, 253, 254, 1.0);

  // Secondary Palette
  // Dark
  final secondary900_74100D = const Color.fromRGBO(116, 16, 13, 1.0);
  final secondary800_8C2216 = const Color.fromRGBO(140, 34, 22, 1.0);
  final secondary700_AE3A23 = const Color.fromRGBO(174, 58, 35, 1.0);
  final secondary600_D05833 = const Color.fromRGBO(208, 88, 51, 1.0);
  final secondary500_F27A47 = const Color.fromRGBO(242, 122, 71, 1.0);

  // Light
  final secondary400_F7A474 = const Color.fromRGBO(247, 164, 116, 1.0);
  final secondary300_FBBE90 = const Color.fromRGBO(251, 190, 144, 1.0);
  final secondary200_FDD9B5 = const Color.fromRGBO(253, 217, 181, 1.0);
  final secondary100_FEEEDA = const Color.fromRGBO(254, 238, 218, 1.0);
}
