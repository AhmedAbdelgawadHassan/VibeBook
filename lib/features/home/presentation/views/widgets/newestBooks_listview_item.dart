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
    final isDark = Theme.of(context).brightness == Brightness.dark;   // if dark theme is enabled
    final title = bookModel.volumeInfo.title ?? 'Unknown title';
    final authors = bookModel.volumeInfo.authors;
    final authorText = (authors == null || authors.isEmpty)? 'Unknown author' : authors.join(', ');
    final cardColor = isDark ? const Color(0xFF16161A) : Colors.white;
    final cardBorderColor = isDark
        ? AppColors.secondaryColor.withValues(alpha: 0.25)
        : Colors.black.withValues(alpha: 0.10);
    final titleColor = isDark ? Colors.white : Colors.black;
    final metaColor = isDark ? const Color(0xff9CA3AF) : Colors.black54;

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
              child: BookDatailsView(bookModel: bookModel),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: cardColor,
            border: Border.all(width: 1.5, color: cardBorderColor),
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
                      placeholder: (context, url) =>
                          Center(child: const CircularProgressIndicator()),
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
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'NotoSerif',
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        authorText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'manrope',
                          fontWeight: FontWeight.w500,
                          color: metaColor,
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
                            rating: bookModel.volumeInfo.averageRating
                                .toString(),
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
                              color: metaColor,
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
      ),
    );
  }
}
