import 'package:clean_architecure_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/post.dart';

class GetAllPostsUsercase{
  final PostRepository repository;

  GetAllPostsUsercase( this.repository);
  Future<Either<Failure , List <Post>>> call() async{
    return await repository.getAllPosts();
}

}