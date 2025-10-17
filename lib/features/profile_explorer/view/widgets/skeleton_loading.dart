import 'package:flutter/material.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        child: InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(color: Colors.grey[300]),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1.0],
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20,
                            width: 100,
                            color: Colors.white,
                          ),
                          SizedBox(height: 4),
                          Container(height: 16, width: 60, color: Colors.white),
                        ],
                      ),
                    ),
                    Icon(Icons.favorite_border_outlined, size: 20),
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
