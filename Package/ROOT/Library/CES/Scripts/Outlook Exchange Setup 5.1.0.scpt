FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

--------------------------------------------
Outlook Exchange Setup 5.0
� Copyright 2008-2015 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/3.0/

This file is one of four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.0.scpt
2. OutlookExchangeSetupLaunchAgent.sh
3. net.talkingmoose.OutlookExchangeSetupLaunchAgent.plist
4. com.microsoft.Outlook.plist for creating a configuraiton profile

These scripts and files may be freely modified for personal or commercial
purposes but may not be republished for profit without prior consent.

If you find these resources useful or have ideas for improving them,
please let me know. It is only compatible with Outlook 2016 for Mac.

--------------------------------------------

This script assists a user with the setup of his Exchange account
information. Below are basic instructions for using the script.
Consult the Outlook Exchange Setup 5.0 Administrator's Guide
for complete details.

1.	Customize the "network and  server properties" below with information
	appropriate to your network.
	
2.	Deploy this script to a location on your Macs such as
	"/Library/CompanyName/OutlookExchangeSetup5.0.scpt".

3. 	Deploy the recommended "Outlook preferences.mobileconfig"
	configuration profile to eliminate Outlook's startup windows.
	This assumes you're using the volume license edition
	of Office 2016 for Mac.
	
4.	Deploy the OutlookExchangeSetup5.0.plist file to
	/Library/LaunchAgents. Update the path to point to the
	OutlookExchangeSetup5.0.scpt script.
	  
This script assumes the user's full name is in the form of "Last, First",
but is easily modified if the full name is in the form of "First Last".
It works especially well if the Mac is bound to Active Directory where
the user's short name will match his login name. Optionally, you cans set dscl
to pull the user's EMailAddress from a directory service.

     � 	 	� 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 O u t l o o k   E x c h a n g e   S e t u p   5 . 0 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 5   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 3 . 0 / 
 
 T h i s   f i l e   i s   o n e   o f   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 0 . s c p t 
 2 .   O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . s h 
 3 .   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t 
 4 .   c o m . m i c r o s o f t . O u t l o o k . p l i s t   f o r   c r e a t i n g   a   c o n f i g u r a i t o n   p r o f i l e 
 
 T h e s e   s c r i p t s   a n d   f i l e s   m a y   b e   f r e e l y   m o d i f i e d   f o r   p e r s o n a l   o r   c o m m e r c i a l 
 p u r p o s e s   b u t   m a y   n o t   b e   r e p u b l i s h e d   f o r   p r o f i t   w i t h o u t   p r i o r   c o n s e n t . 
 
 I f   y o u   f i n d   t h e s e   r e s o u r c e s   u s e f u l   o r   h a v e   i d e a s   f o r   i m p r o v i n g   t h e m , 
 p l e a s e   l e t   m e   k n o w .   I t   i s   o n l y   c o m p a t i b l e   w i t h   O u t l o o k   2 0 1 6   f o r   M a c . 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
 T h i s   s c r i p t   a s s i s t s   a   u s e r   w i t h   t h e   s e t u p   o f   h i s   E x c h a n g e   a c c o u n t 
 i n f o r m a t i o n .   B e l o w   a r e   b a s i c   i n s t r u c t i o n s   f o r   u s i n g   t h e   s c r i p t . 
 C o n s u l t   t h e   O u t l o o k   E x c h a n g e   S e t u p   5 . 0   A d m i n i s t r a t o r ' s   G u i d e 
 f o r   c o m p l e t e   d e t a i l s . 
 
 1 . 	 C u s t o m i z e   t h e   " n e t w o r k   a n d     s e r v e r   p r o p e r t i e s "   b e l o w   w i t h   i n f o r m a t i o n 
 	 a p p r o p r i a t e   t o   y o u r   n e t w o r k . 
 	 
 2 . 	 D e p l o y   t h i s   s c r i p t   t o   a   l o c a t i o n   o n   y o u r   M a c s   s u c h   a s 
 	 " / L i b r a r y / C o m p a n y N a m e / O u t l o o k E x c h a n g e S e t u p 5 . 0 . s c p t " . 
 
 3 .   	 D e p l o y   t h e   r e c o m m e n d e d   " O u t l o o k   p r e f e r e n c e s . m o b i l e c o n f i g " 
 	 c o n f i g u r a t i o n   p r o f i l e   t o   e l i m i n a t e   O u t l o o k ' s   s t a r t u p   w i n d o w s . 
 	 T h i s   a s s u m e s   y o u ' r e   u s i n g   t h e   v o l u m e   l i c e n s e   e d i t i o n 
 	 o f   O f f i c e   2 0 1 6   f o r   M a c . 
 	 
 4 . 	 D e p l o y   t h e   O u t l o o k E x c h a n g e S e t u p 5 . 0 . p l i s t   f i l e   t o 
 	 / L i b r a r y / L a u n c h A g e n t s .   U p d a t e   t h e   p a t h   t o   p o i n t   t o   t h e 
 	 O u t l o o k E x c h a n g e S e t u p 5 . 0 . s c p t   s c r i p t . 
 	     
 T h i s   s c r i p t   a s s u m e s   t h e   u s e r ' s   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " L a s t ,   F i r s t " , 
 b u t   i s   e a s i l y   m o d i f i e d   i f   t h e   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " F i r s t   L a s t " . 
 I t   w o r k s   e s p e c i a l l y   w e l l   i f   t h e   M a c   i s   b o u n d   t o   A c t i v e   D i r e c t o r y   w h e r e 
 t h e   u s e r ' s   s h o r t   n a m e   w i l l   m a t c h   h i s   l o g i n   n a m e .   O p t i o n a l l y ,   y o u   c a n s   s e t   d s c l 
 t o   p u l l   t h e   u s e r ' s   E M a i l A d d r e s s   f r o m   a   d i r e c t o r y   s e r v i c e . 
 
   
  
 l     ��������  ��  ��        l     ��  ��   ys 5.1 Customized script for Comcast. Added domain check for non-domain joined Macs and/or non-network login local account short names. Added additonal display option for emailFormat. Additional option will prompt user for login, first and last names, domain and email address if the Mac is using a local account and is not joined to the domain. 2015-11-27 by Sergio Aviles     �  �   5 . 1   C u s t o m i z e d   s c r i p t   f o r   C o m c a s t .   A d d e d   d o m a i n   c h e c k   f o r   n o n - d o m a i n   j o i n e d   M a c s   a n d / o r   n o n - n e t w o r k   l o g i n   l o c a l   a c c o u n t   s h o r t   n a m e s .   A d d e d   a d d i t o n a l   d i s p l a y   o p t i o n   f o r   e m a i l F o r m a t .   A d d i t i o n a l   o p t i o n   w i l l   p r o m p t   u s e r   f o r   l o g i n ,   f i r s t   a n d   l a s t   n a m e s ,   d o m a i n   a n d   e m a i l   a d d r e s s   i f   t h e   M a c   i s   u s i n g   a   l o c a l   a c c o u n t   a n d   i s   n o t   j o i n e d   t o   t h e   d o m a i n .   2 0 1 5 - 1 1 - 2 7   b y   S e r g i o   A v i l e s      l     ��  ��    � � 5.1.1 Fixed issue with script not populating Outlook with initial run. Fixed by quitting Outlook and relaunching it after a second or two. 2015-12-07 by Tyler Morgan     �  L   5 . 1 . 1   F i x e d   i s s u e   w i t h   s c r i p t   n o t   p o p u l a t i n g   O u t l o o k   w i t h   i n i t i a l   r u n .   F i x e d   b y   q u i t t i n g   O u t l o o k   a n d   r e l a u n c h i n g   i t   a f t e r   a   s e c o n d   o r   t w o .   2 0 1 5 - 1 2 - 0 7   b y   T y l e r   M o r g a n      l     ��  ��    � � 5.1.2 Added line to remove LaunchAgent from /Library/LaunchAgents/ to fix issue with script running multiple times on the same account. 2016-02-15 by Sergio Aviles and Tyler Morgan     �  j   5 . 1 . 2   A d d e d   l i n e   t o   r e m o v e   L a u n c h A g e n t   f r o m   / L i b r a r y / L a u n c h A g e n t s /   t o   f i x   i s s u e   w i t h   s c r i p t   r u n n i n g   m u l t i p l e   t i m e s   o n   t h e   s a m e   a c c o u n t .   2 0 1 6 - 0 2 - 1 5   b y   S e r g i o   A v i l e s   a n d   T y l e r   M o r g a n      l     ��  ��    Z T 5.2 Merged updates from original talkingmoose project. 2016-02-15 by Sergio Aviles      �   �   5 . 2   M e r g e d   u p d a t e s   f r o m   o r i g i n a l   t a l k i n g m o o s e   p r o j e c t .   2 0 1 6 - 0 2 - 1 5   b y   S e r g i o   A v i l e s       !   l     ��������  ��  ��   !  " # " l     ��������  ��  ��   #  $ % $ l     ��������  ��  ��   %  & ' & l     �� ( )��   ( 0 *------------------------------------------    ) � * * T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '  + , + l     �� - .��   - , & Begin network, server and preferences    . � / / L   B e g i n   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s ,  0 1 0 l     �� 2 3��   2 0 *------------------------------------------    3 � 4 4 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 1  5 6 5 l     ��������  ��  ��   6  7 8 7 l     ��������  ��  ��   8  9 : 9 l     �� ; <��   ; C =------------- Exchange Server settings ----------------------    < � = = z - - - - - - - - - - - - -   E x c h a n g e   S e r v e r   s e t t i n g s   - - - - - - - - - - - - - - - - - - - - - - :  > ? > l     ��������  ��  ��   ?  @ A @ j     �� B�� 0 usekerberos useKerberos B m     ��
�� boovfals A  C D C l     �� E F��   E B < Set this to true only if Macs in your environment are bound    F � G G x   S e t   t h i s   t o   t r u e   o n l y   i f   M a c s   i n   y o u r   e n v i r o n m e n t   a r e   b o u n d D  H I H l     �� J K��   J C = to Active Directory and your network is properly configured.    K � L L z   t o   A c t i v e   D i r e c t o r y   a n d   y o u r   n e t w o r k   i s   p r o p e r l y   c o n f i g u r e d . I  M N M l     ��������  ��  ��   N  O P O j    �� Q��  0 exchangeserver ExchangeServer Q m     R R � S S & w e b m a i l . c o m c a s t . c o m P  T U T l     �� V W��   V 6 0 Address of your organization's Exchange server.    W � X X `   A d d r e s s   o f   y o u r   o r g a n i z a t i o n ' s   E x c h a n g e   s e r v e r . U  Y Z Y l     ��������  ��  ��   Z  [ \ [ j    �� ]�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL ] m    ��
�� boovtrue \  ^ _ ^ l     �� ` a��   `   True for most servers.    a � b b .   T r u e   f o r   m o s t   s e r v e r s . _  c d c l     ��������  ��  ��   d  e f e j   	 �� g�� .0 exchangeserversslport ExchangeServerSSLPort g m   	 
����� f  h i h l     �� j k��   j @ : If ExchangeServerRequiresSSL is true set the port to 443.    k � l l t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . i  m n m l     �� o p��   o @ : If ExchangeServerRequiresSSL is false set the port to 80.    p � q q t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . n  r s r l     �� t u��   t L F Use a different port number only if your administrator instructs you.    u � v v �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   a d m i n i s t r a t o r   i n s t r u c t s   y o u . s  w x w l     ��������  ��  ��   x  y z y j    �� {�� "0 directoryserver DirectoryServer { m     | | � } } 0 a d a p p s . c a b l e . c o m c a s t . c o m z  ~  ~ l     �� � ���   � Z T Address of an internal Global Catalog server (a type of Windows domain controller).    � � � � �   A d d r e s s   o f   a n   i n t e r n a l   G l o b a l   C a t a l o g   s e r v e r   ( a   t y p e   o f   W i n d o w s   d o m a i n   c o n t r o l l e r ) .   � � � l     �� � ���   � L F The LDAP server in a Windows network will be a Global Catalog server,    � � � � �   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r , �  � � � l     �� � ���   � 2 , which is separate from the Exchange Server.    � � � � X   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication � m    ��
�� boovfals �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 directoryserverrequiresssl DirectoryServerRequiresSSL � m    ��
�� boovfals �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 00 directoryserversslport DirectoryServerSSLPort � m    ����� �  � � � l     �� � ���   � B < If DirectoryServerRequiresSSL is true set the port to 3269.    � � � � x   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � C = If DirectoryServerRequiresSSL is false set the port to 3268.    � � � � z   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � U O Use a different port number only if your Exchange administrator instructs you.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   E x c h a n g e   a d m i n i s t r a t o r   i n s t r u c t s   y o u . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� >0 directoryservermaximumresults DirectoryServerMaximumResults � m    ����� �  � � � l     �� � ���   � G A When searching the Global Catalog server, this number determines    � � � � �   W h e n   s e a r c h i n g   t h e   G l o b a l   C a t a l o g   s e r v e r ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 60 directoryserversearchbase DirectoryServerSearchBase � m     � � � � �   �  � � � l     �� � ���   � + % example: "cn=users,dc=domain,dc=com"    � � � � J   e x a m p l e :   " c n = u s e r s , d c = d o m a i n , d c = c o m " �  � � � l     �� � ���   �   Usually, this is empty.    � � � � 0   U s u a l l y ,   t h i s   i s   e m p t y . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >------------- For Active Directory users ---------------------    � � � � | - - - - - - - - - - - - -   F o r   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j     �� ��� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory � m    ��
�� boovtrue �  � � � l     �� � ���   � B < If Macs are bound to Active Directory they can probably use    � � � � x   I f   M a c s   a r e   b o u n d   t o   A c t i v e   D i r e c t o r y   t h e y   c a n   p r o b a b l y   u s e �  � � � l     �� � ���   � Q K dscl to return the current user's email address, phone number, title, etc.    � � � � �   d s c l   t o   r e t u r n   t h e   c u r r e n t   u s e r ' s   e m a i l   a d d r e s s ,   p h o n e   n u m b e r ,   t i t l e ,   e t c . �  � � � l     �� � ���   � O I Use Active Directory when possible, otherwise complete the next section.    � � � � �   U s e   A c t i v e   D i r e c t o r y   w h e n   p o s s i b l e ,   o t h e r w i s e   c o m p l e t e   t h e   n e x t   s e c t i o n . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B <------------- For non Active Directory users ---------------    � � � � x - - - - - - - - - - - - -   F o r   n o n   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j   ! %�� ��� 0 usershortname userShortName � m   ! $   �   �  j   & *���� 0 userfullname userFullName m   & ) �    j   + /��	�� 0 emailaddress emailAddress	 m   + .

 �    l     ����   ! Leave these variables blank    � 6 L e a v e   t h e s e   v a r i a b l e s   b l a n k  l     ��������  ��  ��    j   0 4���� 0 
