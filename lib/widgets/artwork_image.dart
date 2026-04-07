import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

const bool _isFlutterTest = bool.fromEnvironment('FLUTTER_TEST');
Future<void> _imageLoadQueue = Future<void>.value();

class ArtworkImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  const ArtworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  State<ArtworkImage> createState() => _ArtworkImageState();
}

class _ArtworkImageState extends State<ArtworkImage> {
  final Completer<void> _slotDone = Completer<void>();
  bool _canStartLoading = false;
  bool _didComplete = false;

  @override
  void initState() {
    super.initState();
    if (_isFlutterTest) {
      _canStartLoading = true;
      return;
    }

    _imageLoadQueue = _imageLoadQueue.then((_) async {
      if (!mounted) {
        _completeSlot();
        return;
      }
      setState(() => _canStartLoading = true);
      await _slotDone.future;
    });
  }

  void _completeSlot() {
    if (_didComplete) return;
    _didComplete = true;
    if (!_slotDone.isCompleted) {
      _slotDone.complete();
    }
  }

  @override
  void dispose() {
    // 避免單張圖片卡住，讓佇列能繼續往下。
    _completeSlot();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrl.startsWith('assets/')) {
      return Image.asset(
        widget.imageUrl,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
        errorBuilder: (context, error, stackTrace) {
          if (kDebugMode) {
            debugPrint('Asset load failed: ${widget.imageUrl}\n$error');
          }
          return Container(
            width: widget.width,
            height: widget.height,
            color: const Color(0xFFE0DDD6),
            alignment: Alignment.center,
            child: const Icon(
              Icons.image_not_supported_outlined,
              size: 22,
              color: Color(0xFF6B6B6B),
            ),
          );
        },
      );
    }
    if (_isFlutterTest) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: const Color(0xFFE0DDD6),
      );
    }
    if (!_canStartLoading) {
      return Container(
        width: widget.width,
        height: widget.height,
        color: const Color(0xFFE0DDD6),
      );
    }
    return Image.network(
      widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded || frame != null) {
          _completeSlot();
        }
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          _completeSlot();
          return child;
        }
        return Container(
          width: widget.width,
          height: widget.height,
          color: const Color(0xFFE0DDD6),
          alignment: Alignment.center,
          child: const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        _completeSlot();
        if (kDebugMode) {
          debugPrint('Image load failed: ${widget.imageUrl}\n$error');
        }
        return Container(
          width: widget.width,
          height: widget.height,
          color: const Color(0xFFE0DDD6),
          alignment: Alignment.center,
          child: const Icon(
            Icons.image_not_supported_outlined,
            size: 22,
            color: Color(0xFF6B6B6B),
          ),
        );
      },
    );
  }
}
