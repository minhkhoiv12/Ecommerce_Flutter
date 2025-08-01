
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/controllers/vendor_auth_controller.dart';
import 'package:vendor/views/screens/authentication/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // 
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final VendorAuthController _vendorAuthController = VendorAuthController();
  late String email;
  late String password;
  bool isLoading = false;
  loginUser() async {
      setState(() {
        isLoading = true;
      });
      await _vendorAuthController.signInVendor(
        context: context,
        email: email,
        password: password,
      ).whenComplete(() {
        // This will be called when the sign-in process is complete
        // You can navigate to another screen or show a success message here
        _formKey.currentState!.reset(); // Reset the form after successful login
        setState(() {
        isLoading = false;
        });
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha((0.95 * 255).round()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Đăng nhập tài khoản",
                style:GoogleFonts.getFont(
                  'Lato',
                  color: Color(0xFF0d120E),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                  )
                ),
                Text("To Explore the world of Flutter",
                  style: GoogleFonts.getFont(
                    'Lato',
                    color: Color(0xFF0d120E),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                    fontSize: 14,
                  )
                ),
                Image.asset('assets/images/Illustration.png',
                  width: 200,
                  height: 200,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.getFont(
                      'Nunito Sans',
                      color: Color(0xFF0d120E),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value){
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng diền email của bạn';
                    }
                    // Add more validation logic if needed
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: 'Nhập email của bạn',
                    labelStyle: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/icons/email.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value){
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Vui lòng diền mật khẩu của bạn';
                    }
                    // Add more validation logic if needed
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: 'Nhập mật khẩu của bạn',
                    labelStyle: GoogleFonts.getFont(
                      'Nunito Sans',
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/icons/password.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    suffixIcon: Icon(Icons.visibility),
            
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                   if(_formKey.currentState!.validate()){
                    loginUser();
                   }
                  },
                  child: Container(
                    width: 319,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF102DE1),
                          Color(0xCC0D6EFF),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 278,
                          top: 19,
                          child: Opacity(opacity: 0.5, 
                            child: Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xFF103DE5),
                                  width: 12,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            
                            ),
                          ),
                        ),
                        Positioned(
                          left: 260,
                          top: 29,
                          child: Opacity(
                            opacity: 0.5,
                            child: Container(
                              width: 10,
                              height: 10,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 311,
                          top: 36,
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              width: 5,
                              height: 5,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(width: 2),
                                color: Color(0xFF103DE5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            
                          ),
                        ),
                         Positioned(
                          left: 281,
                          top: -10,
                          child: Opacity(
                            opacity: 0.3,
                            child: Container(
                              width: 20,
                              height: 20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Center(child: isLoading? const CircularProgressIndicator(color: Colors.white,): Text("Sign In",
                            style: GoogleFonts.getFont(
                              'Lato',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )
                           ),
                         
                          
                          ),
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Need an account?',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.1,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return RegisterScreen();
                        }));
                      },
                      child: Text('Sign Up',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                          color: Color(0xFF102DE1),
                        ),
                      ),
                    ),
                  ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 