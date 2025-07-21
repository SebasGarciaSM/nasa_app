class EpicImageUrlBuilder {
  static String buildImageUrl(DateTime date, String imageName) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return 'https://epic.gsfc.nasa.gov/archive/natural/$year/$month/$day/jpg/$imageName.jpg';
  }
}
