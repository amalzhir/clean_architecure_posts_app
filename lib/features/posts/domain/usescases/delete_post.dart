import 'package:clean_architecure_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class deletePostUsescase{
  final PostRepository repository;

  deletePostUsescase( this.repository);

  Future<Either<Failure, Unit>> call(int postId) async{
    return await repository.deletePost(postId);
  }
}