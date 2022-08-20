import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AboutUs extends StatefulWidget {
  AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection("users");

    List<Widget> widgetpages = [
      //index1
      PageOne(),
      //index2
      PageTow(),
      //index2
      PageThree()
    ];
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(10),
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          /// Notes
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/people.png",
              height: 35,
              width: 35,
            ),
            title: const Text("تعريف"),
            selectedColor: Colors.purple,
          ),

          /// Food
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/vision.png",
              height: 35,
              width: 35,
            ),
            title: const Text("الرؤية"),
            selectedColor: Colors.pink,
          ),

          /// Sllep
          SalomonBottomBarItem(
            icon: Image.asset(
              "images/goal.png",
              height: 35,
              width: 35,
            ),
            title: const Text("الأهداف"),
            selectedColor: Color.fromARGB(255, 255, 0, 128),
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("homepage");
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: const Text(
          'من نحن',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
          child: FutureBuilder(
              future: userRef
                  .where("email",
                      isEqualTo: FirebaseAuth.instance.currentUser?.email)
                  .get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            UserAccountsDrawerHeader(
                                currentAccountPicture: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "${snapshot.data.docs[i].data()["ImageUrl"]}",
                                  ),
                                  radius: 150,
                                ),
                                accountName: Text(
                                    "${snapshot.data.docs[i].data()["full-name"]}"),
                                accountEmail: Text(
                                    "${snapshot.data.docs[i].data()["email"]}")),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("profile");
                              },
                              title: const Text(
                                "البيانات الشخصية ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/profile.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("camera");
                              },
                              title: const Text(
                                "الكاميرات",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/camera.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("notes");
                              },
                              title: const Text(
                                "الأكل والنوم",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/boy1.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("requirment");
                              },
                              title: const Text(
                                "المهام",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/requirement.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("family");
                              },
                              title: const Text(
                                "تعليقات الأهل",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/family.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("homework");
                              },
                              title: const Text(
                                "الملاحظات",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/note.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("budget");
                              },
                              title: const Text(
                                "الكشف المالي ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/budget.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed("chat");
                              },
                              title: const Text(
                                "تواصل معنا",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              leading: Image.asset(
                                "images/chat.png",
                                width: 40,
                                height: 40,
                              ),
                            ),
                            ListTile(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context)
                                    .pushReplacementNamed("login");
                              },
                              title: const Text(
                                "تسجيل الخروج",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              leading: const Icon(
                                Icons.logout,
                                size: 40,
                                color: Colors.red,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.facebook,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.whatsapp,
                                  size: 40,
                                )
                              ],
                            )
                          ],
                        );
                      });
                }
                if (snapshot.hasError) {
                  return Text("Error");
                }
                return CircularProgressIndicator();
              })),
      body: widgetpages.elementAt(_currentIndex),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(
                right: 20, left: 20, top: 10, bottom: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "images/logo.png",
                  height: 120,
                  width: 120,
                )),
                const Text(
                  "تأسست حضانة بيبي زون في عام 2017، فهي تحتضن الأطفال وتستقبلهم من عمر شهرين وحتى 4 سنوات من مختلف الخلفيات الثقافية والاجتماعية والاقتصادية،وتضمهم إليها في أسرة واحدة كبيرة، يتعلّم فيها الجميع في جو يسوده المحبّة",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "نسعى في بيبي زون أن يشعر الاطفال بأنهم في بيتهم الأوّل، كي يحقّقوا أقصى إمكاناتهم، في بيئة مُحبّة، راعية. إن حضانة بيبي زون معروفة بجوّها العائلي المليء بالمودّة والمحبة سواء بين العاملين أو الطلبة الذين يعكسون بشخصيّاتهم المميّزة خصال وقيم حضانتنا",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 216, 214, 215)),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "هدفنا الرئيسي هو مصلحة أبنائنا الطلبة، حيث نحرص في بيبي زون على تكثيف جهودنا ومشاركة أولياء الأمور ومعلّماتنا العزيزات، وسائر أفراد فريق عمل الحضانة لخدمة ابنائنا الأعزاء",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "لا شكّ بأن تقديم تعلّم نوعي عالي الجودة أولوية مُطلقة لدينا؛ ويتمثل هدفنا الأكبر في أن ينمو أبناؤنا بطريقة متوازنة، مُتكاملة. تتميّز حضانة بيبي زون عن غيرها في إعطاء مساحة كبيرة للطفل للتعلم من خلال الجمع ما بين اللعب والتعلم الهادف. إضافة إلى تزويد الأطفال بالمهارات اللازمة مثل مهارات المحادثة لمرحلة ما قبل المدرسة. كما أن كادرنا مؤهل ولدينا كفاءات عالية للتعامل مع الأطفال ما قبل عمر المدرسة. لدينا الخبرة أيضا والقدرة على الكشف المبكر عن حالات ذوي الإحتياجات الخاصة ونعمل على توجيههم إلى المؤسسات المختصة",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "إن حضانة بيبي زون مجهزة بالكامل بأحدث الوسائل التكنولوجية والغرف الصفيّة ومزودة بأحدث الوسائل التعليمية وتقع في مكان حيوي بالقرب من الشركات والمؤسسات كي يسهل الوصول إليها. كما أن كافة مرافقها مراقبة بأجهزة الكاميرا الحديثة والتي تمكن أولياء الأمور من الدخول إليها عبر أجهزة الموبايل للإطمئنان على أطفالهم ومتابعتهم.  تتوفر في الحضانة الأدوات الحسية مثل: الصندوق الحسي، الطاولة التفاعلية المضيئة، أكياس الفضاء، والبلاطة الحسيّة التي تعمل بدورها على تحفيز جميع حواس الأطفال الحسية والبصرية والحركية من خلال عمل الأنشطة الترفيهية لتعزيز المفهوم الإدراكي لدى الأطفال. و يوجد ساحات خارجية وداخلية مميّزة بمساحات واسعة لعقد الأنشطة في الحضانة",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "توفر الحضانة وجبات الطعام للأطفال والتي تتضمن وجبتي الفطور والغداء ووجبة الفاكهة اليومية. إلى جانب ذلك، تقدم الحضانة خدمة البرنامج المسائي لما بعد الدوام الرسمي ( ما بعد الساعة الرابعة) كخدمة انتظار",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
        Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 214, 215),
                border: Border.all(
                  width: 2,
                  color: const Color.fromARGB(255, 216, 214, 215),
                ),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "نركز في حضانة بيبي زون على المهارات التالية",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 102, 0, 85),
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "تنمية المهارات الحركية الواسعة",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "تنمية المهارات الحركية الدّقيقة",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.pink[600]),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "تنمية المهارات الحسية (التّعلم عن طريق الحواس)",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "تنمية الثّقة بالنّفس وتقدير الذّات",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.pink[600],
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "تنمية قدرة الطّفل على الضّبط الذّاتي للسلوك",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "تنمية قدرة الطّفل للتعبير عن مشاعره وأحاسيسه",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.pink[600],
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "تنمية الاحترام للذات ولحقوق الآخرين",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "تنمية مهارات اجتماعيّة ايجابيّة مثل التّعاون والتّشارك مع الآخرين",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.pink[600],
                  ),
                  textAlign: TextAlign.right,
                ),
                const Text(
                  "تنمية مهارات اللغة (الاستماع، المحادثة، القراءة والكتابة)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "تنميّة التّفكير الإبداعيّ ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.pink[600],
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            )),
      ],
    );
  }
}

