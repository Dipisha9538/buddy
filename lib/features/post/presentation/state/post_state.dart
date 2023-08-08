
import '../../../auth/domain/entity/user_entity.dart';
import '../../domain/entity/post_entity.dart';

class PostState {
  final bool isLoading;
  final List<PostEntity> posts;
  final List<UserEntity>? users;
  final String? error;
  final String? imageName;

  PostState({
    this.users,
    required this.isLoading,
    required this.posts,
    this.error,
    this.imageName,
  });

  factory PostState.initial() {
    return PostState(
      isLoading: false,
      posts: [],
      users: [],
      error: null,
      imageName: null,
    );
  }

  PostState copyWith({
    bool? isLoading,
    List<PostEntity>? posts,
    List<UserEntity>? users,
    String? error,
    String? imageName,
  }) {
    return PostState(
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
      users: users ?? this.users,
      error: error ?? this.error,
      imageName: imageName ?? this.imageName,
    );
  }
  
  //to string
  @override
  String toString() {
    return 'PostState(isLoading: $isLoading, posts: $posts, users: $users, error: $error, imageName: $imageName)';
  }
}

