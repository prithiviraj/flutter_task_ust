Assignment Project
A Assignment project created in flutter using Cubit and Dio. Assignment supports both android and iOS, clone the appropriate branches mentioned below:

For Mobile: https://github.com/prithiviraj/flutter_task_ust (stable channel)

Getting Assignment
This Assignment project repository code is preloaded with some basic components like basic app architecture, constants and required dependencies to create a new project. By using boiler plate code as standard initializer, we can have same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

How to Use

Step 1:

Download or clone this repo by using the link below:

https://github.com/prithiviraj/flutter_task_ust.git

Step 2:

Go to project root and execute the following command in console to get the required dependencies:

flutter pub get 

Step 3:

This project uses inject library that works with code generation, execute the following command to generate files:

flutter packages pub run build_runner build --delete-conflicting-outputs
or watch command in order to keep the source code synced automatically:

Assignment Features:
Splash
Widgets
Dio
Cubit (State Management) with MVVM
Json Serialization
Folder Structure

Here is the core folder structure which flutter provides.

flutter-app/
|- android
|- build
|- ios
|- lib
|- test

Here is the folder structure we have been using in this project

lib/
|- constant/
|- common_widgets/
|- apiClient/
|- extensions/
|- features/
|- utils/
|- main.dart

Now, lets dive into the lib folder which has the main code for the application.

1- constant - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `colors`, `asset images`, `api endpoints` and `strings`.

2- common_widgets - Contains the common widgets for your applications. For example, Carousel, Button, TextField etc

3- apiClient - Application to connect the reactive data from API. 

4- extensions - Override any widgets and use where ever needs For example hexa color.

4- features all the ui of your project, contains sub directory for each screen and also having the data for respective screens.

5- util — Contains the utilities/common functions of your application.

6- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, title, orientation etc.
Constants
This directory contains all the application level constants. A separate file is created for each type as shown in example below:

Utils
Contains the common file(s) and utilities used in a project. The folder structure is as follows:

constant/
|- constants.dart
|- strings.dart

UI
This directory contains all the ui of your application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in widgets directory as shown in the example below:

feature/
| - module/
    |- UI

Data
All the business logic of your application will go into this directory, it represents the data layer of your application. It is sub-divided into three directories local, network and shared_perf, each containing the domain specific logic. Since each layer exists independently, that makes it easier to unit test. The communication between UI and data layer is handled by using central repository.

feature/
| - module/
    |- data
    |- repository.dart