import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatefulWidget {
  final List<Movie> movies;
  final String? label;
  final String? caption;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview(
      {super.key,
      required this.movies,
      this.label,
      this.caption,
      this.loadNextPage});

  @override
  State<MovieHorizontalListview> createState() =>
      _MovieHorizontalListviewState();
}

class _MovieHorizontalListviewState extends State<MovieHorizontalListview> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {

        widget.loadNextPage!(); //forzamos pq sabemos que ya existe...
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.label != null || widget.caption != null)
            _Title(title: widget.label, subtitle: widget.caption),

          const SizedBox(height: 5),
          Expanded(
              //Cuando uso un listview builder en vez de un listview?
              //Cuando la cantidad de elementos es conocida y es poca, se utiliza listview.
              //Si es desconocida y es grande, se utiliza builder. De esta forma, no quedan guardadas en memoria.
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: widget.movies.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FadeInRight(child: _Slide(movie: widget.movies[index]));
                  }))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    final IconData ratingIcon = movie.voteAverage < 6
        ? Icons.star_border_outlined
        : movie.voteAverage > 6 && movie.voteAverage < 7.5
            ? Icons.star_half_outlined
            : Icons.star;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //*Images
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          //*Title

          SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                style: textStyles.titleSmall,
              )),

          //*Rating

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(
                  ratingIcon,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(width: 3),
                Text(
                  movie.voteAverage.toStringAsFixed(2),
                  style: textStyles.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade800),
                ),
                const SizedBox(width: 10),
                Spacer(),
                Text(HumanFormats.number(movie.popularity),
                    style: textStyles.bodySmall)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            )
        ],
      ),
    );
  }
}
