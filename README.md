# eta-android
This is a simple demo of android application for eta language

To build this application, you should be install the andriod-studio 3.0 beta1 on your computer.

The Haskell source code should be compiled by eta 0.0.9b1, you can select the java compiler which is builtin android-studio 3.0.

Build Step:
  1. Clone this project from https://github.com/flyfish30/eta-android.git.

  2. Change dir to root dir of project eta-android, and change dir to eta.

  3. Run the shell script build.sh.

  4. Copy the eta/dist/build/HSeta-example-0.1.0.0-HrOuwq44Z3H6wRCp1l6g38.jar to app/libs dir, and then rename this file to eta-example.jar.

  5. Change dir to root dir of this project, then run shell script setup-eta-libs.sh.

  6. Launch the android studio, and then open the project eta-andriod, build it and install it to your mobile phone.
  
