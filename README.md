# nikeshop 
A new Flutter project.


1. Clone the Repository:

    -> If the project is hosted on a version control platform like GitHub, GitLab, or Bitbucket, you can use the following command to clone the repository to your local machine:

        git clone <repository_url>

   -> Replace <repository_url> with the actual URL of the repository.


2. Navigate to the Project Directory:

    -> Change your current working directory to the location where you've cloned the project:

        cd <project_directory>

    -> Replace <project_directory> with the name of the directory created when you cloned the repository.


3. Install Dependencies:

    -> Check the README.md file for instructions on how to install project dependencies. You may need to use Flutter's package manager, pub, or another package manager depending on the project.

    -> For Flutter projects, you typically use flutter pub get:

        flutter pub get


4. Create a New Cluster:

   -> In MongoDB Atlas, you need to create a cluster to host your database. Follow the prompts to create a new cluster. You can choose various configurations depending on your needs, and some options may have associated costs.
           

5. Set Up a Database:

   -> Once your cluster is created, you can set up a new database. Follow these steps:

   1. In the left sidebar, click "Database Access" to create a database user with the appropriate permissions.
   2. In the sidebar, select "Network Access" to configure IP Whitelist entries to allow connections to your cluster. You can add your current IP address or set it to allow connections from anywhere (not recommended for production use).

   -> Connect to Your Cluster To obtain the connection URL, follow these steps:

   1. In the Atlas dashboard, click on your cluster to see details.
   2. In the "Cluster Overview" page, click the "Connect" button.
   3. You'll have options to connect via application code or using MongoDB Compass, a graphical user interface for MongoDB.

   -> Get the Connection String (URL):

   1. Choose the "Connect Your Application" option.

   -> You'll see a connection string (URL) provided for connecting to your database. It will look similar to:
   
        mongodb+srv://<username>:<password>@<cluster>.mongodb.net/<database>?retryWrites=true&w=majority

   -> Replace username, password, cluster, and database with the actual credentials and details you've configured in your Atlas cluster.


6. Select Your Device:

   -> In Android Studio, you can select the target device from the top toolbar. Click on the dropdown that shows "Select Device" or a similar label and choose your desired device.

7. Click the Run Button:

   -> In Android Studio, you can find the "Run" button, which is typically represented as a green play button, in the top toolbar. Click on this button to start running your Flutter application on the selected device.
