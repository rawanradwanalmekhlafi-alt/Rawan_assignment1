import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto', // يمكنك تغييره لـ Cairo إذا أضفت الخط
      ),
      home: const LoginScreen(),
    );
  }
}

// --- شاشة تسجيل الدخول ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade500],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Icon(Icons.lock_person_rounded, size: 80, color: Colors.white),
            const SizedBox(height: 10),
            const Text("مرحباً بك مجدداً", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "البريد الإلكتروني",
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) => (value == null || !value.contains('@')) ? 'أدخل بريد إلكتروني صحيح' : null,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "كلمة المرور",
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                              onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          validator: (value) => (value == null || value.length < 6) ? 'كلمة المرور قصيرة جداً' : null,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                            }
                          },
                          child: const Text("تسجيل الدخول", style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen())),
                          child: const Text("لا تملك حساباً؟ سجل الآن"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// --- شاشة إنشاء حساب جديد ---
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.blue)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("إنشاء حساب", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
              const SizedBox(height: 10),
              const Text("ابدأ رحلتك معنا اليوم!", style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(labelText: "الاسم الكامل", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                validator: (value) => value!.isEmpty ? 'أدخل اسمك' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "كلمة المرور", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                validator: (value) => value!.length < 6 ? 'كلمة المرور ضعيفة' : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "تأكيد كلمة المرور", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                validator: (value) => value != _passController.text ? 'كلمات المرور غير متطابقة' : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                  }
                },
                child: const Text("إنشاء الحساب", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- الشاشة الرئيسية ---
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الرئيسية", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [IconButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())), icon: const Icon(Icons.logout, color: Colors.white))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(20)),
              child: const Row(
                children: [
                  CircleAvatar(radius: 30, child: Icon(Icons.person)),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("أهلاً بك 👋", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("تم تسجيل دخولك بنجاح", style: TextStyle(color: Colors.black54)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemCount: 4,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.category, size: 40, color: Colors.blue.shade900),
                      Text("خدمة ${index + 1}"),
                    ],
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}