domainname 
domainName m   0 3 �    l     ����   P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .  l     � �   L F The part of your organization's email address following the @ symbol.     �!! �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l . "#" l     �~�}�|�~  �}  �|  # $%$ j   5 9�{&�{ 0 emailformat emailFormat& m   5 8�z�z % '(' l     �y)*�y  ) P J Complete this only if not using Active Directory to get user information.   * �++ �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .( ,-, l     �x./�x  . P J When Active Directory is unavailable to determine a user's email address,   / �00 �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s ,- 121 l     �w34�w  3 V P this script will attempt to parse it from the display name of the user's login.   4 �55 �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .2 676 l     �v�u�t�v  �u  �t  7 898 l     �s:;�s  : 1 + Describe your organization's email format:   ; �<< V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :9 =>= l     �r?@�r  ? / ) 1: Email format is first.last@domain.com   @ �AA R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m> BCB l     �qDE�q  D * $ 2: Email format is first@domain.com   E �FF H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o mC GHG l     �pIJ�p  I N H 3: Email format is flast@domain.com (first name initial plus last name)   J �KK �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e )H LML l     �oNO�o  N . ( 4: Email format is shortName@domain.com   O �PP P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o mM QRQ l     �nST�n  S / ) 5: Email format is first_last@domain.com   T �UU R   5 :   E m a i l   f o r m a t   i s   f i r s t _ l a s t @ d o m a i n . c o mR VWV l     �m�l�k�m  �l  �k  W XYX j   : >�jZ�j 0 displayname displayNameZ m   : ;�i�i Y [\[ l     �h]^�h  ] P J Complete this only if not using Active Directory to get user information.   ^ �__ �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .\ `a` l     �gbc�g  b M G Describe how the user's display name appears at the bottom of the menu   c �dd �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n ua efe l     �fgh�f  g R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   h �ii �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .f jkj l     �elm�e  l / ) 1: Display name appears as "Last, First"   m �nn R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "k opo l     �dqr�d  q . ( 2: Display name appears as "First Last"   r �ss P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "p tut l     �c�b�a�c  �b  �a  u vwv j   ? E�`x�` 0 domainprefix domainPrefixx m   ? Byy �zz  w {|{ l     �_}~�_  } N H Append a NetBIOS domain name to the beginning of the user's short name.   ~ � �   A p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .| ��� l     �^���^  � 9 3 Be sure to use two backslashes when adding a name.   � ��� f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .� ��� l     �]���]  � N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   � ��� �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .� ��� l     �\�[�Z�\  �[  �Z  � ��� l     �Y�X�W�Y  �X  �W  � ��� l     �V���V  � C =------------- User Experience -------------------------------   � ��� z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �U�T�S�U  �T  �S  � ��� j   F J�R��R (0 verifyemailaddress verifyEMailAddress� m   F G�Q
�Q boovtrue� ��� l     �P���P  � M G If set to "true", a dialog asks the user to confirm his email address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .� ��� l     �O�N�M�O  �N  �M  � ��� j   K O�L��L *0 verifyserveraddress verifyServerAddress� m   K L�K
�K boovfals� ��� l     �J���J  � W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   � ��� �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �I�H�G�I  �H  �G  � ��� j   P T�F��F *0 displaydomainprefix displayDomainPrefix� m   P Q�E
�E boovtrue� ��� l     �D���D  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " .� ��� l     �C���C  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �B�A�@�B  �A  �@  � ��� j   U Y�?��? *0 downloadheadersonly downloadHeadersOnly� m   U V�>
�> boovfals� ��� l     �=���=  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �<���<  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �;���;  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �:�9�8�:  �9  �8  � ��� j   Z ^�7��7 20 hideonmycomputerfolders hideOnMyComputerFolders� m   Z [�6
�6 boovfals� ��� l     �5���5  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �4���4  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �3�2�1�3  �2  �1  � ��� j   _ c�0��0 0 unifiedinbox unifiedInbox� m   _ `�/
�/ boovfals� ��� l     �.���.  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �-���-  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �,�+�*�,  �+  �*  � ��� j   d h�)��) *0 disableautodiscover disableAutodiscover� m   d e�(
�( boovfals� ��� l     �'���'  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �&���&  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �%���%  � C = that may connect to an internal Exchange server addresss and   � ��� z   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s s   a n d� ��� l     �$���$  � ? 9 connect to a different external Exchange server address.   � �   r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .�  l     �#�"�!�#  �"  �!    j   i o� �  0 errormessage errorMessage m   i l � � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   L o c a l   I T   o r   v i s i t   t h e   T e c h   B a r   f o r   a s s i s t a n c e . 	 l     �
�  
 T N Customize this error message for your users in case their account setup fails    � �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s	  l     ����  �  �    l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ��   * $ End network, server and preferences    � H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s  l     ��   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����  �  �    !  l     �"#�  " 0 *------------------------------------------   # �$$ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -! %&% l     �'(�  '   Begin Domain Check   ( �)) &   B e g i n   D o m a i n   C h e c k& *+* l     �,-�  , 0 *------------------------------------------   - �.. T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -+ /0/ l     ����  �  �  0 121 l    3��3 r     454 l    6��6 I    �7�

� .sysoexecTEXT���     TEXT7 m     88 �99 z d s c o n f i g a d   - s h o w   |   a w k   ' / A c t i v e   D i r e c t o r y   F o r e s t /   { p r i n t   $ 5 } '�
  �  �  5 o      �	�	 0 domainjoined domainJoined�  �  2 :;: l   <��< r    =>= l   ?��? I   �@�
� .sysoexecTEXT���     TEXT@ m    	AA �BB p d s c l   .   r e a d   / U s e r s / $ U S E R   O r i g i n a l A u t h e n t i c a t i o n A u t h o r i t y�  �  �  > o      �� 0 networkuser networkUser�  �  ; CDC l   )E�� E Z   )FG����F G    HIH =   JKJ o    ���� 0 domainjoined domainJoinedK m    LL �MM  I =   NON o    ���� 0 networkuser networkUserO m    PP �QQ  G r    %RSR m    ��
�� boovfalsS o      ���� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  �  �   D TUT l     ��������  ��  ��  U VWV l     ��XY��  X 0 *------------------------------------------   Y �ZZ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -W [\[ l     ��]^��  ]   End Domain Check   ^ �__ "   E n d   D o m a i n   C h e c k\ `a` l     ��bc��  b 0 *------------------------------------------   c �dd T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -a efe l     ��������  ��  ��  f ghg l     ��ij��  i 0 *------------------------------------------   j �kk T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -h lml l     ��no��  n ( " Begin collecting user information   o �pp D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o nm qrq l     ��st��  s 0 *------------------------------------------   t �uu T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -r vwv l     ��������  ��  ��  w xyx l     ��z{��  z R L attempt to read information from Active Directory for the Me Contact record   { �|| �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r dy }~} l     ��������  ��  ��  ~ � l  * -������ r   * -��� m   * +�� ���  � o      ���� 0 userfirstname userFirstName��  ��  � ��� l  . 1������ r   . 1��� m   . /�� ���  � o      ���� 0 userlastname userLastName��  ��  � ��� l  2 5������ r   2 5��� m   2 3�� ���  � o      ����  0 userdepartment userDepartment��  ��  � ��� l  6 9������ r   6 9��� m   6 7�� ���  � o      ���� 0 
useroffice 
userOffice��  ��  � ��� l  : A������ r   : A��� m   : =�� ���  � o      ���� 0 usercompany userCompany��  ��  � ��� l  B I������ r   B I��� m   B E�� ���  � o      ���� 0 userworkphone userWorkPhone��  ��  � ��� l  J Q������ r   J Q��� m   J M�� ���  � o      ���� 0 
usermobile 
userMobile��  ��  � ��� l  R Y������ r   R Y��� m   R U�� ���  � o      ���� 0 userfax userFax��  ��  � ��� l  Z a������ r   Z a��� m   Z ]�� ���  � o      ���� 0 	usertitle 	userTitle��  ��  � ��� l  b i������ r   b i��� m   b e�� ���  � o      ���� 0 
userstreet 
userStreet��  ��  � ��� l  j q������ r   j q��� m   j m�� ���  � o      ���� 0 usercity userCity��  ��  � ��� l  r y������ r   r y��� m   r u�� ���  � o      ���� 0 	userstate 	userState��  ��  � ��� l  z ������� r   z ���� m   z }�� ���  � o      ����  0 userpostalcode userPostalCode��  ��  � ��� l  � ������� r   � ���� m   � ��� ���  � o      ���� 0 usercountry userCountry��  ��  � ��� l  � ������� r   � ���� m   � ��� ���  � o      ���� 0 userwebpage userWebPage��  ��  � ��� l     ��������  ��  ��  � ��� l  �������� Z   ������� =  � ���� o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m   � ���
�� boovtrue� k   �	��� ��� l  � ���������  ��  ��  � ��� l  � �������  � + % Get information from Active Directoy   � ��� J   G e t   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o y� ��� l  � ���������  ��  ��  � ��� l  � ���� ��  � 3 - get the domain's primary NetBIOS domain name     � Z   g e t   t h e   d o m a i n ' s   p r i m a r y   N e t B I O S   d o m a i n   n a m e�  l  � ���������  ��  ��    Q   � k   � �		 

 r   � � I  � �����
�� .sysoexecTEXT���     TEXT m   � � � � / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y / "   - r e a d   /   S u b N o d e s   |   a w k   ' B E G I N   { F S = " :   " }   { p r i n t   $ 2 } '��   o      ���� 0 netbiosdomain netbiosDomain �� Z   � ��� =  � � o   � ����� *0 displaydomainprefix displayDomainPrefix m   � ���
�� boovtrue r   � � b   � � o   � ����� 0 netbiosdomain netbiosDomain m   � � �  \ o      ���� 0 domainprefix domainPrefix��   r   � � m   � � �     o      ���� 0 domainprefix domainPrefix��   R      ������
�� .ascrerr ****      � ****��  ��   k   �!! "#" l  � ���������  ��  ��  # $%$ l  � ���&'��  &   something went wrong   ' �(( *   s o m e t h i n g   w e n t   w r o n g% )*) l  � ���������  ��  ��  * +,+ I  �	��-.
�� .sysodlogaskr        TEXT- b   � �/0/ b   � �121 b   � �343 o   � ����� 0 errormessage errorMessage4 o   � ���
�� 
ret 2 o   � ���
�� 
ret 0 m   � �55 �66 � U n a b l e   t o   d e t e r m i n e   N E T B I O S   d o m a i n   n a m e .   T h i s   c o m p u t e r   m a y   n o t   b e   b o u n d   t o   A c t i v e   D i r e c t o r y .. ��78
�� 
disp7 m   � ���
�� stic    8 ��9:
�� 
btns9 J   � �;; <��< m   � �== �>>  O K��  : ��?@
�� 
dflt? J   � �AA B��B m   � �CC �DD  O K��  @ ��E��
�� 
apprE m   FF �GG , O u t l o o k   E x c h a n g e   S e t u p��  , H��H R  
����I
�� .ascrerr ****      � ****��  I ��J��
�� 
errnJ m  ��������  ��   KLK l �������  ��  �  L MNM l �~OP�~  O 7 1 read full user information from Active Directory   P �QQ b   r e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r yN RSR l �}�|�{�}  �|  �{  S TUT Q  VWXV k  9YY Z[Z r  %\]\ J  ^^ _�z_ m  `` �aa  :  �z  ] n     bcb 1   $�y
�y 
txdlc 1   �x
�x 
ascr[ d�wd r  &9efe I &5�vg�u
�v .sysoexecTEXT���     TEXTg b  &1hih b  &-jkj m  &)ll �mm B / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y /k o  ),�t�t 0 netbiosdomain netbiosDomaini m  -0nn �oo� / A l l   D o m a i n s / "   - r e a d   / U s e r s / $ U S E R   A u t h e n t i c a t i o n A u t h o r i t y   C i t y   c o   c o m p a n y   d e p a r t m e n t   p h y s i c a l D e l i v e r y O f f i c e N a m e   s A M A c c o u n t N a m e   w W W H o m e P a g e   E M a i l A d d r e s s   F A X N u m b e r   F i r s t N a m e   J o b T i t l e   L a s t N a m e   M o b i l e N u m b e r   P h o n e N u m b e r   P o s t a l C o d e   R e a l N a m e   S t a t e   S t r e e t�u  f o      �s�s "0 userinformation userInformation�w  W R      �r�q�p
�r .ascrerr ****      � ****�q  �p  X k  App qrq l AA�o�n�m�o  �n  �m  r sts l AA�luv�l  u   something went wrong   v �ww *   s o m e t h i n g   w e n t   w r o n gt xyx l AA�k�j�i�k  �j  �i  y z{z I At�h|}
�h .sysodlogaskr        TEXT| b  AR~~ b  AN��� b  AJ��� o  AF�g�g 0 errormessage errorMessage� o  FI�f
�f 
ret � o  JM�e
�e 
ret  m  NQ�� ��� n U n a b l e   t o   r e a d   u s e r   i n f o r m a t i o n   f r o m   n e t w o r k   d i r e c t o r y .} �d��
�d 
disp� m  UX�c
�c stic    � �b��
�b 
btns� J  [`�� ��a� m  [^�� ���  O K�a  � �`��
�` 
dflt� J  ch�� ��_� m  cf�� ���  O K�_  � �^��]
�^ 
appr� m  kn�� ��� , O u t l o o k   E x c h a n g e   S e t u p�]  { ��\� R  u�[�Z�
�[ .ascrerr ****      � ****�Z  � �Y��X
�Y 
errn� m  y|�W�W���X  �\  U ��� l ���V�U�T�V  �U  �T  � ��� Y  ����S���R� k  ���� ��� l ���Q�P�O�Q  �P  �O  � ��� r  ����� J  ���� ��N� m  ���� ���  :  �N  � n     ��� 1  ���M
�M 
txdl� 1  ���L
�L 
ascr� ��� Z  � ���K�J� C ����� n  ����� 4  ���I�
�I 
cpar� o  ���H�H 0 i  � o  ���G�G "0 userinformation userInformation� m  ���� ���  E M a i l A d d r e s s :� Q  ������ r  ����� n  ����� 4  ���F�
�F 
citm� m  ���E�E � n  ����� 4  ���D�
�D 
cpar� o  ���C�C 0 i  � o  ���B�B "0 userinformation userInformation� o      �A�A 0 emailaddress emailAddress� R      �@�?�>
�@ .ascrerr ****      � ****�?  �>  � k  ���� ��� r  ����� J  ���� ��=� m  ���� ���  �=  � n     ��� 1  ���<
�< 
txdl� 1  ���;
�; 
ascr� ��:� r  ����� c  ����� n  ����� 7���9��
�9 
cha � m  ���8�8 �  ;  ��� n  ����� 4  ���7�
�7 
cpar� l ����6�5� [  ����� o  ���4�4 0 i  � m  ���3�3 �6  �5  � o  ���2�2 "0 userinformation userInformation� m  ���1
�1 
TEXT� o      �0�0 0 emailaddress emailAddress�:  �K  �J  � ��� l �/�.�-�/  �.  �-  � ��� r  ��� J  �� ��,� m  �� ���  :  �,  � n     ��� 1  	�+
�+ 
txdl� 1  	�*
�* 
ascr� ��� Z  i���)�(� C ��� n  ��� 4  �'�
�' 
cpar� o  �&�& 0 i  � o  �%�% "0 userinformation userInformation� m  �� ��� ( d s A t t r T y p e N a t i v e : c o :� Q  e���� r  !2��� n  !.��� 4  ).�$�
�$ 
citm� m  ,-�#�# � n  !)��� 4  $)�"�
�" 
cpar� o  '(�!�! 0 i  � o  !$� �  "0 userinformation userInformation� o      �� 0 usercountry userCountry� R      ���
� .ascrerr ****      � ****�  �  � k  :e    r  :G J  :? � m  := �  �   n     	
	 1  BF�
� 
txdl
 1  ?B�
� 
ascr � r  He c  Ha n  H] 7R]�
� 
cha  m  XZ��   ;  [\ n  HR 4  KR�
� 
cpar l NQ�� [  NQ o  NO�� 0 i   m  OP�� �  �   o  HK�� "0 userinformation userInformation m  ]`�
� 
TEXT o      �� 0 usercountry userCountry�  �)  �(  �  l jj����  �  �    r  jw J  jo   !�
! m  jm"" �##  :  �
   n     $%$ 1  rv�	
�	 
txdl% 1  or�
� 
ascr &'& Z  x�()��( C x�*+* n  x�,-, 4  {��.
� 
cpar. o  ~�� 0 i  - o  x{�� "0 userinformation userInformation+ m  ��// �00 2 d s A t t r T y p e N a t i v e : c o m p a n y :) Q  ��1231 r  ��454 n  ��676 4  ���8
� 
citm8 m  ���� 7 n  ��9:9 4  ��� ;
�  
cpar; o  ������ 0 i  : o  ������ "0 userinformation userInformation5 o      ���� 0 usercompany userCompany2 R      ������
�� .ascrerr ****      � ****��  ��  3 k  ��<< =>= r  ��?@? J  ��AA B��B m  ��CC �DD  ��  @ n     EFE 1  ����
�� 
txdlF 1  ����
�� 
ascr> G��G r  ��HIH c  ��JKJ n  ��LML 7����NO
�� 
cha N m  ������ O  ;  ��M n  ��PQP 4  ����R
�� 
cparR l ��S����S [  ��TUT o  ������ 0 i  U m  ������ ��  ��  Q o  ������ "0 userinformation userInformationK m  ����
�� 
TEXTI o      ���� 0 usercompany userCompany��  �  �  ' VWV l ����������  ��  ��  W XYX r  ��Z[Z J  ��\\ ]��] m  ��^^ �__  :  ��  [ n     `a` 1  ����
�� 
txdla 1  ����
�� 
ascrY bcb Z  �7de����d C ��fgf n  ��hih 4  ����j
�� 
cparj o  ������ 0 i  i o  ������ "0 userinformation userInformationg m  ��kk �ll 8 d s A t t r T y p e N a t i v e : d e p a r t m e n t :e Q  �3mnom r  �pqp n  � rsr 4  � ��t
�� 
citmt m  ������ s n  ��uvu 4  ����w
�� 
cparw o  ������ 0 i  v o  ������ "0 userinformation userInformationq o      ����  0 userdepartment userDepartmentn R      ������
�� .ascrerr ****      � ****��  ��  o k  
3xx yzy r  
{|{ J  
}} ~��~ m  
 ���  ��  | n     ��� 1  ��
�� 
txdl� 1  ��
�� 
ascrz ���� r  3��� c  1��� n  -��� 7"-����
�� 
cha � m  (*���� �  ;  +,� n  "��� 4  "���
�� 
cpar� l !������ [  !��� o  ���� 0 i  � m   ���� ��  ��  � o  ���� "0 userinformation userInformation� m  -0��
�� 
TEXT� o      ����  0 userdepartment userDepartment��  ��  ��  c ��� l 88��������  ��  ��  � ��� r  8E��� J  8=�� ���� m  8;�� ���  :  ��  � n     ��� 1  @D��
�� 
txdl� 1  =@��
�� 
ascr� ��� Z  F�������� C FR��� n  FN��� 4  IN���
�� 
cpar� o  LM���� 0 i  � o  FI���� "0 userinformation userInformation� m  NQ�� ��� X d s A t t r T y p e N a t i v e : p h y s i c a l D e l i v e r y O f f i c e N a m e :� Q  U����� r  Xg��� n  Xe��� 4  `e���
�� 
citm� m  cd���� � n  X`��� 4  [`���
�� 
cpar� o  ^_���� 0 i  � o  X[���� "0 userinformation userInformation� o      ���� 0 
useroffice 
userOffice� R      ������
�� .ascrerr ****      � ****��  ��  � k  o��� ��� r  o|��� J  ot�� ���� m  or�� ���  ��  � n     ��� 1  w{��
�� 
txdl� 1  tw��
�� 
ascr� ���� r  }���� c  }���� n  }���� 7������
�� 
cha � m  ������ �  ;  ��� n  }���� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  }����� "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 
useroffice 
userOffice��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �	������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ��� @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e :� Q  ����� r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 usershortname userShortName� R      ������
�� .ascrerr ****      � ****��  ��  � k  ��� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ���� c  ����� n  ��   7����
�� 
cha  m  ������   ;  �� n  �� 4  ����
�� 
cpar l ������ [  ��	 o  ������ 0 i  	 m  ������ ��  ��   o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 usershortname userShortName��  ��  ��  � 

 l 

��������  ��  ��    r  
 J  
 �� m  
 �  :  ��   n      1  ��
�� 
txdl 1  ��
�� 
ascr  Z  r��~ C $ n    4   �}
�} 
cpar o  �|�| 0 i   o  �{�{ "0 userinformation userInformation m   # �   : d s A t t r T y p e N a t i v e : w W W H o m e P a g e : Q  'n!"#! r  *;$%$ n  *7&'& 4  27�z(
�z 
citm( m  56�y�y ' n  *2)*) 4  -2�x+
�x 
cpar+ o  01�w�w 0 i  * o  *-�v�v "0 userinformation userInformation% o      �u�u 0 userwebpage userWebPage" R      �t�s�r
�t .ascrerr ****      � ****�s  �r  # k  Cn,, -.- r  CP/0/ J  CH11 2�q2 m  CF33 �44  �q  0 n     565 1  KO�p
�p 
txdl6 1  HK�o
�o 
ascr. 7�n7 r  Qn898 c  Qj:;: n  Qf<=< 7[f�m>?
�m 
cha > m  ac�l�l ?  ;  de= n  Q[@A@ 4  T[�kB
�k 
cparB l WZC�j�iC [  WZDED o  WX�h�h 0 i  E m  XY�g�g �j  �i  A o  QT�f�f "0 userinformation userInformation; m  fi�e
�e 
TEXT9 o      �d�d 0 userwebpage userWebPage�n  �  �~   FGF l ss�c�b�a�c  �b  �a  G HIH r  s�JKJ J  sxLL M�`M m  svNN �OO  :  �`  K n     PQP 1  {�_
�_ 
txdlQ 1  x{�^
�^ 
ascrI RSR Z  ��TU�]�\T C ��VWV n  ��XYX 4  ���[Z
�[ 
cparZ o  ���Z�Z 0 i  Y o  ���Y�Y "0 userinformation userInformationW m  ��[[ �\\ 
 C i t y :U Q  ��]^_] r  ��`a` n  ��bcb 4  ���Xd
�X 
citmd m  ���W�W c n  ��efe 4  ���Vg
�V 
cparg o  ���U�U 0 i  f o  ���T�T "0 userinformation userInformationa o      �S�S 0 usercity userCity^ R      �R�Q�P
�R .ascrerr ****      � ****�Q  �P  _ k  ��hh iji r  ��klk J  ��mm n�On m  ��oo �pp  �O  l n     qrq 1  ���N
�N 
txdlr 1  ���M
�M 
ascrj s�Ls r  ��tut c  ��vwv n  ��xyx 7���Kz{
�K 
cha z m  ���J�J {  ;  ��y n  ��|}| 4  ���I~
�I 
cpar~ l ���H�G [  ����� o  ���F�F 0 i  � m  ���E�E �H  �G  } o  ���D�D "0 userinformation userInformationw m  ���C
�C 
TEXTu o      �B�B 0 usercity userCity�L  �]  �\  S ��� l ���A�@�?�A  �@  �?  � ��� r  ����� J  ���� ��>� m  ���� ���  :  �>  � n     ��� 1  ���=
�= 
txdl� 1  ���<
�< 
ascr� ��� Z  �D���;�:� C ����� n  ����� 4  ���9�
�9 
cpar� o  ���8�8 0 i  � o  ���7�7 "0 userinformation userInformation� m  ���� ���  F A X N u m b e r :� Q  �@���� r  ���� n  �	��� 4  	�6�
�6 
citm� m  �5�5 � n  ���� 4  ��4�
�4 
cpar� o  �3�3 0 i  � o  ���2�2 "0 userinformation userInformation� o      �1�1 0 userfax userFax� R      �0�/�.
�0 .ascrerr ****      � ****�/  �.  � k  @�� ��� r  "��� J  �� ��-� m  �� ���  �-  � n     ��� 1  !�,
�, 
txdl� 1  �+
�+ 
ascr� ��*� r  #@��� c  #<��� n  #8��� 7-8�)��
�) 
cha � m  35�(�( �  ;  67� n  #-��� 4  &-�'�
�' 
cpar� l ),��&�%� [  ),��� o  )*�$�$ 0 i  � m  *+�#�# �&  �%  � o  #&�"�" "0 userinformation userInformation� m  8;�!
�! 
TEXT� o      � �  0 userfax userFax�*  �;  �:  � ��� l EE����  �  �  � ��� r  ER��� J  EJ�� ��� m  EH�� ���  :  �  � n     ��� 1  MQ�
� 
txdl� 1  JM�
� 
ascr� ��� Z  S������ C S_��� n  S[��� 4  V[��
� 
cpar� o  YZ�� 0 i  � o  SV�� "0 userinformation userInformation� m  [^�� ���  F i r s t N a m e :� Q  b����� r  et��� n  er��� 4  mr��
� 
citm� m  pq�� � n  em��� 4  hm��
� 
cpar� o  kl�� 0 i  � o  eh�� "0 userinformation userInformation� o      �� 0 userfirstname userFirstName� R      ���
� .ascrerr ****      � ****�  �  � k  |��� ��� r  |���� J  |��� ��� m  |�� ���  �  � n     ��� 1  ���

�
 
txdl� 1  ���	
�	 
ascr� ��� r  ����� c  ����� n  ����� 7�����
� 
cha � m  ���� �  ;  ��� n  ����� 4  ����
� 
cpar� l ������ [  ����� o  ���� 0 i  � m  ���� �  �  � o  ��� �  "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 userfirstname userFirstName�  �  �  � ��� l ����������  ��  ��  � ��� r  ����� J  ��   �� m  �� �  :  ��  � n      1  ����
�� 
txdl 1  ����
�� 
ascr�  Z  �	���� C ��

 n  �� 4  ����
�� 
cpar o  ������ 0 i   o  ������ "0 userinformation userInformation m  �� �  J o b T i t l e :	 Q  � r  �� n  �� 4  ����
�� 
citm m  ������  n  �� 4  ����
�� 
cpar o  ������ 0 i   o  ������ "0 userinformation userInformation o      ���� 0 	usertitle 	userTitle R      ������
�� .ascrerr ****      � ****��  ��   k  �  r  ��  J  ��!! "��" m  ��## �$$  ��    n     %&% 1  ����
�� 
txdl& 1  ����
�� 
ascr '��' r  �()( c  �
*+* n  �,-, 7���./
�� 
cha . m  ���� /  ;  - n  ��010 4  ����2
�� 
cpar2 l ��3����3 [  ��454 o  ������ 0 i  5 m  ������ ��  ��  1 o  ������ "0 userinformation userInformation+ m  	��
�� 
TEXT) o      ���� 0 	usertitle 	userTitle��  ��  ��   676 l ��������  ��  ��  7 898 r   :;: J  << =��= m  >> �??  :  ��  ; n     @A@ 1  ��
�� 
txdlA 1  ��
�� 
ascr9 BCB Z  !wDE����D C !-FGF n  !)HIH 4  $)��J
�� 
cparJ o  '(���� 0 i  I o  !$���� "0 userinformation userInformationG m  ),KK �LL  L a s t N a m e :E Q  0sMNOM r  3BPQP n  3@RSR 4  ;@��T
�� 
citmT m  >?���� S n  3;UVU 4  6;��W
�� 
cparW o  9:���� 0 i  V o  36���� "0 userinformation userInformationQ o      ���� 0 userlastname userLastNameN R      ������
�� .ascrerr ****      � ****��  ��  O k  JsXX YZY r  JW[\[ J  JO]] ^��^ m  JM__ �``  ��  \ n     aba 1  RV��
�� 
txdlb 1  OR��
�� 
ascrZ c��c r  Xsded c  Xqfgf n  Xmhih 7bm��jk
�� 
cha j m  hj���� k  ;  kli n  Xblml 4  [b��n
�� 
cparn l ^ao����o [  ^apqp o  ^_���� 0 i  q m  _`���� ��  ��  m o  X[���� "0 userinformation userInformationg m  mp��
�� 
TEXTe o      ���� 0 userlastname userLastName��  ��  ��  C rsr l xx��������  ��  ��  s tut r  x�vwv J  x}xx y��y m  x{zz �{{  :  ��  w n     |}| 1  ����
�� 
txdl} 1  }���
�� 
ascru ~~ Z  ��������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  M o b i l e N u m b e r :� Q  ������ r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ���� 0 
usermobile 
userMobile� R      ������
�� .ascrerr ****      � ****��  ��  � k  ���� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ����� c  ����� n  ����� 7������
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 
usermobile 
userMobile��  ��  ��   ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �I������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  P h o n e N u m b e r :� Q  �E���� r  ��� n  ��� 4  	���
�� 
citm� m  ���� � n  	��� 4  	���
�� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      ���� 0 userworkphone userWorkPhone� R      ������
�� .ascrerr ****      � ****��  ��  � k  E�� ��� r  '��� J  �� ���� m  �� ���  ��  � n     ��� 1  "&��
�� 
txdl� 1  "��
�� 
ascr� ���� r  (E��� c  (A��� n  (=��� 72=���
� 
cha � m  8:�~�~ �  ;  ;<� n  (2��� 4  +2�}�
�} 
cpar� l .1��|�{� [  .1��� o  ./�z�z 0 i  � m  /0�y�y �|  �{  � o  (+�x�x "0 userinformation userInformation� m  =@�w
�w 
TEXT� o      �v�v 0 userworkphone userWorkPhone��  ��  ��  � ��� l JJ�u�t�s�u  �t  �s  � ��� r  JW��� J  JO�� ��r� m  JM�� ���  :  �r  � n     ��� 1  RV�q
�q 
txdl� 1  OR�p
�p 
ascr� ��� Z  X����o�n� C Xd��� n  X`��� 4  [`�m�
�m 
cpar� o  ^_�l�l 0 i  � o  X[�k�k "0 userinformation userInformation� m  `c�� �    P o s t a l C o d e :� Q  g� r  j{ n  jw 4  rw�j
�j 
citm m  uv�i�i  n  jr	
	 4  mr�h
�h 
cpar o  pq�g�g 0 i  
 o  jm�f�f "0 userinformation userInformation o      �e�e  0 userpostalcode userPostalCode R      �d�c�b
�d .ascrerr ****      � ****�c  �b   k  ��  r  �� J  �� �a m  �� �  �a   n      1  ���`
�` 
txdl 1  ���_
�_ 
ascr �^ r  �� c  �� n  �� 7���]
�] 
cha  m  ���\�\   ;  �� n  �� !  4  ���["
�[ 
cpar" l ��#�Z�Y# [  ��$%$ o  ���X�X 0 i  % m  ���W�W �Z  �Y  ! o  ���V�V "0 userinformation userInformation m  ���U
�U 
TEXT o      �T�T  0 userpostalcode userPostalCode�^  �o  �n  � &'& l ���S�R�Q�S  �R  �Q  ' ()( r  ��*+* J  ��,, -�P- m  ��.. �//  :  �P  + n     010 1  ���O
�O 
txdl1 1  ���N
�N 
ascr) 232 Z  �45�M�L4 C ��676 n  ��898 4  ���K:
�K 
cpar: o  ���J�J 0 i  9 o  ���I�I "0 userinformation userInformation7 m  ��;; �<<  R e a l N a m e :5 Q  �=>?= r  ��@A@ n  ��BCB 4  ���HD
�H 
citmD m  ���G�G C n  ��EFE 4  ���FG
�F 
cparG o  ���E�E 0 i  F o  ���D�D "0 userinformation userInformationA o      �C�C 0 userfullname userFullName> R      �B�A�@
�B .ascrerr ****      � ****�A  �@  ? k  �HH IJI r  ��KLK J  ��MM N�?N m  ��OO �PP  �?  L n     QRQ 1  ���>
�> 
txdlR 1  ���=
�= 
ascrJ S�<S r  �TUT c  �VWV n  �XYX 7�;Z[
�; 
cha Z m  �:�: [  ;  Y n  �\]\ 4  ��9^
�9 
cpar^ l _�8�7_ [  `a` o  �6�6 0 i  a m  �5�5 �8  �7  ] o  ���4�4 "0 userinformation userInformationW m  �3
�3 
TEXTU o      �2�2 0 userfullname userFullName�<  �M  �L  3 bcb l   �1�0�/�1  �0  �/  c ded r   -fgf J   %hh i�.i m   #jj �kk  :  �.  g n     lml 1  (,�-
�- 
txdlm 1  %(�,
�, 
ascre non Z  .�pq�+�*p C .:rsr n  .6tut 4  16�)v
�) 
cparv o  45�(�( 0 i  u o  .1�'�' "0 userinformation userInformations m  69ww �xx  S t a t e :q Q  =�yz{y r  @Q|}| n  @M~~ 4  HM�&�
�& 
citm� m  KL�%�%  n  @H��� 4  CH�$�
�$ 
cpar� o  FG�#�# 0 i  � o  @C�"�" "0 userinformation userInformation} o      �!�! 0 	userstate 	userStatez R      � ��
�  .ascrerr ****      � ****�  �  { k  Y��� ��� r  Yf��� J  Y^�� ��� m  Y\�� ���  �  � n     ��� 1  ae�
� 
txdl� 1  ^a�
� 
ascr� ��� r  g���� c  g���� n  g|��� 7q|���
� 
cha � m  wy�� �  ;  z{� n  gq��� 4  jq��
� 
cpar� l mp���� [  mp��� o  mn�� 0 i  � m  no�� �  �  � o  gj�� "0 userinformation userInformation� m  |�
� 
TEXT� o      �� 0 	userstate 	userState�  �+  �*  o ��� l ������  �  �  � ��� r  ����� J  ���� ��� m  ���� ���  :  �  � n     ��� 1  ���
� 
txdl� 1  ���

�
 
ascr� ��� Z  �����	�� C ����� n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m  ���� ���  S t r e e t :� Q  ������ r  ����� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ��� �  "0 userinformation userInformation� o      ���� 0 
userstreet 
userStreet� R      ������
�� .ascrerr ****      � ****��  ��  � k  ���� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ����� c  ����� n  ����� 7������
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      ���� 0 
userstreet 
userStreet��  �	  �  � ���� l ����������  ��  ��  ��  �S 0 i  � m  ������ � I �������
�� .corecnte****       ****� n ����� 2 ����
�� 
cpar� o  ������ "0 userinformation userInformation��  �R  � ��� l ����������  ��  ��  � ��� r  �		��� J  �	�� ��� m  ���� ���  ; K e r b e r o s v 5 ; ;� ���� m  ���� ���  ;��  � n     ��� 1  		��
�� 
txdl� 1  		��
�� 
ascr� ��� l 	
	
��������  ��  ��  � ��� Q  	
	"����� r  		��� n  		��� 4  		���
�� 
citm� m  		���� � o  		���� "0 userinformation userInformation� o      ���� &0 userkerberosrealm userKerberosRealm� R      ������
�� .ascrerr ****      � ****��  ��  ��  � ��� l 	#	#��������  ��  ��  � ��� r  	#	0��� J  	#	(��  ��  m  	#	& �  ��  � n      1  	+	/��
�� 
txdl 1  	(	+��
�� 
ascr�  l 	1	1��������  ��  ��    Z  	1		
����	 = 	1	: o  	1	6���� 0 emailaddress emailAddress m  	6	9 �  
 k  	=	{  l 	=	=��������  ��  ��    l 	=	=����     something went wrong    � *   s o m e t h i n g   w e n t   w r o n g  l 	=	=��������  ��  ��    I 	=	p��
�� .sysodlogaskr        TEXT b  	=	N b  	=	J  b  	=	F!"! o  	=	B���� 0 errormessage errorMessage" o  	B	E��
�� 
ret   o  	F	I��
�� 
ret  m  	J	M## �$$ h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y . ��%&
�� 
disp% m  	Q	T��
�� stic    & ��'(
�� 
btns' J  	W	\)) *��* m  	W	Z++ �,,  O K��  ( ��-.
�� 
dflt- J  	_	d// 0��0 m  	_	b11 �22  O K��  . ��3��
�� 
appr3 m  	g	j44 �55 , O u t l o o k   E x c h a n g e   S e t u p��   6��6 R  	q	{����7
�� .ascrerr ****      � ****��  7 ��8��
�� 
errn8 m  	u	x��������  ��  ��  ��   9��9 l 	�	���������  ��  ��  ��  � :;: F  	�	�<=< = 	�	�>?> o  	�	����� 0 emailformat emailFormat? m  	�	����� = = 	�	�@A@ o  	�	����� 0 displayname displayNameA m  	�	����� ; BCB k  	�

DD EFE l 	�	���������  ��  ��  F GHG l 	�	���IJ��  I P J Pull user information from the account settings of the local user account   J �KK �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n tH LML l 	�	���������  ��  ��  M NON r  	�	�PQP n  	�	�RSR 1  	�	���
�� 
sisnS l 	�	�T����T I 	�	�������
�� .sysosigtsirr   ��� null��  ��  ��  ��  Q o      ���� 0 usershortname userShortNameO UVU r  	�	�WXW n  	�	�YZY 1  	�	���
�� 
silnZ l 	�	�[����[ I 	�	�������
�� .sysosigtsirr   ��� null��  ��  ��  ��  X o      ���� 0 userfullname userFullNameV \]\ l 	�	���������  ��  ��  ] ^_^ l 	�	���`a��  ` D > first.last@domain.com and full name displays as "Last, First"   a �bb |   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "_ cdc l 	�	���������  ��  ��  d efe r  	�	�ghg m  	�	�ii �jj  ,  h n     klk 1  	�	���
�� 
txdll 1  	�	���
�� 
ascrf mnm r  	�	�opo n  	�	�qrq 4 	�	���s
�� 
citms m  	�	�������r o  	�	����� 0 userfullname userFullNamep o      ���� 0 userfirstname userFirstNamen tut r  	�	�vwv n  	�	�xyx 4  	�	���z
�� 
cworz m  	�	����� y n  	�	�{|{ 4  	�	���}
�� 
citm} m  	�	����� | o  	�	����� 0 userfullname userFullNamew o      �� 0 userlastname userLastNameu ~~ r  	�	���� m  	�	��� ���  � n     ��� 1  	�	��~
�~ 
txdl� 1  	�	��}
�} 
ascr ��� r  	�
��� b  	�
��� b  	�	���� b  	�	���� b  	�	���� o  	�	��|�| 0 userfirstname userFirstName� m  	�	��� ���  .� o  	�	��{�{ 0 userlastname userLastName� m  	�	��� ���  @� o  	�
�z�z 0 
domainname 
domainName� o      �y�y 0 emailaddress emailAddress� ��x� l 
	
	�w�v�u�w  �v  �u  �x  C ��� F  

 ��� = 

��� o  

�t�t 0 emailformat emailFormat� m  

�s�s � = 

��� o  

�r�r 0 displayname displayName� m  

�q�q � ��� k  
#
��� ��� l 
#
#�p�o�n�p  �o  �n  � ��� l 
#
#�m���m  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l 
#
#�l�k�j�l  �k  �j  � ��� r  
#
2��� n  
#
,��� 1  
(
,�i
�i 
sisn� l 
#
(��h�g� I 
#
(�f�e�d
�f .sysosigtsirr   ��� null�e  �d  �h  �g  � o      �c�c 0 usershortname userShortName� ��� r  
3
B��� n  
3
<��� 1  
8
<�b
�b 
siln� l 
3
8��a�`� I 
3
8�_�^�]
�_ .sysosigtsirr   ��� null�^  �]  �a  �`  � o      �\�\ 0 userfullname userFullName� ��� l 
C
C�[�Z�Y�[  �Z  �Y  � ��� l 
C
C�X���X  � C = first.last@domain.com and full name displays as "First Last"   � ��� z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "� ��� l 
C
C�W�V�U�W  �V  �U  � ��� r  
C
N��� m  
C
F�� ���   � n     ��� 1  
I
M�T
�T 
txdl� 1  
F
I�S
�S 
ascr� ��� r  
O
`��� n  
O
^��� 4  
Y
^�R�
�R 
cwor� m  
\
]�Q�Q � n  
O
Y��� 4  
T
Y�P�
�P 
citm� m  
W
X�O�O � o  
O
T�N�N 0 userfullname userFullName� o      �M�M 0 userfirstname userFirstName� ��� r  
a
m��� n  
a
k��� 4 
f
k�L�
�L 
citm� m  
i
j�K�K��� o  
a
f�J�J 0 userfullname userFullName� o      �I�I 0 userlastname userLastName� ��� r  
n
y��� m  
n
q�� ���  � n     ��� 1  
t
x�H
�H 
txdl� 1  
q
t�G
�G 
ascr� ��� r  
z
���� b  
z
���� b  
z
���� b  
z
���� b  
z
��� o  
z
{�F�F 0 userfirstname userFirstName� m  
{
~�� ���  .� o  

��E�E 0 userlastname userLastName� m  
�
��� ���  @� o  
�
��D�D 0 
domainname 
domainName� o      �C�C 0 emailaddress emailAddress� ��B� l 
�
��A�@�?�A  �@  �?  �B  � ��� F  
�
���� = 
�
���� o  
�
��>�> 0 emailformat emailFormat� m  
�
��=�= � = 
�
���� o  
�
��<�< 0 displayname displayName� m  
�
��;�; � ��� k  
��� �	 � l 
�
��:�9�8�:  �9  �8  	  			 l 
�
��7		�7  	 P J Pull user information from the account settings of the local user account   	 �		 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	 			 l 
�
��6�5�4�6  �5  �4  	 				 r  
�
�	
		
 n  
�
�			 1  
�
��3
�3 
sisn	 l 
�
�	�2�1	 I 
�
��0�/�.
�0 .sysosigtsirr   ��� null�/  �.  �2  �1  	 o      �-�- 0 usershortname userShortName		 			 r  
�
�			 n  
�
�			 1  
�
��,
�, 
siln	 l 
�
�	�+�*	 I 
�
��)�(�'
�) .sysosigtsirr   ��� null�(  �'  �+  �*  	 o      �&�& 0 userfullname userFullName	 			 l 
�
��%�$�#�%  �$  �#  	 			 l 
�
��"		�"  	 ? 9 first@domain.com and full name displays as "Last, First"   	 �		 r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	 			 l 
�
��!� ��!  �   �  	 		 	 r  
�
�	!	"	! m  
�
�	#	# �	$	$  ,  	" n     	%	&	% 1  
�
��
� 
txdl	& 1  
�
��
� 
ascr	  	'	(	' r  
�
�	)	*	) n  
�
�	+	,	+ 4 
�
��	-
� 
citm	- m  
�
�����	, o  
�
��� 0 userfullname userFullName	* o      �� 0 userfirstname userFirstName	( 	.	/	. r  
�
�	0	1	0 n  
�
�	2	3	2 4  
�
��	4
� 
cwor	4 m  
�
��� 	3 n  
�
�	5	6	5 4  
�
��	7
� 
citm	7 m  
�
��� 	6 o  
�
��� 0 userfullname userFullName	1 o      �� 0 userlastname userLastName	/ 	8	9	8 r  
�	:	;	: m  
�
�	<	< �	=	=  	; n     	>	?	> 1  
��
� 
txdl	? 1  
�
��
� 
ascr	9 	@	A	@ r  	B	C	B b  	D	E	D b  	F	G	F o  �� 0 userfirstname userFirstName	G m  	H	H �	I	I  @	E o  �� 0 
domainname 
domainName	C o      �� 0 emailaddress emailAddress	A 	J�	J l ���
�  �  �
  �  � 	K	L	K F  ,	M	N	M =  	O	P	O o  �	�	 0 emailformat emailFormat	P m  �� 	N = #*	Q	R	Q o  #(�� 0 displayname displayName	R m  ()�� 	L 	S	T	S k  /�	U	U 	V	W	V l //����  �  �  	W 	X	Y	X l //�	Z	[�  	Z P J Pull user information from the account settings of the local user account   	[ �	\	\ �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	Y 	]	^	] l //�� ���  �   ��  	^ 	_	`	_ r  />	a	b	a n  /8	c	d	c 1  48��
�� 
sisn	d l /4	e����	e I /4������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	b o      ���� 0 usershortname userShortName	` 	f	g	f r  ?N	h	i	h n  ?H	j	k	j 1  DH��
�� 
siln	k l ?D	l����	l I ?D������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	i o      ���� 0 userfullname userFullName	g 	m	n	m l OO��������  ��  ��  	n 	o	p	o l OO��	q	r��  	q = 7 first@domain.com if full name displays as "First Last"   	r �	s	s n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	p 	t	u	t l OO��������  ��  ��  	u 	v	w	v r  OZ	x	y	x m  OR	z	z �	{	{   	y n     	|	}	| 1  UY��
�� 
txdl	} 1  RU��
�� 
ascr	w 	~		~ r  [l	�	�	� n  [j	�	�	� 4  ej��	�
�� 
cwor	� m  hi���� 	� n  [e	�	�	� 4  `e��	�
�� 
citm	� m  cd���� 	� o  [`���� 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	 	�	�	� r  my	�	�	� n  mw	�	�	� 4 rw��	�
�� 
citm	� m  uv������	� o  mr���� 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  z�	�	�	� m  z}	�	� �	�	�  	� n     	�	�	� 1  ����
�� 
txdl	� 1  }���
�� 
ascr	� 	�	�	� r  ��	�	�	� b  ��	�	�	� b  ��	�	�	� o  ������ 0 userfirstname userFirstName	� m  ��	�	� �	�	�  @	� o  ������ 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	T 	�	�	� F  ��	�	�	� = ��	�	�	� o  ������ 0 emailformat emailFormat	� m  ������ 	� = ��	�	�	� o  ������ 0 displayname displayName	� m  ������ 	� 	�	�	� k  �#	�	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� ? 9 flast@domain.com and full name displays as "Last, First"   	� �	�	� r   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  ,  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4 ����	�
�� 
citm	� m  ��������	� o  ������ 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4  ����	�
�� 
cwor	� m  ������ 	� n  ��	�	�	� 4  ����	�
�� 
citm	� m  ������ 	� o  ������ 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  �	�	�	� m  � 	�	� �	�	�  	� n     	�	�	� 1  ��
�� 
txdl	� 1   ��
�� 
ascr	� 	�	�	� r  	!	�	�	� b  		�	�	� b  		�	�	� b  		�	�	� l 		�����	� n  		�	�	� 4  
��	�
�� 
cha 	� m  ���� 	� o  	
���� 0 userfirstname userFirstName��  ��  	� o  ���� 0 userlastname userLastName	� m  	�	� �	�	�  @	� o  ���� 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ""��������  ��  ��  ��  	� 	�
 	� F  &9


 = &-


 o  &+���� 0 emailformat emailFormat
 m  +,���� 
 = 07


 o  05���� 0 displayname displayName
 m  56���� 
  


 k  <�
	
	 




 l <<��������  ��  ��  
 


 l <<��

��  
 P J Pull user information from the account settings of the local user account   
 �

 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
 


 l <<��������  ��  ��  
 


 r  <K


 n  <E


 1  AE��
�� 
sisn
 l <A
����
 I <A������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
 o      ���� 0 usershortname userShortName
 


 r  L[


 n  LU


 1  QU��
�� 
siln
 l LQ
 ����
  I LQ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
 o      ���� 0 userfullname userFullName
 
!
"
! l \\�������  ��  �  
" 
#
$
# l \\�~
%
&�~  
% > 8 flast@domain.com and full name displays as "First Last"   
& �
'
' p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
$ 
(
)
( l \\�}�|�{�}  �|  �{  
) 
*
+
* r  \g
,
-
, m  \_
.
. �
/
/   
- n     
0
1
0 1  bf�z
�z 
txdl
1 1  _b�y
�y 
ascr
+ 
2
3
2 r  hy
4
5
4 n  hw
6
7
6 4  rw�x
8
�x 
cwor
8 m  uv�w�w 
7 n  hr
9
:
9 4  mr�v
;
�v 
citm
; m  pq�u�u 
: o  hm�t�t 0 userfullname userFullName
5 o      �s�s 0 userfirstname userFirstName
3 
<
=
< r  z�
>
?
> n  z�
@
A
@ 4 ��r
B
�r 
citm
B m  ���q�q��
A o  z�p�p 0 userfullname userFullName
? o      �o�o 0 userlastname userLastName
= 
C
D
C r  ��
E
F
E m  ��
G
G �
H
H  
F n     
I
J
I 1  ���n
�n 
txdl
J 1  ���m
�m 
ascr
D 
K
L
K r  ��
M
N
M l ��
O�l�k
O b  ��
P
Q
P b  ��
R
S
R b  ��
T
U
T n  ��
V
W
V 4  ���j
X
�j 
cha 
X m  ���i�i 
W o  ���h�h 0 userfirstname userFirstName
U o  ���g�g 0 userlastname userLastName
S m  ��
Y
Y �
Z
Z  @
Q o  ���f�f 0 
domainname 
domainName�l  �k  
N o      �e�e 0 emailaddress emailAddress
L 
[�d
[ l ���c�b�a�c  �b  �a  �d  
 
\
]
\ F  ��
^
_
^ = ��
`
a
` o  ���`�` 0 emailformat emailFormat
a m  ���_�_ 
_ = ��
b
c
b o  ���^�^ 0 displayname displayName
c m  ���]�] 
] 
d
e
d k  �6
f
f 
g
h
g l ���\�[�Z�\  �[  �Z  
h 
i
j
i l ���Y
k
l�Y  
k P J Pull user information from the account settings of the local user account   
l �
m
m �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
j 
n
o
n l ���X�W�V�X  �W  �V  
o 
p
q
p r  ��
r
s
r n  ��
t
u
t 1  ���U
�U 
sisn
u l ��
v�T�S
v I ���R�Q�P
�R .sysosigtsirr   ��� null�Q  �P  �T  �S  
s o      �O�O 0 usershortname userShortName
q 
w
x
w r  ��
y
z
y n  ��
{
|
{ 1  ���N
�N 
siln
| l ��
}�M�L
} I ���K�J�I
�K .sysosigtsirr   ��� null�J  �I  �M  �L  
z o      �H�H 0 userfullname userFullName
x 
~

~ l ���G�F�E�G  �F  �E  
 
�
�
� l ���D
�
��D  
� C = shortName@domain.com and full name displays as "Last, First"   
� �
�
� z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
� 
�
�
� l ���C�B�A�C  �B  �A  
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�  ,  
� n     
�
�
� 1  ���@
�@ 
txdl
� 1  ���?
�? 
ascr
� 
�
�
� r  � 
�
�
� n  ��
�
�
� 4 ���>
�
�> 
citm
� m  ���=�=��
� o  ���<�< 0 userfullname userFullName
� o      �;�; 0 userfirstname userFirstName
� 
�
�
� r  
�
�
� n  
�
�
� 4  �:
�
�: 
cwor
� m  �9�9 
� n  
�
�
� 4  �8
�
�8 
citm
� m  	
�7�7 
� o  �6�6 0 userfullname userFullName
� o      �5�5 0 userlastname userLastName
� 
�
�
� r  
�
�
� m  
�
� �
�
�  
� n     
�
�
� 1  �4
�4 
txdl
� 1  �3
�3 
ascr
� 
�
�
� r  4
�
�
� b  .
�
�
� b  (
�
�
� o  $�2�2 0 usershortname userShortName
� m  $'
�
� �
�
�  @
� o  (-�1�1 0 
domainname 
domainName
� o      �0�0 0 emailaddress emailAddress
� 
��/
� l 55�.�-�,�.  �-  �,  �/  
e 
�
�
� F  9N
�
�
� = 9B
�
�
� o  9>�+�+ 0 emailformat emailFormat
� m  >A�*�* 
� = EL
�
�
� o  EJ�)�) 0 displayname displayName
� m  JK�(�( 
� 
�
�
� k  Q�
�
� 
�
�
� l QQ�'�&�%�'  �&  �%  
� 
�
�
� l QQ�$
�
��$  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l QQ�#�"�!�#  �"  �!  
� 
�
�
� r  Q`
�
�
� n  QZ
�
�
� 1  VZ� 
�  
sisn
� l QV
���
� I QV���
� .sysosigtsirr   ��� null�  �  �  �  
� o      �� 0 usershortname userShortName
� 
�
�
� r  ap
�
�
� n  aj
�
�
� 1  fj�
� 
siln
� l af
���
� I af���
� .sysosigtsirr   ��� null�  �  �  �  
� o      �� 0 userfullname userFullName
� 
�
�
� l qq����  �  �  
� 
�
�
� l qq�
�
��  
� B < shortName@domain.com and full name displays as "First Last"   
� �
�
� x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
� 
�
�
� l qq����  �  �  
� 
�
�
� r  q|
�
�
� m  qt
�
� �
�
�   
� n     
�
�
� 1  w{�
� 
txdl
� 1  tw�

�
 
ascr
� 
�
�
� r  }�
�
�
� n  }�
�
�
� 4  ���	
�
�	 
cwor
� m  ���� 
� n  }�
�
�
� 4  ���
�
� 
citm
� m  ���� 
� o  }��� 0 userfullname userFullName
� o      �� 0 userfirstname userFirstName
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 4 ���
�
� 
citm
� m  ������
� o  ���� 0 userfullname userFullName
� o      � �  0 userlastname userLastName
� 
�
�
� r  ��
�
�
� m  ��
�
� �
�
�  
� n     
�
�
� 1  ����
�� 
txdl
� 1  ����
�� 
ascr
� 
� 
� r  �� b  �� b  �� o  ������ 0 usershortname userShortName m  �� �  @ o  ������ 0 
domainname 
domainName o      ���� 0 emailaddress emailAddress  	��	 l ����������  ��  ��  ��  
� 

 F  �� = �� o  ������ 0 emailformat emailFormat m  ������  = �� o  ������ 0 displayname displayName m  ������  �� k  ��  l ����������  ��  ��    l ������   $  Prompt User for relevant info    � <   P r o m p t   U s e r   f o r   r e l e v a n t   i n f o  l ����������  ��  ��    V  �  k  �!! "#" r  ��$%$ n  ��&'& 1  ����
�� 
ttxt' l ��(����( I ����)*
�� .sysodlogaskr        TEXT) m  ��++ �,, > E n t e r   t h e   u s e r ' s   n e t w o r k   l o g i n .* ��-��
�� 
dtxt- m  ��.. �//  ��  ��  ��  % o      ���� 0 usershortname userShortName# 0��0 Z  12����1 =  	343 o   ���� 0 usershortname userShortName4 m  55 �66  2 I ��7��
�� .sysodisAaleR        TEXT7 m  88 �99  I n v a l i d   E n t r y !��  ��  ��  ��    = ��:;: o  ������ 0 usershortname userShortName; m  ��<< �==   >?> l ��������  ��  ��  ? @A@ V  SBCB k  'NDD EFE r  ':GHG n  '8IJI 1  48��
�� 
ttxtJ l '4K����K I '4��LM
�� .sysodlogaskr        TEXTL m  '*NN �OO J E n t e r   t h e   u s e r ' s   f i r s t   o r   g i v e n   n a m e .M ��P��
�� 
dtxtP m  -0QQ �RR  ��  ��  ��  H o      ���� 0 userfirstname userFirstNameF S��S Z ;NTU����T = ;@VWV o  ;<���� 0 userfirstname userFirstNameW m  <?XX �YY  U I CJ��Z��
�� .sysodisAaleR        TEXTZ m  CF[[ �\\  I n v a l i d   E n t r y !��  ��  ��  ��  C = !&]^] o  !"���� 0 userfirstname userFirstName^ m  "%__ �``  A aba l TT��������  ��  ��  b cdc V  T�efe k  ^�gg hih r  ^qjkj n  ^olml 1  ko��
�� 
ttxtm l ^kn����n I ^k��op
�� .sysodlogaskr        TEXTo m  ^aqq �rr V E n t e r   t h e   u s e r ' s   l a s t   o r   f a m i l y   o r   s u r n a m e .p ��s��
�� 
dtxts m  dgtt �uu  ��  ��  ��  k o      ���� 0 userlastname userLastNamei v��v Z r�wx����w = rwyzy o  rs���� 0 userlastname userLastNamez m  sv{{ �||  x I z���}��
�� .sysodisAaleR        TEXT} m  z}~~ �  I n v a l i d   E n t r y !��  ��  ��  ��  f = X]��� o  XY���� 0 userlastname userLastName� m  Y\�� ���  d ��� l ����������  ��  ��  � ��� r  ����� b  ����� b  ����� o  ������ 0 userlastname userLastName� m  ���� ���  ,  � o  ������ 0 userfirstname userFirstName� o      ���� 0 userfullname userFullName� ��� l ����������  ��  ��  � ��� r  ����� m  ���� ���  � o      ���� 0 domainchoice domainChoice� ��� V  ����� k  ���� ��� r  ����� n  ����� 1  ����
�� 
bhit� l �������� I ������
�� .sysodlogaskr        TEXT� m  ���� ��� 2 S e l e c t   t h e   u s e r ' s   d o m a i n .� ����
�� 
btns� J  ���� ��� m  ���� ��� 
 C A B L E� ���� m  ���� ���  C O R P H Q��  � �����
�� 
dflt� m  ���� ��� 
 C A B L E��  ��  ��  � o      ���� 0 domainchoice domainChoice� ���� Z  �������� = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  C O R P H Q� r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � r  ����� b  ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  \� o      ���� 0 domainprefix domainPrefix��  � = ����� o  ������ 0 domainchoice domainChoice� m  ���� ���  � ��� l ����������  ��  ��  � ��� V  ����� k  ��� ��� Z  :������ = ��� o  ���� 0 domainchoice domainChoice� m  �� ���  C O R P H Q� r  &��� b   ��� b  ��� b  ��� o  ���� 0 userfirstname userFirstName� m  �� ���  _� o  ���� 0 userlastname userLastName� m  �� ���  @ c o m c a s t . c o m� o      ���� 0 emailaddress emailAddress��  � r  ):��� b  )4��� b  )0��� b  ).��� o  )*���� 0 userfirstname userFirstName� m  *-�� ���  _� o  ./���� 0 userlastname userLastName� m  03�� ��� $ @ c a b l e . c o m c a s t . c o m� o      ���� 0 emailaddress emailAddress� ��� r  ;q��� n  ;k��� 1  gk��
�� 
ttxt� l ;g������ I ;g����
�� .sysodlogaskr        TEXT� b  ;H��� b  ;B   m  ;> � j V e r i f y   t h e   u s e r ' s   e m a i l   a d d r e s s .   C h a n g e   i f   i n c o r r e c t . o  >A��
�� 
ret � o  BG���� 0 emailaddress emailAddress� ��
�� 
dtxt o  KP���� 0 emailaddress emailAddress ��
�� 
btns J  S[ 	
	 m  SV �  C a n c e l
 �� m  VY �  V e r i f y��   ����
�� 
dflt m  ^a �  V e r i f y��  ��  ��  � o      ���� 0 emailaddress emailAddress� �� Z r����� = r{ o  rw���� 0 emailaddress emailAddress m  wz �   I ~�����
�� .sysodisAaleR        TEXT m  ~� �  I n v a l i d   E n t r y !��  ��  ��  ��  � = 
 o  ���� 0 emailaddress emailAddress m  	 �    � !��! l ����~�}�  �~  �}  ��  ��  � k  ��"" #$# l ���|�{�z�|  �{  �z  $ %&% l ���y'(�y  '   something went wrong   ( �)) *   s o m e t h i n g   w e n t   w r o n g& *+* l ���x�w�v�x  �w  �v  + ,-, I ���u./
�u .sysodlogaskr        TEXT. b  ��010 b  ��232 b  ��454 o  ���t�t 0 errormessage errorMessage5 o  ���s
�s 
ret 3 o  ���r
�r 
ret 1 m  ��66 �77 x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t ./ �q89
�q 
disp8 m  ���p
�p stic    9 �o:;
�o 
btns: J  ��<< =�n= m  ��>> �??  O K�n  ; �m@A
�m 
dflt@ J  ��BB C�lC m  ��DD �EE  O K�l  A �kF�j
�k 
apprF m  ��GG �HH , O u t l o o k   E x c h a n g e   S e t u p�j  - IJI R  ���i�hK
�i .ascrerr ****      � ****�h  K �gL�f
�g 
errnL m  ���e�e���f  J M�dM l ���c�b�a�c  �b  �a  �d  ��  ��  � NON l     �`�_�^�`  �_  �^  O PQP l     �]RS�]  R 0 *------------------------------------------   S �TT T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -Q UVU l     �\WX�\  W &   End collecting user information   X �YY @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o nV Z[Z l     �[\]�[  \ 0 *------------------------------------------   ] �^^ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -[ _`_ l     �Z�Y�X�Z  �Y  �X  ` aba l     �Wcd�W  c 0 *------------------------------------------   d �ee T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -b fgf l     �Vhi�V  h   Begin account setup   i �jj (   B e g i n   a c c o u n t   s e t u pg klk l     �Umn�U  m 0 *------------------------------------------   n �oo T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -l pqp l     �T�S�R�T  �S  �R  q rsr l ��t�Q�Pt O  ��uvu k  ��ww xyx l ���Oz{�O  z  activate   { �||  a c t i v a t ey }~} l ���N�M�L�N  �M  �L  ~ � Q  �����K� r  ����� o  ���J�J 0 unifiedinbox unifiedInbox� 1  ���I
�I 
GrpF� R      �H�G�F
�H .ascrerr ****      � ****�G  �F  �K  � ��� l ���E�D�C�E  �D  �C  � ��� Q  �	���B� r  � ��� o  ���A�A 20 hideonmycomputerfolders hideOnMyComputerFolders� 1  ���@
�@ 
hOMC� R      �?�>�=
�? .ascrerr ****      � ****�>  �=  �B  � ��� l 

�<�;�:�<  �;  �:  � ��� Z  
���9�8� = 
��� o  
�7�7 (0 verifyemailaddress verifyEMailAddress� m  �6
�6 boovtrue� k  �� ��� l �5���5  � � �set verifyEmail to display dialog "Please verify your email address is correct." default answer emailAddress with icon 1 with title "Outlook Exchange Setup" buttons {"Cancel", "Verify"} default button {"Verify"}   � ���� s e t   v e r i f y E m a i l   t o   d i s p l a y   d i a l o g   " P l e a s e   v e r i f y   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t . "   d e f a u l t   a n s w e r   e m a i l A d d r e s s   w i t h   i c o n   1   w i t h   t i t l e   " O u t l o o k   E x c h a n g e   S e t u p "   b u t t o n s   { " C a n c e l " ,   " V e r i f y " }   d e f a u l t   b u t t o n   { " V e r i f y " }� ��� l �4���4  � 6 0set emailAddress to text returned of verifyEmail   � ��� ` s e t   e m a i l A d d r e s s   t o   t e x t   r e t u r n e d   o f   v e r i f y E m a i l� ��3� l �2���2  � , &set emailAddress to verifyEMailAddress   � ��� L s e t   e m a i l A d d r e s s   t o   v e r i f y E M a i l A d d r e s s�3  �9  �8  � ��� l �1�0�/�1  �0  �/  � ��� Z  h���.�-� = !��� o  �,�, *0 verifyserveraddress verifyServerAddress� m   �+
�+ boovtrue� k  $d�� ��� r  $V��� I $R�*��
�* .sysodlogaskr        TEXT� m  $'�� ��� f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t .� �)��
�) 
dtxt� o  */�(�(  0 exchangeserver ExchangeServer� �'��
�' 
disp� m  23�&�& � �%��
�% 
appr� m  69�� ��� , O u t l o o k   E x c h a n g e   S e t u p� �$��
�$ 
btns� J  <D�� ��� m  <?�� ���  C a n c e l� ��#� m  ?B�� ���  V e r i f y�#  � �"��!
�" 
dflt� J  GL�� �� � m  GJ�� ���  V e r i f y�   �!  � o      �� 0 verifyserver verifyServer� ��� r  Wd��� n  W^��� 1  Z^�
� 
ttxt� o  WZ�� 0 verifyserver verifyServer� o      ��  0 exchangeserver ExchangeServer�  �.  �-  � ��� l ii����  �  �  � ��� l ii����  � "  create the Exchange account   � ��� 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t� ��� l ii����  �  �  � ��� Q  iq���� r  l���� I l����
� .corecrel****      � null�  � ���
� 
kocl� m  ps�
� 
Eact� ���
� 
prdt� l 	v����� K  v��� ���
� 
pnam� b  y���� m  y|�� ���  M a i l b o x   -  � o  |��
�
 0 userfullname userFullName� �	��
�	 
unme� b  ����� o  ���� 0 domainprefix domainPrefix� o  ���� 0 usershortname userShortName� ���
� 
fnam� o  ���� 0 userfullname userFullName� ���
� 
emad� o  ���� 0 emailaddress emailAddress� ���
� 
host� o  ����  0 exchangeserver ExchangeServer� � ��
�  
usss� o  ������ 60 exchangeserverrequiresssl ExchangeServerRequiresSSL� ����
�� 
port� o  ������ .0 exchangeserversslport ExchangeServerSSLPort� ����
�� 
ExLS� o  ������ "0 directoryserver DirectoryServer� ����
�� 
LDAu� o  ������ N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication� ��� 
�� 
LDSL� o  ������ 80 directoryserverrequiresssl DirectoryServerRequiresSSL  ��
�� 
LDMX o  ������ >0 directoryservermaximumresults DirectoryServerMaximumResults ��
�� 
LDSB o  ������ 60 directoryserversearchbase DirectoryServerSearchBase ��
�� 
ExPm o  ������ *0 downloadheadersonly downloadHeadersOnly ����
�� 
pBAD o  ������ *0 disableautodiscover disableAutodiscover��  �  �  �  � o      ���� (0 newexchangeaccount newExchangeAccount� R      ��	
�� .ascrerr ****      � **** l     
����
 o      ���� 0 error_message  ��  ��  	 ����
�� 
errn l     ���� o      ���� 0 error_number  ��  ��  ��  � k  q  r   b   b   b   m  	 �  E r r o r :   l 	
���� o  	
���� 0 error_number  ��  ��   m   �  .   l ���� o  ���� 0 error_message  ��  ��   l     ���� o      ���� 0 
error_text  ��  ��     I +��!"
�� .sysodlogaskr        TEXT! l #����# o  ���� 0 
error_text  ��  ��  " ��$%
�� 
btns$ J  !&& '��' m  (( �))  O K��  % ��*��
�� 
dflt* m  $%���� ��    +,+ L  ,0-- l ,/.����. o  ,/���� 0 
error_text  ��  ��  , /0/ I 1d��12
�� .sysodlogaskr        TEXT1 b  1B343 b  1>565 b  1:787 o  16���� 0 errormessage errorMessage8 o  69��
�� 
ret 6 o  :=��
�� 
ret 4 m  >A99 �:: D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t .2 ��;<
�� 
disp; m  EH��
�� stic    < ��=>
�� 
btns= J  KP?? @��@ m  KNAA �BB  O K��  > ��CD
�� 
dfltC J  SXEE F��F m  SVGG �HH  O K��  D ��I��
�� 
apprI m  [^JJ �KK , O u t l o o k   E x c h a n g e   S e t u p��  0 LML R  eo����N
�� .ascrerr ****      � ****��  N ��O��
�� 
errnO m  il��������  M P��P l pp��������  ��  ��  ��  � QRQ l rr��������  ��  ��  R STS l rr��UV��  U e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   V �WW �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e .T XYX l rr��������  ��  ��  Y Z[Z Z  r�\]����\ = ry^_^ o  rw���� 0 usekerberos useKerberos_ m  wx��
�� boovtrue] Q  |�`ab` k  �cc ded r  �fgf o  ����� 0 usekerberos useKerberosg n      hih 1  ����
�� 
Kerbi o  ������ (0 newexchangeaccount newExchangeAccounte j��j r  ��klk o  ������ &0 userkerberosrealm userKerberosRealml n      mnm 1  ����
�� 
ExGIn o  ������ (0 newexchangeaccount newExchangeAccount��  a R      ������
�� .ascrerr ****      � ****��  ��  b k  ��oo pqp l ����������  ��  ��  q rsr l ����tu��  t   something went wrong   u �vv *   s o m e t h i n g   w e n t   w r o n gs wxw l ����������  ��  ��  x yzy I ����{|
�� .sysodlogaskr        TEXT{ b  ��}~} b  ��� b  ����� o  ������ 0 errormessage errorMessage� o  ����
�� 
ret � o  ����
�� 
ret ~ m  ���� ��� ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .| ����
�� 
disp� m  ����
�� stic    � ����
�� 
btns� J  ���� ���� m  ���� ���  O K��  � ����
�� 
dflt� J  ���� ���� m  ���� ���  O K��  � �����
�� 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p��  z ��� R  �������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  ����������  � ���� l ����������  ��  ��  ��  ��  ��  [ ��� l ����������  ��  ��  � ��� l ��������  � M G The Me Contact record is automatically created with the first account.   � ��� �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .� ��� l ��������  � a [ Set the first name, last name, email address and other information using Active Directory.   � ��� �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .� ��� l ����������  ��  ��  � ��� r  ����� o  ������ 0 userfirstname userFirstName� n      ��� 1  ���
� 
pFrN� 1  ���~
�~ 
meCn� ��� r  ����� o  ���}�} 0 userlastname userLastName� n      ��� 1  ���|
�| 
pLsN� 1  ���{
�{ 
meCn� ��� r  ���� K  ��� �z��
�z 
radd� o   �y�y 0 emailaddress emailAddress� �x��w
�x 
type� m  �v
�v EATyeWrk�w  � n      ��� 1  �u
�u 
EmAd� 1  �t
�t 
meCn� ��� r  %��� o  �s�s  0 userdepartment userDepartment� n      ��� 1   $�r
�r 
Dptm� 1   �q
�q 
meCn� ��� r  &1��� o  &'�p�p 0 
useroffice 
userOffice� n      ��� 1  ,0�o
�o 
Ofic� 1  ',�n
�n 
meCn� ��� r  2?��� o  25�m�m 0 usercompany userCompany� n      ��� 1  :>�l
�l 
Cmpy� 1  5:�k
�k 
meCn� ��� r  @M��� o  @C�j�j 0 userworkphone userWorkPhone� n      ��� 1  HL�i
�i 
bsNm� 1  CH�h
�h 
meCn� ��� r  N[��� o  NQ�g�g 0 
usermobile 
userMobile� n      ��� 1  VZ�f
�f 
mbNm� 1  QV�e
�e 
meCn� ��� r  \i��� o  \_�d�d 0 userfax userFax� n      ��� 1  dh�c
�c 
bFax� 1  _d�b
�b 
meCn� ��� r  jw��� o  jm�a�a 0 	usertitle 	userTitle� n      ��� 1  rv�`
�` 
pTtl� 1  mr�_
�_ 
meCn� ��� r  x���� o  x{�^�^ 0 
userstreet 
userStreet� n      ��� 1  ���]
�] 
bStA� 1  {��\
�\ 
meCn� ��� r  ����� o  ���[�[ 0 usercity userCity� n      ��� 1  ���Z
�Z 
bCty� 1  ���Y
�Y 
meCn� ��� r  ����� o  ���X�X 0 	userstate 	userState� n      ��� 1  ���W
�W 
bSta� 1  ���V
�V 
meCn� ��� r  ����� o  ���U�U  0 userpostalcode userPostalCode� n      � � 1  ���T
�T 
bZip  1  ���S
�S 
meCn�  r  �� o  ���R�R 0 usercountry userCountry n       1  ���Q
�Q 
bCou 1  ���P
�P 
meCn  r  ��	
	 o  ���O�O 0 userwebpage userWebPage
 n       1  ���N
�N 
bsWP 1  ���M
�M 
meCn  l ���L�K�J�L  �K  �J    l ���I�I   0 * Set Outlook to be the default application    � T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n  l ���H�H   ( " for mail, calendars and contacts.    � D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s .  l ���G�F�E�G  �F  �E    r  �� m  ���D
�D boovtrue 1  ���C
�C 
pMSD   r  ��!"! m  ���B
�B boovtrue" 1  ���A
�A 
pCSD  #$# r  ��%&% m  ���@
�@ boovtrue& 1  ���?
�? 
pABD$ '(' l ���>�=�<�>  �=  �<  ( )*) l ���;+,�;  +   We're done.   , �--    W e ' r e   d o n e .* .�:. l ���9�8�7�9  �8  �7  �:  v m  ��//�                                                                                  OPIM  alis    x  Macintosh HD               �8H+   �Microsoft Outlook.app                                            ���`v�        ����  	                Applications    �8=P      �`�      �  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  �Q  �P  s 010 l     �6�5�4�6  �5  �4  1 232 l     �345�3  4 # Closes Outlook and relaunches   5 �66 : C l o s e s   O u t l o o k   a n d   r e l a u n c h e s3 787 l ��9�2�19 O ��:;: I ���0�/<
�0 .aevtquitnull��� ��� null�/  < �.=�-
�. 
savo= m  ���,
�, savono  �-  ; m  ��>>�                                                                                  OPIM  alis    x  Macintosh HD               �8H+   �Microsoft Outlook.app                                            ���`v�        ����  	                Applications    �8=P      �`�      �  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  �2  �1  8 ?@? l ��A�+�*A I ���)B�(
�) .sysodelanull��� ��� nmbrB m  ���'�' �(  �+  �*  @ CDC l  E�&�%E I  �$F�#
�$ .sysoexecTEXT���     TEXTF m   GG �HH 6 o p e n   - a   " M i c r o s o f t   O u t l o o k "�#  �&  �%  D IJI l     �"�!� �"  �!  �   J KLK l     �MN�  M  Remove setup .plist   N �OO & R e m o v e   s e t u p   . p l i s tL PQP l     ����  �  �  Q RSR l T��T I �U�
� .sysoexecTEXT���     TEXTU m  VV �WW � / b i n / l a u n c h c t l   u n l o a d   / L i b r a r y / L a u n c h A g e n t s / c o m . c o m c a s t . c a b l e . c e s . O u t l o o k E x c h a n g e S e t u p . p l i s t�  �  �  S XYX l Z��Z I �[\
� .sysoexecTEXT���     TEXT[ m  ]] �^^X / b i n / r m   / L i b r a r y / L a u n c h A g e n t s / c o m . c o m c a s t . c a b l e . c e s . O u t l o o k E x c h a n g e S e t u p 5 . 0 . p l i s t ;   / b i n / r m   / L i b r a r y / L a u n c h A g e n t s / c o m . c o m c a s t . c a b l e . c e s . O u t l o o k E x c h a n g e S e t u p L a u n c h A g e n t . p l i s t\ �_�
� 
badm_ m  �
� boovtrue�  �  �  Y `a` l     �bc�  b [ Udo shell script "/bin/launchctl remove com.comcast.cable.ces.OutlookExchangeSetup5.0"   c �dd � d o   s h e l l   s c r i p t   " / b i n / l a u n c h c t l   r e m o v e   c o m . c o m c a s t . c a b l e . c e s . O u t l o o k E x c h a n g e S e t u p 5 . 0 "a efe l     ����  �  �  f ghg l     �ij�  i # Closes Outlook and relaunches   j �kk : C l o s e s   O u t l o o k   a n d   r e l a u n c h e sh lml l .n��n O .opo I "-�
�	q
�
 .aevtquitnull��� ��� null�	  q �r�
� 
savor m  &)�
� savono  �  p m  ss�                                                                                  OPIM  alis    x  Macintosh HD               �8H+   �Microsoft Outlook.app                                            ���`v�        ����  	                Applications    �8=P      �`�      �  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  �  �  m tut l /4v��v I /4�w�
� .sysodelanull��� ��� nmbrw m  /0�� �  �  �  u xyx l 5<z� ��z I 5<��{��
�� .sysoexecTEXT���     TEXT{ m  58|| �}} 6 o p e n   - a   " M i c r o s o f t   O u t l o o k "��  �   ��  y ~~ l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ��� l     ������  �   End account setup   � ��� $   E n d   a c c o u n t   s e t u p� ���� l     ������  �  ���������������������   � ��� *                     ��       ����� R���� |�������� ��� 
����y�����������������  � �������������������������������������������������������� 0 usekerberos useKerberos��  0 exchangeserver ExchangeServer�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL�� .0 exchangeserversslport ExchangeServerSSLPort�� "0 directoryserver DirectoryServer�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication�� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�� 00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� 0 usershortname userShortName�� 0 userfullname userFullName�� 0 emailaddress emailAddress�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� *0 disableautodiscover disableAutodiscover�� 0 errormessage errorMessage
�� .aevtoappnull  �   � ****
�� boovfals
�� boovtrue���
�� boovfals
�� boovfals������
�� boovtrue�� �� 
�� boovtrue
�� boovfals
�� boovtrue
�� boovfals
�� boovfals
�� boovfals
�� boovfals� �����������
�� .aevtoappnull  �   � ****� k    <�� 1�� :�� C�� �� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� ��� r�� 7�� ?�� C�� R�� X�� l�� t�� x����  ��  ��  � �������� 0 i  �� 0 error_message  �� 0 error_number  �&8����A��LP�������������������������������������������������������5������=��C��F��������`����ln���������������������"/C^k������3N[o������#>K_z�������.;Ojw��������#+14������i���������	#	<	H	z	�	�	�	�	�
.
G
Y��
�
�
�
�
���<+��.��58��_NQX[�qt{~���������������������6>DG/��������������������������������������~�}�|�{�z�y�x�w�v��u(9AGJ�t�s�����r�q�p�o�n�m�l�k�j�i�h�g�f�e�d�c�b�a�`�_�^�]�\�[�Z�Y�XGV]�W|
�� .sysoexecTEXT���     TEXT�� 0 domainjoined domainJoined�� 0 networkuser networkUser
�� 
bool�� 0 userfirstname userFirstName�� 0 userlastname userLastName��  0 userdepartment userDepartment�� 0 
useroffice 
userOffice�� 0 usercompany userCompany�� 0 userworkphone userWorkPhone�� 0 
usermobile 
userMobile�� 0 userfax userFax�� 0 	usertitle 	userTitle�� 0 
userstreet 
userStreet�� 0 usercity userCity�� 0 	userstate 	userState��  0 userpostalcode userPostalCode�� 0 usercountry userCountry�� 0 userwebpage userWebPage�� 0 netbiosdomain netbiosDomain��  ��  
�� 
ret 
�� 
disp
�� stic    
�� 
btns
�� 
dflt
�� 
appr�� 
�� .sysodlogaskr        TEXT
�� 
errn����
�� 
ascr
�� 
txdl�� "0 userinformation userInformation
�� 
cpar
�� .corecnte****       ****
�� 
citm
�� 
cha 
�� 
TEXT�� &0 userkerberosrealm userKerberosRealm
�� .sysosigtsirr   ��� null
�� 
sisn
�� 
siln
�� 
cwor�� �� 
�� 
dtxt
�� 
ttxt
�� .sysodisAaleR        TEXT�� 0 domainchoice domainChoice
�� 
bhit�� 
�� 
GrpF
�� 
hOMC�� 
�� 0 verifyserver verifyServer
�� 
kocl
�� 
Eact
�� 
prdt
�� 
pnam
�� 
unme
�� 
fnam
�� 
emad
�� 
host
�� 
usss
�� 
port
�� 
ExLS
� 
LDAu
�~ 
LDSL
�} 
LDMX
�| 
LDSB
�{ 
ExPm
�z 
pBAD�y 
�x .corecrel****      � null�w (0 newexchangeaccount newExchangeAccount�v 0 error_message  � �V�U�T
�V 
errn�U 0 error_number  �T  �u 0 
error_text  
�t 
Kerb
�s 
ExGI
�r 
meCn
�q 
pFrN
�p 
pLsN
�o 
radd
�n 
type
�m EATyeWrk
�l 
EmAd
�k 
Dptm
�j 
Ofic
�i 
Cmpy
�h 
bsNm
�g 
mbNm
�f 
bFax
�e 
pTtl
�d 
bStA
�c 
bCty
�b 
bSta
�a 
bZip
�` 
bCou
�_ 
bsWP
�^ 
pMSD
�] 
pCSD
�\ 
pABD
�[ 
savo
�Z savono  
�Y .aevtquitnull��� ��� null
�X .sysodelanull��� ��� nmbr
�W 
badm��=�j E�O�j E�O�� 
 �� �& fEc  
Y hO�E�O�E�O�E�O�E�Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa E` Oa  E` !Oa "E` #Oa $E` %Ob  
e � 4a &j E` 'Ob  e  _ 'a (%Ec  Y a )Ec  W EX * +b  _ ,%_ ,%a -%a .a /a 0a 1kva 2a 3kva 4a 5a 6 7O)a 8a 9lhO &a :kv_ ;a <,FOa =_ '%a >%j E` ?W EX * +b  _ ,%_ ,%a @%a .a /a 0a Akva 2a Bkva 4a Ca 6 7O)a 8a 9lhOwk_ ?a D-j Ekh  a Fkv_ ;a <,FO_ ?a D�/a G P _ ?a D�/a Hl/Ec  W 4X * +a Ikv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&Ec  Y hOa Lkv_ ;a <,FO_ ?a D�/a M L _ ?a D�/a Hl/E` #W 2X * +a Nkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` #Y hOa Okv_ ;a <,FO_ ?a D�/a P L _ ?a D�/a Hl/E` W 2X * +a Qkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa Rkv_ ;a <,FO_ ?a D�/a S H _ ?a D�/a Hl/E�W 0X * +a Tkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E�Y hOa Ukv_ ;a <,FO_ ?a D�/a V H _ ?a D�/a Hl/E�W 0X * +a Wkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E�Y hOa Xkv_ ;a <,FO_ ?a D�/a Y P _ ?a D�/a Hl/Ec  W 4X * +a Zkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&Ec  Y hOa [kv_ ;a <,FO_ ?a D�/a \ L _ ?a D�/a Hl/E` %W 2X * +a ]kv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` %Y hOa ^kv_ ;a <,FO_ ?a D�/a _ L _ ?a D�/a Hl/E` W 2X * +a `kv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa akv_ ;a <,FO_ ?a D�/a b L _ ?a D�/a Hl/E` W 2X * +a ckv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa dkv_ ;a <,FO_ ?a D�/a e H _ ?a D�/a Hl/E�W 0X * +a fkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E�Y hOa gkv_ ;a <,FO_ ?a D�/a h L _ ?a D�/a Hl/E` W 2X * +a ikv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa jkv_ ;a <,FO_ ?a D�/a k H _ ?a D�/a Hl/E�W 0X * +a lkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E�Y hOa mkv_ ;a <,FO_ ?a D�/a n L _ ?a D�/a Hl/E` W 2X * +a okv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa pkv_ ;a <,FO_ ?a D�/a q L _ ?a D�/a Hl/E` W 2X * +a rkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa skv_ ;a <,FO_ ?a D�/a t L _ ?a D�/a Hl/E` !W 2X * +a ukv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` !Y hOa vkv_ ;a <,FO_ ?a D�/a w P _ ?a D�/a Hl/Ec  W 4X * +a xkv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&Ec  Y hOa ykv_ ;a <,FO_ ?a D�/a z L _ ?a D�/a Hl/E` W 2X * +a {kv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOa |kv_ ;a <,FO_ ?a D�/a } L _ ?a D�/a Hl/E` W 2X * +a ~kv_ ;a <,FO_ ?a D�k/[a J\[Zl\62a K&E` Y hOP[OY��Oa a �lv_ ;a <,FO _ ?a Hl/E` �W X * +hOa �kv_ ;a <,FOb  a �  Cb  _ ,%_ ,%a �%a .a /a 0a �kva 2a �kva 4a �a 6 7O)a 8a 9lhY hOPYQb  k 	 b  k �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hi/E�Ob  a Hk/a �k/E�Oa �_ ;a <,FO�a �%�%a �%b  %Ec  OPY�b  k 	 b  l �& u*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hk/a �k/E�Ob  a Hi/E�Oa �_ ;a <,FO�a �%�%a �%b  %Ec  OPY?b  l 	 b  k �& o*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hi/E�Ob  a Hk/a �k/E�Oa �_ ;a <,FO�a �%b  %Ec  OPY�b  l 	 b  l �& o*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hk/a �k/E�Ob  a Hi/E�Oa �_ ;a <,FO�a �%b  %Ec  OPY9b  m 	 b  k �& v*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hi/E�Ob  a Hk/a �k/E�Oa �_ ;a <,FO�a Jk/�%a �%b  %Ec  OPY�b  m 	 b  l �& v*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hk/a �k/E�Ob  a Hi/E�Oa �_ ;a <,FO�a Jk/�%a �%b  %Ec  OPY%b  a � 	 b  k �& s*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hi/E�Ob  a Hk/a �k/E�Oa �_ ;a <,FOb  a �%b  %Ec  OPY�b  a � 	 b  l �& s*j �a �,Ec  O*j �a �,Ec  Oa �_ ;a <,FOb  a Hk/a �k/E�Ob  a Hi/E�Oa �_ ;a <,FOb  a �%b  %Ec  OPYb  a � 	 b  k �&� Ahb  a � a �a �a �l 7a �,Ec  Ob  a �  a �j �Y h[OY��O 5h�a � a �a �a �l 7a �,E�O�a �  a �j �Y h[OY��O 5h�a � a �a �a �l 7a �,E�O�a �  a �j �Y h[OY��O�a �%�%Ec  Oa �E` �O Zh_ �a � a �a 0a �a �lva 2a �a � 7a �,E` �O_ �a �  _ �a �%Ec  Y _ �a �%Ec  [OY��O �hb  a � _ �a �  �a �%�%a �%Ec  Y �a �%�%a �%Ec  Oa �_ ,%b  %a �b  a 0a �a �lva 2a �a � 7a �,Ec  Ob  a �  a �j �Y h[OY�uOPY Bb  _ ,%_ ,%a �%a .a /a 0a �kva 2a �kva 4a �a 6 7O)a 8a 9lhOPOa � b  *a �,FW X * +hO b  *a �,FW X * +hOb  e  hY hOb  e  Ea �a �b  a .ka 4a �a 0a �a �lva 2a �kva � 7E` �O_ �a �,Ec  Y hO �*a �a �a �a �a �b  %a �b  b  %a �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  a �b  	a �b  a �b  a �a � �E` �W rX � �a ��%a �%�%E` �O_ �a 0a �kva 2ka � 7O_ �Ob  _ ,%_ ,%a �%a .a /a 0a �kva 2a �kva 4a �a 6 7O)a 8a 9lhOPOb   e  i b   _ �a ,FO_ �_ �a,FW GX * +b  _ ,%_ ,%a%a .a /a 0akva 2akva 4aa 6 7O)a 8a 9lhOPY hO�*a,a,FO�*a,a,FOa	b  a
aa �*a,a,FO�*a,a,FO�*a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ *a,a,FO_ !*a,a,FO_ #*a,a,FO_ %*a,a,FOe*a,FOe*a,FOe*a,FOPUOa � *aalUOkj Oa!j Oa"j Oa#a$el Oa � *aalUOkj Oa%j ascr  ��ޭ