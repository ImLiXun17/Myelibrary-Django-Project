 ## <center> **How to run E-Library System (An offline Web-based Software for Borrowing Books) in Django** </center> ## 
 ---

 ### **First step:** ###
 Fork the repository in the given link for E-Library or you can Directly get the link for it and.

 ### **Second step:** ###
 Clone the fork repository by copying the link and go to command line and type git clone and paste the link copied ex:
```
git clone (https://)
```

### **Third step:** ###
Make sure you have a localhost server like xampp if none you download here [xampp download](https://www.apachefriends.org/download.html)

### **Fourt step:** ###
After cloning the repository it will become a folder in local machine within specific path it can be in desktop only

### **Fifth step:** ###
Import the elibrarydjango_db sql file in phpmyadmin by doing this open the xampp and click start the apache and MSQL module and go to apache admin. Set your username as localhost only and no password. Now you can create database and make sure that the name of the databse is elibrarydjango_db, after rename and save import the elibrarydjango_db sql file from the folder in desktop

### **sixth step:** ###
Open your visual Studio and open the cloned repository or folder, next click the terminal in menu bar then activate your environmet by typing 
```
.\Scripts\activate
```
### **seventh step:** ###
go to folder myelibrary by typing
```
cd myelibrary
```
### **eighth step:** ###
open the server by typing
```
py manage.py runserver
```
### **ninth step:** ###
click the link http://127.0.0.1:8000/ or copy it to the browser

### **tenth step:** ###
you are now in login features to open other pages just type
username: mau_sean
password: llado_orga

### **Last step:** ###
After login you are now in the full access features where you can able to preview, add, retrieve and delete entities within the database.


 
