class Profile {
  final int id;
  final String lastName;
  final String firstName;
  final String bio;
  final String createdOn;
  final String updatedOn;
  final int accountId;
  final String imageData;

  Profile({
    this.id,
    this.lastName,
    this.firstName,
    this.bio,
    this.createdOn,
    this.updatedOn,
    this.accountId,
    this.imageData,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      lastName: json['last_name'],
      firstName: json['first_name'],
      bio: json['bio'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
      accountId: json['account_id'],
      imageData: json['image_data'],
    );
  }
}