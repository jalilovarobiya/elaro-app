import 'package:cached_network_image/cached_network_image.dart';
import 'package:elaro_app/core/widgets/shimmer_box.dart';
import 'package:elaro_app/feature/home/presentation/blocs/brends/bloc/brends_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Brends extends StatelessWidget {
  const Brends({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BlocBuilder<BrendsBloc, BrendsState>(
        builder: (context, state) {
          return state.when(
            loading:
                () => ListView.builder(
                  itemCount: 5,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return ShimmerBox();
                  },
                ),
            success:
                (data) => ListView.builder(
                  clipBehavior: Clip.none,

                  itemCount: data.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ZoomTapAnimation(
                      child: Container(
                        width: 100,
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: CachedNetworkImage(
                          imageUrl: data.data?[index].image ?? "",
                          fit: BoxFit.fitHeight,
                          height: 40,
                        ),
                      ),
                    );
                  },
                ),
            failure: (failure) => SizedBox(),
          );
        },
      ),
    );
  }
}
