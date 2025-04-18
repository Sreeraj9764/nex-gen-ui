import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../assets.dart';
import '../styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final _finalReceiveLightAmt = 0.7; // Add this attribute
  final _finalEmitLightAmt = 0.5;

  @override
  Widget build(BuildContext context) {
    final orbColor = AppColors.orbColors[0]; // Add this final variable
    final emitColor = AppColors.emitColors[0];
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            _LitImage(
              imgSrc: AssetPaths.titleBgBase,
              color: orbColor,
              lightAmt: 0.6,
            ),
            //Image.asset(AssetPaths.titleBgBase),
            _LitImage(
              imgSrc: AssetPaths.titleBgReceive,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgBase,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgReceive,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleMgEmit,
              color: emitColor,
              lightAmt: _finalEmitLightAmt,
            ),
            Image.asset(AssetPaths.titleFgBase),
            _LitImage(
              imgSrc: AssetPaths.titleFgReceive,
              color: orbColor,
              lightAmt: _finalReceiveLightAmt,
            ),
            _LitImage(
              imgSrc: AssetPaths.titleFgEmit,
              color: emitColor,
              lightAmt: _finalEmitLightAmt,
            ),
          ],
        ),
      ),
    );
  }
}

class _LitImage extends StatelessWidget {
  const _LitImage({
    required this.color,
    required this.imgSrc,
    required this.lightAmt,
  });
  final Color color;
  final String imgSrc;
  final double lightAmt;

  @override
  Widget build(BuildContext context) {
    final hsl = HSLColor.fromColor(color);
    return Image.asset(
      imgSrc,
      color: hsl.withLightness(hsl.lightness * lightAmt).toColor(),
      colorBlendMode: BlendMode.modulate,
    );
  }
}
