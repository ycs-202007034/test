import 'package:flutter/material.dart';

import '../utils/Themes.Colors.dart';
import 'Rank.MainPage.dart';

class RankmorePage extends StatelessWidget {
  final int currentExp = 800; // 현재 경험치
  final int maxExp = 1500; // 총 경험치

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // 경험치 비율 계산
    double expRatio = currentExp / maxExp;

    return Scaffold(
      backgroundColor: Theme1Colors.mainColor,
      appBar: AppBar(
        title: Text(
          'ToDoBest', // 플래너 앱 제목을 ToDoBest로 변경
          style: TextStyle(
            fontSize: 26,
            color: Theme1Colors.textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme1Colors.mainColor,
        leading: BackButton(
          color: Theme1Colors.textColor, // 뒤로가기 버튼 색상
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // 알림 기능 추가 가능
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: screenWidth * 0.1,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/profile_placeholder.png'),
                ),
                SizedBox(width: screenWidth * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lv.999',
                          style: TextStyle(
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        // 경험치 바 추가
                        Container(
                          width: screenWidth * 0.6,
                          child: LinearProgressIndicator(
                            value: expRatio, // 0.0부터 1.0까지의 값 (현재 경험치 / 최대 경험치)
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                            minHeight: screenHeight * 0.02,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '$currentExp/$maxExp',
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: screenWidth * 0.04,
                mainAxisSpacing: screenHeight * 0.03,
                children: [
                  TaskButton(
                    label: '일일과제',
                    color: Colors.green.shade200,
                    onPressed: () {
                      // 일일과제 페이지로 이동
                    },
                  ),
                  TaskButton(
                    label: '주간과제',
                    color: Colors.green.shade100,
                    onPressed: () {
                      // 주간과제 페이지로 이동
                    },
                  ),
                  TaskButton(
                    label: '랭킹',
                    color: Colors.yellow.shade100,
                    onPressed: () {
                      // 랭킹 페이지로 이동
                    },
                  ),
                  TaskButton(
                    label: '도전과제',
                    color: Colors.orange.shade100,
                    onPressed: () {
                      // 도전과제 페이지로 이동
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}