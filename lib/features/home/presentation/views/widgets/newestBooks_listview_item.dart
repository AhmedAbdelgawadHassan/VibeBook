import 'package:books/core/services/service_locator.dart';
import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/home/data/repos/home_repo_impl.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_states.dart';
import 'package:books/features/home/presentation/views/book_datails_view.dart';
import 'package:books/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewestbooksListviewItem extends StatelessWidget {
  const NewestbooksListviewItem({super.key, required this.bookModel});
  final BookModel bookModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => SimilarBooksCubit(
                SimilarBooksInitialState(),
                homeRepo: getIt.get<HomeRepoImpl>(),
              ),
              child: BookDatailsView(bookModel: bookModel)),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF16161A),
          border: Border.all(
            width: 1.5,
            color: AppColors.secondaryColor.withValues(alpha: 0.25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 125,
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Center(
                      child: const CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          
              const Gap(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      bookModel.volumeInfo.authors!.join(', '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'manrope',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff9CA3AF),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Free Book',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    Gap(12),
                    Row(
                      children: [
                        BookRating(
                          rating: bookModel.volumeInfo.averageRating.toString(),
                        ),
                        Spacer(),
                        Text(
                          bookModel.volumeInfo.ratingsCount.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'manrope',
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff9CA3AF),
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
