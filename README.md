# qplay-qml

# install gstreamer
sudo apt-get install gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav

# steps to create qml projecte
To create a .pro file for this QML program in Qt Creator, you can follow these steps:
1. Open Qt Creator and select "New Project" from the welcome screen.
2. In the "New Project" dialog, select "Qt Quick Application" and click "Choose..."
3. In the "Qt Quick Application" dialog, enter a name for your project and choose a location to save it.
4. Select the Qt version and kit you want to use for the project, and click "Next".
5. In the "Choose Qt Quick Component" dialog, select "None" and click "Next".
6. In the "Create Main QML File" dialog, choose a name for your QML file and click "Finish". You can use the name "main.qml" for simplicity.
7. Now you should have a new Qt Quick project with a .qml file in the project explorer. Right-click on the project in the project explorer and choose "Add New..." -> "Qt" -> "Qt Resource File".
8. In the "New Resource File" dialog, enter a name for the .qrc file and click "Finish".

# main.cpp
This is the main function of a Qt application.
First, it sets the organization name, domain, and application name using the QCoreApplication static methods. These values are used to identify the application and its settings.

It creates a QQmlApplicationEngine object to load the main QML file main.qml. The QQmlApplicationEngine is a Qt Quick component that is used to load and execute QML files.

Finally, it loads the main QML file and starts the event loop by calling app.exec(). The event loop is responsible for handling all user interactions and events in the application.

# main.qml
This is a QML file that creates a simple video player application.

It first imports the required QtQuick and QtMultimedia modules, as well as the QtQuick.Dialogs and QtQuick.Window modules for displaying dialogs and creating a top-level window.

The Window element is the top-level item and defines the width, height, and visibility of the application window.

The property element defines a FileDialog object which is used to select a video file to play.

The MediaPlayer element creates a media player object that loads and plays the selected video file.

The VideoOutput element displays the video output from the media player object.

The Rectangle element creates a play/pause button that changes its text and the state of the media player when clicked.

The progressSlider element displays a progress bar that shows the position of the current playback time.

The FileDialog element creates a file dialog box that allows the user to select a video file to play.

The Rectangle element creates a button that opens the file dialog box when clicked.

The MouseArea elements define click and drag areas for the play/pause button and the progress slider.
