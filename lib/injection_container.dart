import 'package:clean_architecure_posts_app/core/network/network_info.dart';
import 'package:clean_architecure_posts_app/features/posts/data/datasources/post_local_data_source.dart';
import 'package:clean_architecure_posts_app/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:clean_architecure_posts_app/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/usescases/add_post.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/usescases/delete_post.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/usescases/get_all_posts.dart';
import 'package:clean_architecure_posts_app/features/posts/domain/usescases/update_post.dart';
import 'package:clean_architecure_posts_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:clean_architecure_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async{
  //Feautres-posts

  //Bloc
  
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
    sl.registerFactory(() => AddDeleteUpdatePostBloc(
        addPost: sl(), deletePost: sl(), updatePost: sl()));

  //UsesCases
  sl.registerLazySingleton(() => GetAllPostsUsercase(sl()));
  sl.registerLazySingleton(() => AddPostUsescases(sl()));
  sl.registerLazySingleton(() => deletePostUsescase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsescases(sl()));



  //Repository
  sl.registerLazySingleton<PostRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(
          () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
          () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  //Core
  
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  final sharedPerferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPerferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}