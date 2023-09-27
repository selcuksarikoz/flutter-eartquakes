import 'package:evaluate/utils/colors.dart';

class MagColors {
  static HexColor getMagColors(double mag) {
    if (mag < 4) {
      return HexColor("#48A55E");
    } else if (mag < 5) {
      return HexColor("#0252DB");
    } else if (mag < 6) {
      return HexColor("#FFAF36");
    } else if (mag < 7) {
      return HexColor("#EE8F00");
    }

    return HexColor("#FF1F1F");
  }
}
