class ReviewListItemModel {
  String reviewerName;
  int rating;
  String remarks;
  String image;
  String date;

  ReviewListItemModel(
      {required this.reviewerName,
      required this.rating,
      required this.image,
      required this.date,
      required this.remarks});
}
