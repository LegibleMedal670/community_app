import 'package:flutter/material.dart';
class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final int appBarColor = 0xfffea640;
  bool isSignUp = false; //로그인 or 회원가입인지 확인용
  bool isVisible = true;

  final _globalFormKey = GlobalKey<FormState>();


  String userNickName = ''; //validation에서 사용할 문자들
  String userEmail = '';
  String userPassWord = '';

  void _validation() {
    //validation 실행 함수
    final isValid =
    _globalFormKey.currentState!.validate(); //validate 만족했는지 확인용
    if (isValid) {
      //만족하면 저장
      _globalFormKey.currentState!.save();
    }
  }

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(appBarColor),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: 90.0, left: 20.0),
                child: RichText(
                  text: const TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'LakeCommunity',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), //welcome 텍스트 배치
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: 180.0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                padding: EdgeInsets.all(20.0),
                height: isSignUp ? 280.0 : 250.0,
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.3),
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Column(
                    //각종 텍스트필드 배치용
                    children: [
                      Row(
                        //로그인, 회원가입 텍스트 배치용
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUp = false; //로그인메뉴 선택
                              });
                            },
                            child: Column(
                              //선택된 텍스트필드 제목 아래 밑줄용
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color:
                                    !isSignUp //isSignUp이 false면 앞에컬러 true면 뒤에컬러
                                        ? Color(0xFF09126C)
                                        : Color(0XFFA7BCC7),
                                  ),
                                ),
                                if (!isSignUp) //해당 메뉴 선택시에만 밑줄 보이도록 + 밑에있는 위젯 조건에따라 보여주고 안보여주고 함 inlineif
                                  Container(
                                    margin: EdgeInsets.only(top: 3.0),
                                    height: 2.0,
                                    width: 55,
                                    color: Colors.orangeAccent,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSignUp = true; //회원가입메뉴 선택
                              });
                            },
                            child: Column(
                              //선택된 텍스트필드 제목 아래 밑줄용
                              children: [
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: isSignUp
                                        ? Color(0xFF09126C)
                                        : Color(0XFFA7BCC7),
                                  ),
                                ),
                                if (isSignUp)
                                  Container(
                                    margin: EdgeInsets.only(top: 3.0),
                                    height: 2.0,
                                    width: 55,
                                    color: Colors.orangeAccent,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (isSignUp) //회원가입 중이면 닉네임, 이메일, 비밀번호 텍스트필드 전부 띄워줌
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Form(
                            key: _globalFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  key: ValueKey(1),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type nickname';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userNickName = value!;
                                  },
                                  onChanged: (value) {
                                    userNickName = value;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_circle_sharp,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'User NickName',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: ValueKey(2),
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type Email';
                                    } else if (!value.contains('@')) {
                                      return 'e-mail should contain \'@\'';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'User Email',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  obscureText: isVisible,
                                  key: ValueKey(3),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type password';
                                    } else if (value.length < 6) {
                                      return 'Password must be longer than 6';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassWord = value!;
                                  },
                                  onChanged: (value) {
                                    userPassWord = value;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: toggleVisibility,
                                      icon: Icon(isVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                          color: Color(0XFFA7BCC7)),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'User Password',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!isSignUp) //회원가입 했으면 이메일, 비밀번호 텍스트필드만 띄워줌
                        Container(
                          margin: EdgeInsets.only(top: 20.0),
                          child: Form(
                            key: _globalFormKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  key: ValueKey(4),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type Email';
                                    } else if (!value.contains('@')) {
                                      return 'e-mail should contain \'@\'';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userEmail = value!;
                                  },
                                  onChanged: (value) {
                                    userEmail = value;
                                  },
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'User Email',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                TextFormField(
                                  obscureText: isVisible,
                                  key: ValueKey(5),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please type password';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassWord = value!;
                                  },
                                  onChanged: (value) {
                                    userPassWord = value;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: toggleVisibility,
                                      icon: Icon(
                                          isVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Color(0XFFA7BCC7)),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0XFFA7BCC7),
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    hintText: 'User Password',
                                    hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: Color(0XFFA7BCC7),
                                    ),
                                    contentPadding: EdgeInsets.all(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ), //로그인 / 회원가입 텍스트폼 배치
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeIn,
              top: isSignUp ? 430.0 : 390.0,
              left: 0,
              right: 0,
              child: Center(
                //동그랗게만들어주기위해
                child: Container(
                  //버튼을 입체적으로 만들어주는 뒤 흰색 버튼
                  padding: EdgeInsets.all(10.0),
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: GestureDetector(
                    onTap: () async {
                      if (isSignUp) {
                        //회원가입일 때
                        _validation();
                        try {


                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please check Email or Password'),
                              backgroundColor: Colors.blueAccent,
                            ),
                          );
                        }
                      }
                      if (!isSignUp) {
                        //로그인일 때
                        _validation();
                        try {

                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please check Email or Password'),
                              backgroundColor: Colors.blueAccent,
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.purple, Colors.deepPurpleAccent]),
                          borderRadius: BorderRadius.circular(40.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 3.0,
                              spreadRadius: 3.0,
                              offset: Offset(0, 1),
                            ),
                          ]),
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
            ), //submit버튼
            Positioned(
              top: MediaQuery.of(context).size.height - 125,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: isSignUp ? 'Signup With' : 'Login With',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(155, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Color(0xFFDE4B39),
                    ),
                    icon: Icon(Icons.add),
                    label: Text('Google'),
                  ),
                ],
              ),
            ), //구글계정 회원가입 버튼
          ],
        ),
      ),
    );
  }
}