class PageTow extends StatelessWidget {
  const PageTow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 174, 220, 228),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 174, 220, 228),
              ),
              borderRadius: BorderRadius.circular(20)),
          margin:
              const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 2.5),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "رؤيتنا",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 75, 73, 73)),
                textAlign: TextAlign.right,
              ),
              Text(
                "تسعى حضانة بيبي زون إلى بناء بيئة تعليمية وأخلاقية وسلوكية نموذجية بإدارة خبرات عالية وإدراة مؤهلة",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 75, 73, 73)),
                textAlign: TextAlign.center,
              ),
            ],
          )),
      Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 174, 220, 228),
              border: Border.all(
                width: 2,
                color: const Color.fromARGB(255, 174, 220, 228),
              ),
              borderRadius: BorderRadius.circular(20)),
          margin:
              const EdgeInsets.only(right: 20, left: 20, top: 2.5, bottom: 2.5),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "رسالتنا",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 75, 73, 73)),
                textAlign: TextAlign.right,
              ),
              Text(
                "تعمل على توفير بيئةٍ  تعلميَّة و تعليميَّةٍ آمنةٍ وملهمةٍ ومحفّزةٍ على الإبداع وتنشئة الأطفال وفق أعلى المعايير والنظريات التعليمية المتخذة من خلال اللعب والتحفيز كوسيلة للترفيه والمعرفة على نحو يمكِّنه من تفعيل أقصى إمكاناته، من خلال الكشف عن هواياته واستغلال على أمثل وجه",
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 75, 73, 73)),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    ]);
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 199, 235, 241),
            border: Border.all(
              width: 2,
              color: const Color.fromARGB(255, 199, 235, 241),
            ),
            borderRadius: BorderRadius.circular(20)),
        margin:
            const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 2.5),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Center(
              child: Text(
                "أهدافنا",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 75, 73, 73)),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  ":",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 75, 73, 73),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "تنشئة طلبتنا على",
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 75, 73, 73),
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            const Text(
              "تهيئة الطفل نفسياً وإشعاره بالأمن والحنان والإطمئنان",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "تنشئة الطفل تنشئة سليمة في بيئة صحية وإكسابه العادات الضرورية",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "الإهتمام بتطوير لغة الطفل باستخدام الكلمات والجمل الصحيحة",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "غرس القيّم الإسلامية وتجسيد العادات الحميدة وخصالها، وأهمها: المحبَّة والتواضع والصّدق واللطف في التعامل",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "تنمية شخصية من خلال تلبية احتياجاتهم في الاستطلاع والاستكشاف",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "مراقبة التطور والنمو الجسدي الطبيعي للأطفال كل حسب فئته العمرية",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "تقبل ذواتهم وتعلم ضبط مشاعرهم والتعبير عنها بصورةٍ إيجابيّةٍ",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "احترام الاختلاف بكلّ صوره والتّعامل معه بتسامحٍ وإيجابيّةٍ",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "المحافظة على النّظام والممتلكات العامّة والخاصّة والبيئة بكلّ مكوّناتها",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "استثمار وقت الأطفال إيجابيّا بما يلبّي حاجاتهم الروحيَّةِ والبدنيَّة والنَّفسيَّة والاجتماعيَّة",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "توظيف مهارات التعلّم بالاستقصاء والاتّصال والتّواصل والتأمّل والتفكير النقديّ والمهارات الاجتماعيّة واستعمال أحدث وسائل التكنولوجيا",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 219, 15, 158),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
            const Text(
              "إطلاق العنان لقصوى قدراتهم وإمكاناتهم وطاقاتهم الخلاّقة",
              style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 75, 73, 73),
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      )
    ]);
  }
}
