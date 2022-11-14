import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'pie_chart_controller.dart';

class PieChartView extends StatelessWidget {
  const PieChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Pie Chart', style: Styles.normalTextW700(size: 20)),
      ),
      body: GetBuilder<PieChartController>(
        builder: (c) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 60,
                      borderData: FlBorderData(show: false),
                      pieTouchData:
                          PieTouchData(touchCallback: c.onTouchChart1),
                      sections: [
                        PieChartSectionData(
                          color: Styles.primaryColor,
                          value: 30,
                          title: '30%',
                          radius: (c.touchedIndex1 == 0) ? 60 : 50,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                        ),
                        PieChartSectionData(
                          color: Styles.green3,
                          value: 20,
                          title: '20%',
                          radius: (c.touchedIndex1 == 1) ? 60 : 50,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                        ),
                        PieChartSectionData(
                          color: Styles.purple4,
                          value: 10,
                          title: '10%',
                          radius: (c.touchedIndex1 == 2) ? 60 : 50,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                        ),
                        PieChartSectionData(
                          color: Styles.pink2,
                          value: 40,
                          title: '40%',
                          radius: (c.touchedIndex1 == 3) ? 60 : 50,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                //Pie Chart 2.
                SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 0,
                      borderData: FlBorderData(show: false),
                      pieTouchData:
                          PieTouchData(touchCallback: c.onTouchChart1),
                      sections: [
                        PieChartSectionData(
                          color: Styles.primaryColor,
                          value: 30,
                          title: '30%',
                          radius: (c.touchedIndex1 == 0) ? 120 : 110,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          badgeWidget: _Badge(
                            'assets/icons/ic_11.png',
                            size: (c.touchedIndex1 == 0) ? 55 : 40,
                            borderColor: Styles.primaryColor,
                          ),
                          badgePositionPercentageOffset: .98,
                        ),
                        PieChartSectionData(
                          color: Styles.green3,
                          value: 20,
                          title: '20%',
                          radius: (c.touchedIndex1 == 1) ? 120 : 110,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          badgeWidget: _Badge(
                            'assets/icons/ic_21.png',
                            size: (c.touchedIndex1 == 1) ? 55 : 40,
                            borderColor: Styles.green3,
                          ),
                          badgePositionPercentageOffset: .98,
                        ),
                        PieChartSectionData(
                          color: Styles.purple4,
                          value: 10,
                          title: '10%',
                          radius: (c.touchedIndex1 == 2) ? 120 : 110,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          badgeWidget: _Badge(
                            'assets/icons/ic_19.png',
                            size: (c.touchedIndex1 == 2) ? 55 : 40,
                            borderColor: Styles.purple4,
                          ),
                          badgePositionPercentageOffset: .98,
                        ),
                        PieChartSectionData(
                          color: Styles.pink2,
                          value: 40,
                          title: '40%',
                          radius: (c.touchedIndex1 == 3) ? 120 : 110,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          badgeWidget: _Badge(
                            'assets/icons/ic_18.png',
                            size: (c.touchedIndex1 == 3) ? 55 : 40,
                            borderColor: Styles.pink2,
                          ),
                          badgePositionPercentageOffset: .98,
                        ),
                      ],
                    ),
                  ),
                ),

                //Pie Chart 3.
                SizedBox(
                  height: 220,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 0,
                      borderData: FlBorderData(show: false),
                      startDegreeOffset: 180,
                      pieTouchData:
                          PieTouchData(touchCallback: c.onTouchChart1),
                      sections: [
                        PieChartSectionData(
                          color: Styles.primaryColor,
                          value: 25,
                          title: '30%',
                          radius: 95,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          borderSide: (c.touchedIndex1 == 0)
                              ? const BorderSide(
                                  color: Colors.lightBlueAccent, width: 6)
                              : null,
                        ),
                        PieChartSectionData(
                          color: Styles.green3,
                          value: 25,
                          title: '20%',
                          radius: 90,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          borderSide: (c.touchedIndex1 == 1)
                              ? const BorderSide(
                                  color: Colors.greenAccent, width: 6)
                              : null,
                        ),
                        PieChartSectionData(
                          color: Styles.purple4,
                          value: 25,
                          title: '10%',
                          radius: 85,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          borderSide: (c.touchedIndex1 == 2)
                              ? const BorderSide(
                                  color: Colors.deepPurple, width: 6)
                              : null,
                        ),
                        PieChartSectionData(
                          color: Styles.pink2,
                          value: 25,
                          title: '40%',
                          radius: 100,
                          titleStyle:
                              Styles.mediumTextW700(color: Colors.white),
                          borderSide: (c.touchedIndex1 == 3)
                              ? const BorderSide(color: Colors.pink, width: 6)
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),

                //Note.
                dataPieChart(name: 'Tech', color: Styles.primaryColor),
                dataPieChart(name: 'Food', color: Styles.green3),
                dataPieChart(name: 'Rent', color: Styles.purple4),
                dataPieChart(name: 'Travel', color: Styles.pink2),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget dataPieChart({required Color color, required String name}) {
    return Row(
      children: [
        Container(height: 25, width: 25, color: color),
        const SizedBox(width: 16),
        Text(name, style: Styles.mediumTextW700()),
      ],
    ).pOnly(left: 32, bottom: 16);
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.image, {
    required this.size,
    required this.borderColor,
  });

  final String image;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 2),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
