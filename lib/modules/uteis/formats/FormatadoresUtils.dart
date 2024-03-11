class FormatadoresUtils {
  static String formatarData(String data) {
    return '${data.substring(8, 10)}/${data.substring(5, 7)}/${data.substring(0, 4)}';
  }
}
