class ProfileImage {
  final int id;
  final int userId;
  final int imageVerifyStatus;
  final String createdOn;
  final String updatedOn;
  final bool isMain;
  final String imageUrl;

  ProfileImage({
    this.id,
    this.userId,
    this.imageVerifyStatus,
    this.createdOn,
    this.updatedOn,
    this.isMain,
    this.imageUrl,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      id: json['id'],
      userId: json['user_id'],
      imageVerifyStatus: json['image_verify_status'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
      isMain: json['is_main'],
      imageUrl: json['image_url'],
    );
  }
}