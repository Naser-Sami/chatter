import 'dart:convert';

class UserModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String image;
  final String token;
  final String aboutMe;
  final String lastSeen;
  final String createdAt;
  final bool isOnline;
  final List<String> friendsUid;
  final List<String> friendRequestsUid;
  final List<String> sentFriendRequestsUid;

  UserModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.image,
    required this.token,
    required this.aboutMe,
    required this.lastSeen,
    required this.createdAt,
    required this.isOnline,
    required this.friendsUid,
    required this.friendRequestsUid,
    required this.sentFriendRequestsUid,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? phoneNumber,
    String? image,
    String? token,
    String? aboutMe,
    String? lastSeen,
    String? createdAt,
    bool? isOnline,
    List<String>? friendsUid,
    List<String>? friendRequestsUid,
    List<String>? sentFriendRequestsUid,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      image: image ?? this.image,
      token: token ?? this.token,
      aboutMe: aboutMe ?? this.aboutMe,
      lastSeen: lastSeen ?? this.lastSeen,
      createdAt: createdAt ?? this.createdAt,
      isOnline: isOnline ?? this.isOnline,
      friendsUid: friendsUid ?? this.friendsUid,
      friendRequestsUid: friendRequestsUid ?? this.friendRequestsUid,
      sentFriendRequestsUid: sentFriendRequestsUid ?? this.sentFriendRequestsUid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'image': image,
      'token': token,
      'aboutMe': aboutMe,
      'lastSeen': lastSeen,
      'createdAt': createdAt,
      'isOnline': isOnline,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      image: map['image'] ?? '',
      token: map['token'] ?? '',
      aboutMe: map['aboutMe'] ?? '',
      lastSeen: map['lastSeen'] ?? '',
      createdAt: map['createdAt'] ?? '',
      isOnline: map['isOnline'] ?? false,
      friendsUid: List<String>.from(map['friendsUid']),
      friendRequestsUid: List<String>.from(map['friendRequestsUid']),
      sentFriendRequestsUid: List<String>.from(map['sentFriendRequestsUid']),
    );
  }

  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, phoneNumber: $phoneNumber, image: $image, token: $token, aboutMe: $aboutMe, lastSeen: $lastSeen, createdAt: $createdAt, isOnline: $isOnline, friendsUid: $friendsUid, friendRequestsUid: $friendRequestsUid, sentFriendRequestsUid: $sentFriendRequestsUid)';
  }
}
