
TO FOLLOW THIS HOW TO, FIRST COPY THIS .TXT FILE TO ANOTHER PC BEFORE STARTING.





THE STEPS TO SETUP YOUR OPENCANARY:


1: Setup app password for your email.

    gmail reference: https://support.google.com/mail/answer/185833?hl=en
    
    yahoo reference: https://help.yahoo.com/kb/SLN15241.html


2: Plug USB drive into another computer.


3: Open the opencanary.conf file in the Opencanary_Imager directory.


4: Change the "SMTP" portion of the opencanary.conf file. 
    
    a) the fromaddr section should reflect the email you setup an app password for. 
    
    b) the toaddr section should reflect the email you wish to recieve alerts at.
    
    c) the credentials section should reflect the fromaddr email address and the app password for the email address.


5: Plug the USB Drive into USB port on the Raspberry Pi.


6: Run the command.

	~$sudo mount /dev/sda1 /media/


7: Run the command.

	~$sudo sh /media/Opencanary_Imager/setup.sh


8: Run the command.

	~$sudo reboot now


9: Switch to another PC on your network.


10: Enter the ip address of the pi into the web browser. ** This is displayed at the end of the script. **


11: Attempt login & check your email for alert.
