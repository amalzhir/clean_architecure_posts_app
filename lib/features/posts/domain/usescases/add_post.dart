import 'package:clean_architecure_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class AddPostUsescases{
  final PostRepository repository;

  AddPostUsescases( this.repository);

  Future<Either<Failure, Unit>> call(Post post) async{
    return await repository.addPost(post);
  }

}