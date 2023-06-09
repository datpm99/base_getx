import 'dart:math' as math;
import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
    this.corderRadius = 3,
    this.drawTriangle = true,
    this.drawArc = false,
    this.triangleAxis = Axis.horizontal,
    this.triangleSize = const Size(20, 10),
    this.trianglePos = .7,
    this.contentBackgroundColor = Colors.white,
    this.backgroundColor = Colors.red,
    this.contentPadding = const EdgeInsets.all(0),
    this.backgroundPadding = const EdgeInsets.all(0),
    this.drawDivider = true,
    this.dividerColor = Colors.grey,
    this.dividerStrokeWidth = 2,
    this.drawBorder = true,
    this.borderRadius = 4,
    this.drawShadow = true,
    this.child,
  }) : super(key: key);

  final bool drawTriangle;
  final bool drawArc;

  final Axis triangleAxis;
  final Size triangleSize;
  final double trianglePos;

  final Color contentBackgroundColor;
  final Color backgroundColor;

  final EdgeInsets contentPadding;
  final EdgeInsets backgroundPadding;

  final double corderRadius;

  final bool drawDivider;
  final Color dividerColor;
  final double dividerStrokeWidth;

  final bool drawBorder;
  final double borderRadius;

  final bool drawShadow;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TicketViewPainter(
        corderRadius,
        drawTriangle,
        drawArc,
        triangleAxis,
        triangleSize,
        trianglePos,
        contentBackgroundColor,
        backgroundColor,
        contentPadding,
        backgroundPadding,
        drawDivider,
        dividerColor,
        dividerStrokeWidth,
        drawBorder,
        borderRadius,
        drawShadow,
      ),
      child: Container(
        padding: contentPadding,
        child: ClipPath(
          clipper: TicketViewClipper(
            drawTriangle,
            drawArc,
            triangleAxis,
            triangleSize,
            trianglePos,
            drawDivider,
            borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}

class TicketViewPainter extends CustomPainter {
  final bool drawTriangle;
  final bool drawArc;

  final Axis triangleAxis;
  final Size triangleSize;
  final double trianglePos;

  final Color contentBackgroundColor;
  final Color backgroundColor;

  final EdgeInsets contentPadding;
  final EdgeInsets backgroundPadding;

  final double corderRadius;

  final bool drawDivider;
  final Color dividerColor;
  final double dividerStrokeWidth;

  final bool drawBorder;
  final double borderRadius;

  final bool drawShadow;

  Offset? dashStart, dashEnd;

  TicketViewPainter(
    this.corderRadius,
    this.drawTriangle,
    this.drawArc,
    this.triangleAxis,
    this.triangleSize,
    this.trianglePos,
    this.contentBackgroundColor,
    this.backgroundColor,
    this.contentPadding,
    this.backgroundPadding,
    this.drawDivider,
    this.dividerColor,
    this.dividerStrokeWidth,
    this.drawBorder,
    this.borderRadius,
    this.drawShadow,
  );

  @override
  void paint(Canvas canvas, Size size) {
    //Get Background Rect
    Paint paint = Paint();
    paint.color = backgroundColor;
    paint.style = PaintingStyle.fill;

    RRect backgroundRect = RRect.fromLTRBR(
      0 + backgroundPadding.left,
      0 + backgroundPadding.top,
      size.width - backgroundPadding.right,
      size.height - backgroundPadding.bottom,
      const Radius.circular(4),
    );

    Path backgroundRectPath = Path();

    backgroundRectPath.addPolygon([
      Offset(backgroundRect.left, backgroundRect.top),
      Offset(backgroundRect.right, backgroundRect.top),
      Offset(backgroundRect.right, backgroundRect.bottom),
      Offset(backgroundRect.left, backgroundRect.bottom),
    ], true);

    canvas.drawRRect(backgroundRect, paint);

    //Get foreground Rect
    paint.color = contentBackgroundColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    RRect foregroundRect = RRect.fromLTRBR(
      contentPadding.left,
      contentPadding.top,
      size.width - contentPadding.right,
      size.height - contentPadding.bottom,
      const Radius.circular(6),
    );

    //Clip the triangle or Arc
    Path path = Path();

    path.moveTo(foregroundRect.left, foregroundRect.top);

    if (triangleAxis == Axis.horizontal) {
      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);
      path.lineTo(foregroundRect.right, foregroundRect.bottom);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      path.lineTo(foregroundRect.left, foregroundRect.top);
    } else {
      path.lineTo(foregroundRect.right, foregroundRect.bottom);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      path.lineTo(foregroundRect.left, foregroundRect.top);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);
    }

    if (drawShadow) canvas.drawShadow(path, Colors.grey, 2, true);

    canvas.clipPath(path);

    canvas.drawRRect(foregroundRect, paint);

    if (drawDivider) drawDashedLine(canvas, dashStart!, dashEnd!);
  }

  void _addTrianglePointToPath(RRect size, Path path, Offset start, Offset end,
      double trianglePos, Size triangleSize,
      {bool isTriangle = false, bool isArc = false}) {
    if (start.dy == end.dy) {
      //Draw Horizontal Triangle

      if (end.dx > start.dx) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              start.dx + (size.width * trianglePos) - triangleSize.width / 2,
              start.dy);
          path.arcToPoint(
              Offset(
                  start.dx +
                      (size.width * trianglePos) +
                      triangleSize.width / 2,
                  start.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          _setDashPoints(Offset(start.dx + (size.width * trianglePos),
              start.dy + triangleSize.width / 2));
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            start.dx + (size.width * trianglePos) - triangleSize.width / 2,
            start.dy);
        if (isTriangle) {
          path.lineTo(start.dx + (size.width * trianglePos),
              start.dy + triangleSize.height);
        }
        path.lineTo(
            start.dx + (size.width * trianglePos) + triangleSize.width / 2,
            start.dy);
        path.lineTo(end.dx, end.dy);
        _setDashPoints(Offset(start.dx + (size.width * trianglePos),
            start.dy + triangleSize.height));
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              end.dx + (size.width * trianglePos) + triangleSize.width / 2,
              end.dy);
          path.arcToPoint(
              Offset(
                  end.dx + (size.width * trianglePos) - triangleSize.width / 2,
                  end.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          _setDashPoints(Offset(end.dx + (size.width * trianglePos),
              end.dy - triangleSize.height));
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            end.dx + (size.width * trianglePos) + triangleSize.width / 2,
            end.dy);
        if (isTriangle) {
          path.lineTo(end.dx + (size.width * trianglePos),
              end.dy - triangleSize.height);
        }

        path.lineTo(
            end.dx + (size.width * trianglePos) - triangleSize.width / 2,
            end.dy);
        path.lineTo(end.dx, end.dy);
        _setDashPoints(Offset(
            end.dx + (size.width * trianglePos), end.dy - triangleSize.height));
      }
    } else if (start.dx == end.dx) {
      //Draw Vertical Triangle
      if (end.dy > start.dy) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(start.dx,
              start.dy + (size.height * trianglePos) - triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  start.dx,
                  start.dy +
                      (size.height * trianglePos) +
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          _setDashPoints(Offset(start.dx - triangleSize.height,
              start.dy + (size.height * trianglePos)));
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) - (triangleSize.width / 2));
        if (isTriangle) {
          path.lineTo(start.dx - triangleSize.height,
              start.dy + (size.height * trianglePos));
        }
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) + (triangleSize.width / 2));
        path.lineTo(end.dx, end.dy);

        _setDashPoints(Offset(start.dx - triangleSize.height,
            start.dy + (size.height * trianglePos)));
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(end.dx,
              end.dy + (size.height * trianglePos) + triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  end.dx,
                  end.dy +
                      (size.height * trianglePos) -
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);

          _setDashPoints(Offset(end.dx + triangleSize.height,
              end.dy + (size.height * trianglePos)));

          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) + triangleSize.width / 2);
        if (isTriangle) {
          path.lineTo(end.dx + triangleSize.height,
              end.dy + (size.height * trianglePos));
        }
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) - triangleSize.width / 2);
        path.lineTo(end.dx, end.dy);
        _setDashPoints(Offset(end.dx + triangleSize.height,
            end.dy + (size.height * trianglePos)));
      }
    }
  }

  void _setDashPoints(Offset offset) {
    if (dashStart == null) {
      dashStart = offset;
      return;
    }
    dashEnd = offset;
  }

  void drawDashedLine(Canvas canvas, Offset start, Offset end) {
    Offset a, b;
    if (start.dy == end.dy) {
      a = start.dx < end.dx ? start : end;
      b = start.dx > end.dx ? start : end;
    } else {
      a = start;
      b = end;
    }
    Path path = getDashedPath(a: a, b: b, gap: 4);

    Paint dashLinePaint = Paint();
    dashLinePaint.color = dividerColor;
    dashLinePaint.style = PaintingStyle.stroke;
    dashLinePaint.strokeWidth = dividerStrokeWidth;
    dashLinePaint.strokeCap = StrokeCap.round;

    canvas.drawPath(path, dashLinePaint);
  }

  Path getDashedPath({
    required Offset a,
    required Offset b,
    required gap,
  }) {
    Size size = Size(b.dx - a.dx, b.dy - a.dy);
    Path path = Path();
    path.moveTo(a.dx, a.dy);
    bool shouldDraw = true;
    math.Point currentPoint = math.Point(a.dx, a.dy);

    num radians = math.atan(size.height / size.width);

    num dx = math.cos(radians) * gap < 0
        ? math.cos(radians) * gap * -1
        : math.cos(radians) * gap;

    num dy = math.sin(radians) * gap < 0
        ? math.sin(radians) * gap * -1
        : math.sin(radians) * gap;

    while (currentPoint.x <= b.dx && currentPoint.y <= b.dy) {
      shouldDraw
          ? path.lineTo(currentPoint.x as double, currentPoint.y as double)
          : path.moveTo(currentPoint.x as double, currentPoint.y as double);
      shouldDraw = !shouldDraw;
      currentPoint = math.Point(
        currentPoint.x + dx,
        currentPoint.y + dy,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TicketViewClipper extends CustomClipper<Path> {
  final bool drawTriangle;
  final bool drawArc;

  final Axis triangleAxis;
  final Size triangleSize;
  final double trianglePos;

  final bool drawBorder;
  final double borderRadius;

  TicketViewClipper(
    this.drawTriangle,
    this.drawArc,
    this.triangleAxis,
    this.triangleSize,
    this.trianglePos,
    this.drawBorder,
    this.borderRadius,
  );

  @override
  Path getClip(Size size) {
    Path path = Path();

    Rect foregroundRect = Rect.fromLTRB(0, 0, size.width, size.height);

    path.moveTo(foregroundRect.left, foregroundRect.top);

    if (triangleAxis == Axis.horizontal) {
      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      path.lineTo(foregroundRect.right, foregroundRect.bottom);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);
      path.lineTo(foregroundRect.left, foregroundRect.top);
    } else {
      path.lineTo(foregroundRect.right, foregroundRect.bottom);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.right, foregroundRect.top),
          Offset(foregroundRect.right, foregroundRect.bottom),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);

      path.lineTo(foregroundRect.left, foregroundRect.top);

      _addTrianglePointToPath(
          foregroundRect,
          path,
          Offset(foregroundRect.left, foregroundRect.bottom),
          Offset(foregroundRect.left, foregroundRect.top),
          trianglePos,
          triangleSize,
          isTriangle: drawTriangle,
          isArc: drawArc);
    }

    return path;
  }

  void _addTrianglePointToPath(Rect size, Path path, Offset start, Offset end,
      double trianglePos, Size triangleSize,
      {bool isTriangle = false, bool isArc = false}) {
    if (start.dy == end.dy) {
      //Draw Horizontal Triangle

      if (end.dx > start.dx) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              start.dx + (size.width * trianglePos) - triangleSize.width / 2,
              start.dy);
          path.arcToPoint(
              Offset(
                  start.dx +
                      (size.width * trianglePos) +
                      triangleSize.width / 2,
                  start.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            start.dx + (size.width * trianglePos) - triangleSize.width / 2,
            start.dy);
        if (isTriangle) {
          path.lineTo(start.dx + (size.width * trianglePos),
              start.dy + triangleSize.height);
        }
        path.lineTo(
            start.dx + (size.width * trianglePos) + triangleSize.width / 2,
            start.dy);
        path.lineTo(end.dx, end.dy);
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(
              end.dx + (size.width * trianglePos) + triangleSize.width / 2,
              end.dy);
          path.arcToPoint(
              Offset(
                  end.dx + (size.width * trianglePos) - triangleSize.width / 2,
                  end.dy),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(
            end.dx + (size.width * trianglePos) + triangleSize.width / 2,
            end.dy);
        if (isTriangle) {
          path.lineTo(end.dx + (size.width * trianglePos),
              end.dy - triangleSize.height);
        }

        path.lineTo(
            end.dx + (size.width * trianglePos) - triangleSize.width / 2,
            end.dy);
        path.lineTo(end.dx, end.dy);
      }
    } else if (start.dx == end.dx) {
      //Draw Vertical Triangle
      if (end.dy > start.dy) {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(start.dx,
              start.dy + (size.height * trianglePos) - triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  start.dx,
                  start.dy +
                      (size.height * trianglePos) +
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);
          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) - (triangleSize.width / 2));
        if (isTriangle) {
          path.lineTo(start.dx - triangleSize.height,
              start.dy + (size.height * trianglePos));
        }
        path.lineTo(start.dx,
            start.dy + (size.height * trianglePos) + (triangleSize.width / 2));
        path.lineTo(end.dx, end.dy);
      } else {
        if (isArc) {
          path.lineTo(start.dx, start.dy);
          path.lineTo(end.dx,
              end.dy + (size.height * trianglePos) + triangleSize.width / 2);
          path.arcToPoint(
              Offset(
                  end.dx,
                  end.dy +
                      (size.height * trianglePos) -
                      triangleSize.width / 2),
              radius: Radius.circular(triangleSize.width / 2),
              clockwise: false);
          path.lineTo(end.dx, end.dy);

          return;
        }

        path.lineTo(start.dx, start.dy);
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) + triangleSize.width / 2);
        if (isTriangle) {
          path.lineTo(end.dx + triangleSize.height,
              end.dy + (size.height * trianglePos));
        }
        path.lineTo(end.dx,
            end.dy + (size.height * trianglePos) - triangleSize.width / 2);
        path.lineTo(end.dx, end.dy);
      }
    }
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
