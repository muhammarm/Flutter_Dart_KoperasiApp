extension StringCompare on String{
  bool equalsIgnoreCase(String string1) {
    return toLowerCase() == string1.toLowerCase();
  }
}