import 'package:books/core/functions/download_book.dart';
import 'package:books/core/functions/launch_url.dart';
import 'package:books/core/utils/app_colors.dart';
import 'package:books/features/home/data/models/book_model/book_model.dart';
import 'package:books/features/home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:books/features/home/presentation/views/widgets/book_detailed_card.dart';
import 'package:books/features/home/presentation/views/widgets/book_details_info.dart';
import 'package:books/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:books/features/home/presentation/views/widgets/download_book_button.dart';
import 'package:books/features/home/presentation/views/widgets/freeReadind_button.dart';
import 'package:books/features/home/presentation/views/widgets/similarBooks_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDatailsView extends StatefulWidget {
  const BookDatailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<BookDatailsView> createState() => _BookDatailsViewState();
}

class _BookDatailsViewState extends State<BookDatailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(
      context,
    ).fetchSimilarBooks(category: widget.bookModel.volumeInfo.categories![0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'VibeBook',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'manrope',
            fontWeight: FontWeight.w800,
            color: AppColors.secondaryColor,
          ),
        ),
        actions: [
          Icon(
            FontAwesomeIcons.solidCircleUser.data,
            color: AppColors.secondaryColor,
          ),
          Gap(12),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(20),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CustomBookImage(
                      bookImage:
                          widget.bookModel.volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                  Gap(15),
                  Text(
                    widget.bookModel.volumeInfo.title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'NotoSerif',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(7),
                  Text(
                    'By ${widget.bookModel.volumeInfo.authors!.join(', ')}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Gap(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          BookDetailedCard(
                            title: 'Price',
                            value: 'Free Book',
                            titleColor: Colors.red,
                          ),
                          Gap(10),
                          BookDetailedCard(
                            title: 'Raters',
                            value:
                                '${widget.bookModel.volumeInfo.ratingsCount.toString()}',
                            titleColor: Colors.green,
                          ),
                        ],
                      ),
                      Gap(10),
                      Column(
                        children: [
                          BookDetailedCard(
                            title: 'Rating',
                            value:
                                '⭐ ${widget.bookModel.volumeInfo.averageRating.toString()}',
                            titleColor: Colors.yellow,
                          ),
                          Gap(10),
                          BookDetailedCard(
                            title: 'pages',
                            value:
                                '${widget.bookModel.volumeInfo.pageCount.toString()}',
                            titleColor: Colors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(25),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Text(
                    widget.bookModel.volumeInfo.description!,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      wordSpacing: -3,
                      fontFamily: 'manrope',
                      fontWeight: FontWeight.w400,
                      color: Color(0xffD6D3D1),
                    ),
                  ),
                  Gap(30),
                  BookDatailsInfo(bookModel: widget.bookModel),
                  Gap(40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: FreereadindButton(
                              onpressed: () async {
                                openUrl(
                                  urlLink:
                                      widget.bookModel.volumeInfo.infoLink!,
                                  context: context,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Free reading is coming soon.....',
                                      style: TextStyle(
                                        fontFamily: 'NotoSerif',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Gap(10),
                          DownloadBookButton(
                            onPressed: () async {
                              final link = widget.bookModel.volumeInfo.previewLink;
                              if (link != null) {
                                await downloadBook(link,widget.bookModel.volumeInfo.title!, );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('No download link available'),
                                  ),
                                );
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Download is coming soon.....',
                                    style: TextStyle(
                                      fontFamily: 'NotoSerif',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You may also like',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'NotoSerif',
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Gap(20),
                  AspectRatio(aspectRatio: 2.1, child: SimilarbooksListview()),
                  Gap(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
