import 'package:flutter/material.dart';
import '/const/import_const.dart';

class ColorFilteredView extends StatelessWidget {
  const ColorFilteredView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Color Filtered', style: Styles.normalTextW700(size: 20)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('colorBurn', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.colorBurn,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('darken', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.darken,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('hardLight', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.hardLight,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('saturation', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.saturation,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('multiply', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.multiply,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('colorDodge', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.colorDodge,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),

            //
            const SizedBox(height: 20),
            Text('difference', style: Styles.bigTextW700()).p(10),
            ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.difference,
              ),
              child: Image.asset('assets/images/avatar1.jpeg'),
            ),
          ],
        ),
      ),
    );
  }
}
