import 'package:flutter/material.dart';

class RankmorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('플래너 앱'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                // 프로필 이미지
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.grey,
                  // 사용자의 프로필 사진을 네트워크에서 불러오려면 NetworkImage 사용
                  backgroundImage: AssetImage('assets/profile_placeholder.png'),
                ),
                SizedBox(width: 16),
                // 사용자 이름, 한 줄 소개, 레벨 표시
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '홍길동',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '한 마디: 갓생살자',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          'Lv.999',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          // 너비 조정하여 오버플로우 방지
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  width: 130, // 예시로 130/150 경험치
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '1300/1500',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            // 네 개의 버튼
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RankingPage()),
                      );
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

// 과제 버튼 위젯
class TaskButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  TaskButton({required this.label, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: Size(double.infinity, 100),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

// RankingPage를 정의합니다.
class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('랭킹 페이지'),
      ),
      body: Center(
        child: Text(
          '여기에 랭킹 내용을 표시합니다.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
