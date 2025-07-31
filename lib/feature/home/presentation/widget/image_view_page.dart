import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.cancel_outlined, color: Colors.black))
        ],
      ),
      body: InteractiveViewer(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: url,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          ),
        ),
      ),
    );
  }
}
