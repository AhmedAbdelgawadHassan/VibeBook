import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/home/presentation/views/book_datails_view.dart';
import 'package:books/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewestbooksListviewItem extends StatelessWidget {
  const NewestbooksListviewItem({super.key, required this.bookModel,});
  final BookModel bookModel;
 


  static const double _cardRadius = 8;
  static const double _coverRadius = 14;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDatailsView(),));
      },
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_cardRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.45),
                blurRadius: 20,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: AppColors.secondaryColor.withValues(alpha: 0.14),
                blurRadius: 24,
                offset: const Offset(0, 6),
                spreadRadius: -4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_cardRadius),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF16161A),
                border: Border.all(
                  color: AppColors.secondaryColor.withValues(alpha: 0.14),
                ),
                borderRadius: BorderRadius.circular(_cardRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
      
                  children: [
                    SizedBox(
                      height: 125,
                      child: AspectRatio(
                        aspectRatio: 2.6 / 4,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_coverRadius),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.5),
                                blurRadius: 14,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageUrl:bookModel.volumeInfo.imageLinks.thumbnail ,fit: BoxFit.fill,),
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
                              fontSize: 18,
                              fontFamily: 'NotoSerif',
                              fontWeight: FontWeight.bold,
                              height: 1.25,
                              color: Colors.white.withValues(alpha: 0.96),
                            ),
                          ),
                          const Gap(6),
                          Text(
                            bookModel.volumeInfo.authors!.join(', '),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
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
                              fontSize: 17,
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
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff9CA3AF),
                                ),
                              ),
      
                            Gap(10)
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
        ),
      
    ));
  }
}
