import 'package:flutter/material.dart';
import '/const/import_const.dart';

class Detail1View extends StatelessWidget {
  const Detail1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              titleSpacing: 0,
              expandedHeight: 200,
              backgroundColor: Styles.orange,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                'Detail1',
                style: Styles.normalTextW700(color: Colors.white, size: 22),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://assets.iqonic.design/old-themeforest-images/prokit/images/theme3/t3_ic_dish2.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Cheese roll recipe by John Doe',
                    style: Styles.bigTextW700(),
                  ),
                  const Icon(Icons.favorite, color: Styles.red8)
                ],
              ).pSymmetric(v: 16),
              Text('Share to', style: Styles.normalText()),
              Row(
                children: <Widget>[
                  Image.asset('assets/icons/t1_whatsapp.png', height: 24),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/t1_facebook.png', height: 24),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/t1_instagram.png', height: 24),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/t1_linkedin.png', height: 24),
                ],
              ).pOnly(top: 8, bottom: 16),
              Text('Recipe Steps', style: Styles.normalText()),
              Text(
                '1. Combine the cheese, salt, red chilli flakes and mixed oregano in a bowl.'
                '\n\n 2. Mix very well and make a soft mixture.'
                '\n\n 3. Slightly cut the edges of the bread slices and apply butter on it.'
                '\n\n 4. Put the prepared mixture on half side of the buttery bread and cover with the other side.'
                '\n\n 5. Make a tight roll by applying little amount of cornstarch.'
                '\n\n 6. Bake in preheated oven for about 20 minutes.',
                style: Styles.mediumText(),
              ).pOnly(left: 16, bottom: 30, top: 8),
            ],
          ),
        ),
      ),
    );
  }
}
