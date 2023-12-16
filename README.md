# SCA-GUI
Hello and welcome to the SCA GUI! This file will walk you through the steps of how you can recreate this GUI yourself.

1. I used a Google Cloud server for my project. It provided everything necessary for this specific project. Google Cloud allows your to customize port options, create a VM instance, as well as a great interface to customize settings.
   The first thing that I did was create a VM instance on my server. This will allow you to interact directly with the server itself. 
   In this VM instance, I followed the instructions found at  'https://github.com/alihaider1264/SCA', to download the SCA backend directly onto the server. To test if it donwloaded and is working correctly, simply type 'sca' into
   the VM terminal, and then navigate using the 'cd' command to /SCA/SCA/user/output, and then use the 'ls' command to see if there are the output files in this folder.
   I also used Node.js to serve as an endpoint for the server.

2. Configuring your Google Cloud server settings would be the next step. This involves enabling a certain port on your server to be open and ready to listen to requests.

3. The next step would be creating the HTML file for your actual webpage, as well as the Javascript file to hold your functionality for the webpage. This can be done by using the 'nano' command, in the home directory. My files can be found in this repository, 'index.html' and 'app.js'.
   The Javascipt file uses Express and Multer, Express to communicate between the web server and the web page, and Multer was used to handle the file upload/storage onto the server.

4. There are certain permissions that need to be addressed in the server VM instance. The directory '/SCA/SCA/user/source-code/' needs to be given read and write permissions so that the user can upload their own files to 
   this folder, as well as so that the server can use their file in the actual SCA program. 

5. After everything was created, I ran the command 'node app.js', to run the server. You can replace 'app.js' with whatever you named your Javascript file. I then navigated to the external IP address my server has followed by 
   the port number. For example, for mine I typed 'http://34.162.169.186:3000' to access mine, however the IP address and port number will vary depending on your server. 

6. Next came testing, so I created 2 different simple c++ programs, one with a correct for loop and one with a broken for loop that would never run. I uploaded one file, and then checked to see if it prooperly uploaded.  
   I did this by naviagting to '/SCA/SCA/user/source-code', if the file is there, success! If not I made adjustments to my source code. I then ran the SCA command from the webpage, then checked the 'output' directory at '/SCA/SCA/user/output'.
   If there was an html file there with the same name as the file I uploaded, it worked! I then navigated back to my webpage, and clicked the 'Show File' button to open up a new window with that html file. 

7. To upload a new file, I would highly recommend deleting any previous files from the directory, as to not confuse the SCA program. 

8. The final step was to add css to the webpage. You can design yours any way that fits your needs, mine is in this repository as 'webpageStyle.css'. 

9. I perfromed thoroughly tested my webpage, and now the final product is here in the repository. Happy Programming!
