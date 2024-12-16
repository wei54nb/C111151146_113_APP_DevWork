import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("A1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: currentIndex==0?Image.asset('assets/p1.jpeg', width: 40, height: 40,):Image.asset('assets/p1.jpeg', width: 30, height: 30,), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("A1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("A2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("A3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("A4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='''
  我出生在一個平凡但幸福的家庭，父親曾經在一家工廠擔任車床師傅，二十幾年前因車禍無法方便行動而待在家中。母親是一個早餐店店員，我有兩個姊姊，現在大姊已嫁人成家，二姊在海外求學。從小父母的管教理念是要求我們努力學習，並希望孩子能夠獨立思考。在待人處世上，父母也要求我們為人正直、做事認真。

  成長的過程中，我學會了珍惜家庭的每一份溫暖，並理解到父母對我們的期望和辛勞。雖然家庭經濟並不寬裕，但父母總是設法給予我們最好的教育資源和生活條件。他們的堅韌和不懈努力成為我心中永遠的榜樣。

  在學校裡，我專注於學業，同時積極參與各種校內活動，培養了多方面的能力。我特別喜愛科學與數學，這不僅是因為它們能夠解釋自然界的奧秘，更重要的是它們鍛鍊了我的邏輯思維和問題解決能力。

  高中時期，我進入了台中高工就讀資訊科。這段充滿挑戰但也收穫滿滿的時光讓我學會了獨立和適應不同的環境。離開家鄉在外求學，儘管有時會感到孤單和思念家人，但我堅持不懈地努力學習，並在此期間結交了很多志同道合的朋友，這些經歷豐富了我的人生。

  現在，我在高科大繼續我的大學學業，主修資訊工程。大學生活更加開闊了我的視野，也強化了我的職業技能。我希望未來能持續精進專業能力並將這些經驗化為成為我未來職業生涯的重要基石。

  隨著年齡的增長，我逐漸明確了自己的目標。我希望能夠利用所學的知識和技能，謀取一個穩定的工作，並能夠多花時間陪伴家人。我的家庭一直是我前進的動力源泉，我希望未來能夠通過自己的努力，為家人創造更好的生活條件，並用我的專業知識回饋社會。
  ''';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('Who an I', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),),
          ),
          SizedBox(height: 15,),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/p1.jpeg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/p2.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width:2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('assets/p3.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的學習歷程'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildLearningJourney('國小階段：外埔國小', [
                '學習基礎數學與語文能力',
              ], '在這個階段，我對學習充滿好奇心，參加了各種課外活動，對各個學習內容都有濃厚的興趣。'),
              SizedBox(height: 20),
              buildLearningJourney('國中階段：外埔國中', [
                '提升學科能力',
              ], '國中時期，我開始為之後升學努力學習。'),
              SizedBox(height: 20),
              buildLearningJourney('高中階段：台中高工', [
                '學習專業技術課程',
                '累積實作經驗',
              ], '在高中，我專注於工業技術課程，藉由實作課程增加專業經驗。'),
              SizedBox(height: 20),
              buildLearningJourney('大學階段：高雄科大', [
                '專業知識的深入學習',
                '進行技術開發項目',
              ], '大學期間，我深入學習了我專業的核心知識，豐富了我的專業技能。'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLearningJourney(String title, List<String> goals, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(goals.length, (index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              goals[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}


class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('大學時期回顧'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildYearSection('大一時期', [
                '學好英文',
                '組合語言',
                '人際關係',
              ], [
                '參加英語課程和語言交換活動，提升聽說讀寫能力。',
                '學習C語言和Python。',
                '積極參加社團活動，結交了許多新朋友，拓展了人際網絡。',
              ]),
              SizedBox(height: 20),
              buildYearSection('大二時期', [
                '深入專業課程',
                '學習時間管理',
              ], [
                '深入學習專業課程，掌握更高級的編程技巧。',
                '學習並應用了時間管理技巧，以更有效率地完成學習和工作。',
              ]),
              SizedBox(height: 20),
              buildYearSection('大三時期', [
                '更深入學習專業技能',
              ], [
                '開始製作專題項目',
              ]),
              SizedBox(height: 20),
              Text(
                '其他回顧',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '除了以上提到的目標，我還參加了多項課外社團活動，包括淨灘志工服務，這些都豐富了我的大學生活，提升了我的綜合素質。',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildYearSection(String title, List<String> goals, List<String> descriptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(goals.length, (index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              goals[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              descriptions[index],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            );
          }),
        ),
      ],
    );
  }
}


class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('專業方向'),
      ),
      body: SingleChildScrollView(  // 包裹在 SingleChildScrollView 中，允許滾動
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '我的專業方向',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '作為高雄科大的學生，我專注於工業與技術領域。我的專業方向結合了現代技術與實務經驗，並且致力於開發創新解決方案。以下是我未來專業發展的幾個主要方向：',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildProfessionalDirection('1. 軟體開發', [
              '開發可靠的應用程式，專注於用戶體驗設計與性能優化。',
              '學習並應用最新的程式語言與開發框架，例如 Flutter 和 Python。',
              '持續提升編程能力，參與多個專案並解決實際問題。',
            ]),
            SizedBox(height: 20),
            buildProfessionalDirection('2. 工業自動化與機械學習', [
              '將機械學習應用於工業自動化系統，提升生產效率。',
              '深入學習人工智慧算法，並將其應用於實際生產場景。',
              '參與專案，提升系統的智能化與自動化。',
            ]),
            SizedBox(height: 20),
            buildProfessionalDirection('3. 數位化轉型', [
              '協助企業進行數位化轉型，提升業務效率與創新能力。',
              '學習並實踐雲端運算、大數據分析等前沿技術。',
              '專注於將傳統業務流程數位化並開發適應性的解決方案。',
            ]),
            SizedBox(height: 20),
            Text(
              '我將不斷努力提升專業技能，朝著這些領域或更多方向發展。',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfessionalDirection(String title, List<String> details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(details.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle, size: 20, color: Colors.green),
                  SizedBox(width: 10),
                  Expanded(child: Text(details[index], style: TextStyle(fontSize: 16))),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

