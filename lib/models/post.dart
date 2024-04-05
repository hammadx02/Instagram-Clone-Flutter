import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String username;
  final String uid;
  final String description;
  final String postId;
  final datePublished;
  final String profileImage;
  final String postUrl;
  final likes;

  const Post({
    required this.username,
    required this.uid,
    required this.description,
    required this.postId,
    required this.datePublished,
    required this.profileImage,
    required this.postUrl,
    required this.likes,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'uid': uid,
        'description': description,
        'postId': postId,
        'datePublished': datePublished,
        'profileImage': profileImage,
        'postUrl': postUrl,
        'likes': likes,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      datePublished: snapshot['datePublished'],
      profileImage: snapshot['profileImage'],
      postUrl: snapshot['postUrl'],
      postId: snapshot['postId'],
      likes: snapshot['likes'],
    );
  }
}
