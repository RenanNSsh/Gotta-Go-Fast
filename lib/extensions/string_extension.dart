extension StringExtension on String{
   String get firstLetterToUpperCase {
    if (this != null)
      return this[0].toUpperCase() + this.substring(1);
    else
      return null;
  }

  bool get valueExists{
    return this != null && this.isNotEmpty;
  }
}