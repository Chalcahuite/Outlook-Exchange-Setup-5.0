FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��

--------------------------------------------
Outlook Exchange Setup 5
� Copyright 2008-2016 William Smith
bill@officeformachelp.com

Except where otherwise noted, this work is licensed under
http://creativecommons.org/licenses/by/4.0/

This file is one of four files for assisting a user with configuring
an Exchange account in Microsoft Outlook 2016 for Mac:

1. Outlook Exchange Setup 5.4.0.scpt
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
Consult the Outlook Exchange Setup 5 Administrator's Guide
for complete details.

1.	Customize the "network and  server properties" below with information
	appropriate to your network.
	
2.	Deploy this script to a location on your Macs such as
	"/Library/CompanyName/OutlookExchangeSetup5.4.0.scpt".

3. 	Deploy the recommended "Outlook preferences.mobileconfig"
	configuration profile to eliminate Outlook's startup windows.
	This assumes you're using the volume license edition
	of Office 2016 for Mac.
	
4.	Deploy the OutlookExchangeSetup5.plist file to
	/Library/LaunchAgents. Update the path to point to the
	OutlookExchangeSetup5.4.0.scpt script.
	  
This script assumes the user's full name is in the form of "Last, First",
but is easily modified if the full name is in the form of "First Last".
It works especially well if the Mac is bound to Active Directory where
the user's short name will match his login name. Optionally, you cans set dscl
to pull the user's EMailAddress from a directory service.

     � 	 	� 
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 O u t l o o k   E x c h a n g e   S e t u p   5 
 �   C o p y r i g h t   2 0 0 8 - 2 0 1 6   W i l l i a m   S m i t h 
 b i l l @ o f f i c e f o r m a c h e l p . c o m 
 
 E x c e p t   w h e r e   o t h e r w i s e   n o t e d ,   t h i s   w o r k   i s   l i c e n s e d   u n d e r 
 h t t p : / / c r e a t i v e c o m m o n s . o r g / l i c e n s e s / b y / 4 . 0 / 
 
 T h i s   f i l e   i s   o n e   o f   f o u r   f i l e s   f o r   a s s i s t i n g   a   u s e r   w i t h   c o n f i g u r i n g 
 a n   E x c h a n g e   a c c o u n t   i n   M i c r o s o f t   O u t l o o k   2 0 1 6   f o r   M a c : 
 
 1 .   O u t l o o k   E x c h a n g e   S e t u p   5 . 4 . 0 . s c p t 
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
 C o n s u l t   t h e   O u t l o o k   E x c h a n g e   S e t u p   5   A d m i n i s t r a t o r ' s   G u i d e 
 f o r   c o m p l e t e   d e t a i l s . 
 
 1 . 	 C u s t o m i z e   t h e   " n e t w o r k   a n d     s e r v e r   p r o p e r t i e s "   b e l o w   w i t h   i n f o r m a t i o n 
 	 a p p r o p r i a t e   t o   y o u r   n e t w o r k . 
 	 
 2 . 	 D e p l o y   t h i s   s c r i p t   t o   a   l o c a t i o n   o n   y o u r   M a c s   s u c h   a s 
 	 " / L i b r a r y / C o m p a n y N a m e / O u t l o o k E x c h a n g e S e t u p 5 . 4 . 0 . s c p t " . 
 
 3 .   	 D e p l o y   t h e   r e c o m m e n d e d   " O u t l o o k   p r e f e r e n c e s . m o b i l e c o n f i g " 
 	 c o n f i g u r a t i o n   p r o f i l e   t o   e l i m i n a t e   O u t l o o k ' s   s t a r t u p   w i n d o w s . 
 	 T h i s   a s s u m e s   y o u ' r e   u s i n g   t h e   v o l u m e   l i c e n s e   e d i t i o n 
 	 o f   O f f i c e   2 0 1 6   f o r   M a c . 
 	 
 4 . 	 D e p l o y   t h e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   t o 
 	 / L i b r a r y / L a u n c h A g e n t s .   U p d a t e   t h e   p a t h   t o   p o i n t   t o   t h e 
 	 O u t l o o k E x c h a n g e S e t u p 5 . 4 . 0 . s c p t   s c r i p t . 
 	     
 T h i s   s c r i p t   a s s u m e s   t h e   u s e r ' s   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " L a s t ,   F i r s t " , 
 b u t   i s   e a s i l y   m o d i f i e d   i f   t h e   f u l l   n a m e   i s   i n   t h e   f o r m   o f   " F i r s t   L a s t " . 
 I t   w o r k s   e s p e c i a l l y   w e l l   i f   t h e   M a c   i s   b o u n d   t o   A c t i v e   D i r e c t o r y   w h e r e 
 t h e   u s e r ' s   s h o r t   n a m e   w i l l   m a t c h   h i s   l o g i n   n a m e .   O p t i o n a l l y ,   y o u   c a n s   s e t   d s c l 
 t o   p u l l   t h e   u s e r ' s   E M a i l A d d r e s s   f r o m   a   d i r e c t o r y   s e r v i c e . 
 
   
  
 l     ��������  ��  ��        l     ��  ��      global logMesage     �   "   g l o b a l   l o g M e s a g e      l     ��������  ��  ��        l     ��  ��    0 *------------------------------------------     �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -      l     ��  ��    , & Begin network, server and preferences     �   L   B e g i n   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s      l     ��   ��    0 *------------------------------------------      � ! ! T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   " # " l     ��������  ��  ��   #  $ % $ l     ��������  ��  ��   %  & ' & l     �� ( )��   ( C =------------- Exchange Server settings ----------------------    ) � * * z - - - - - - - - - - - - -   E x c h a n g e   S e r v e r   s e t t i n g s   - - - - - - - - - - - - - - - - - - - - - - '  + , + l     ��������  ��  ��   ,  - . - j     �� /�� 0 usekerberos useKerberos / m     ��
�� boovtrue .  0 1 0 l     �� 2 3��   2 B < Set this to true only if Macs in your environment are bound    3 � 4 4 x   S e t   t h i s   t o   t r u e   o n l y   i f   M a c s   i n   y o u r   e n v i r o n m e n t   a r e   b o u n d 1  5 6 5 l     �� 7 8��   7 C = to Active Directory and your network is properly configured.    8 � 9 9 z   t o   A c t i v e   D i r e c t o r y   a n d   y o u r   n e t w o r k   i s   p r o p e r l y   c o n f i g u r e d . 6  : ; : l     ��������  ��  ��   ;  < = < j    �� >��  0 exchangeserver ExchangeServer > m     ? ? � @ @ ( e x c h a n g e . e x a m p l e . c o m =  A B A l     �� C D��   C 6 0 Address of your organization's Exchange server.    D � E E `   A d d r e s s   o f   y o u r   o r g a n i z a t i o n ' s   E x c h a n g e   s e r v e r . B  F G F l     ��������  ��  ��   G  H I H j    �� J�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL J m    ��
�� boovtrue I  K L K l     �� M N��   M   True for most servers.    N � O O .   T r u e   f o r   m o s t   s e r v e r s . L  P Q P l     ��������  ��  ��   Q  R S R j   	 �� T�� .0 exchangeserversslport ExchangeServerSSLPort T m   	 
����� S  U V U l     �� W X��   W @ : If ExchangeServerRequiresSSL is true set the port to 443.    X � Y Y t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   4 4 3 . V  Z [ Z l     �� \ ]��   \ @ : If ExchangeServerRequiresSSL is false set the port to 80.    ] � ^ ^ t   I f   E x c h a n g e S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   8 0 . [  _ ` _ l     �� a b��   a L F Use a different port number only if your administrator instructs you.    b � c c �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   a d m i n i s t r a t o r   i n s t r u c t s   y o u . `  d e d l     ��������  ��  ��   e  f g f j    �� h�� "0 directoryserver DirectoryServer h m     i i � j j  g c . e x a m p l e . c o m g  k l k l     �� m n��   m Z T Address of an internal Global Catalog server (a type of Windows domain controller).    n � o o �   A d d r e s s   o f   a n   i n t e r n a l   G l o b a l   C a t a l o g   s e r v e r   ( a   t y p e   o f   W i n d o w s   d o m a i n   c o n t r o l l e r ) . l  p q p l     �� r s��   r L F The LDAP server in a Windows network will be a Global Catalog server,    s � t t �   T h e   L D A P   s e r v e r   i n   a   W i n d o w s   n e t w o r k   w i l l   b e   a   G l o b a l   C a t a l o g   s e r v e r , q  u v u l     �� w x��   w 2 , which is separate from the Exchange Server.    x � y y X   w h i c h   i s   s e p a r a t e   f r o m   t h e   E x c h a n g e   S e r v e r . v  z { z l     ��������  ��  ��   {  | } | j    �� ~�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication ~ m    ��
�� boovtrue }   �  l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 80 directoryserverrequiresssl DirectoryServerRequiresSSL � m    ��
�� boovtrue �  � � � l     �� � ���   � ' ! This will almost always be true.    � � � � B   T h i s   w i l l   a l m o s t   a l w a y s   b e   t r u e . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 00 directoryserversslport DirectoryServerSSLPort � m    ����� �  � � � l     �� � ���   � B < If DirectoryServerRequiresSSL is true set the port to 3269.    � � � � x   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   t r u e   s e t   t h e   p o r t   t o   3 2 6 9 . �  � � � l     �� � ���   � C = If DirectoryServerRequiresSSL is false set the port to 3268.    � � � � z   I f   D i r e c t o r y S e r v e r R e q u i r e s S S L   i s   f a l s e   s e t   t h e   p o r t   t o   3 2 6 8 . �  � � � l     �� � ���   � U O Use a different port number only if your Exchange administrator instructs you.    � � � � �   U s e   a   d i f f e r e n t   p o r t   n u m b e r   o n l y   i f   y o u r   E x c h a n g e   a d m i n i s t r a t o r   i n s t r u c t s   y o u . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� >0 directoryservermaximumresults DirectoryServerMaximumResults � m    ����� �  � � � l     �� � ���   � G A When searching the Global Catalog server, this number determines    � � � � �   W h e n   s e a r c h i n g   t h e   G l o b a l   C a t a l o g   s e r v e r ,   t h i s   n u m b e r   d e t e r m i n e s �  � � � l     �� � ���   � 0 * the maximum number of entries to display.    � � � � T   t h e   m a x i m u m   n u m b e r   o f   e n t r i e s   t o   d i s p l a y . �  � � � l     ��������  ��  ��   �  � � � j    �� ��� 60 directoryserversearchbase DirectoryServerSearchBase � m     � � � � �   �  � � � l     �� � ���   � + % example: "cn=users,dc=domain,dc=com"    � � � � J   e x a m p l e :   " c n = u s e r s , d c = d o m a i n , d c = c o m " �  � � � l     �� � ���   �   Usually, this is empty.    � � � � 0   U s u a l l y ,   t h i s   i s   e m p t y . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >------------- For Active Directory users ---------------------    � � � � | - - - - - - - - - - - - -   F o r   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j     �� ��� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory � m    ��
�� boovtrue �  � � � l     �� � ���   � B < If Macs are bound to Active Directory they can probably use    � � � � x   I f   M a c s   a r e   b o u n d   t o   A c t i v e   D i r e c t o r y   t h e y   c a n   p r o b a b l y   u s e �  � � � l     �� � ���   � Q K dscl to return the current user's email address, phone number, title, etc.    � � � � �   d s c l   t o   r e t u r n   t h e   c u r r e n t   u s e r ' s   e m a i l   a d d r e s s ,   p h o n e   n u m b e r ,   t i t l e ,   e t c . �  � � � l     �� � ���   � O I Use Active Directory when possible, otherwise complete the next section.    � � � � �   U s e   A c t i v e   D i r e c t o r y   w h e n   p o s s i b l e ,   o t h e r w i s e   c o m p l e t e   t h e   n e x t   s e c t i o n . �  � � � l     ��������  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � B <------------- For non Active Directory users ---------------    � � � � x - - - - - - - - - - - - -   F o r   n o n   A c t i v e   D i r e c t o r y   u s e r s   - - - - - - - - - - - - - - - �  � � � l     ��������  ��  ��   �  � � � j   ! %�� ��� 0 
domainname 
domainName � m   ! $ � � � � �  e x a m p l e . c o m �  � � � l     �� � ���   � P J Complete this only if not using Active Directory to get user information.    � � � � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n . �  � � � l     �� � ���   � L F The part of your organization's email address following the @ symbol.    � � � � �   T h e   p a r t   o f   y o u r   o r g a n i z a t i o n ' s   e m a i l   a d d r e s s   f o l l o w i n g   t h e   @   s y m b o l . �  � � � l     ��������  ��  ��   �  � � � j   & (�� ��� 0 emailformat emailFormat � m   & '����  �  � � � l     �� ��    P J Complete this only if not using Active Directory to get user information.    � �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n . �  l     ����   P J When Active Directory is unavailable to determine a user's email address,    � �   W h e n   A c t i v e   D i r e c t o r y   i s   u n a v a i l a b l e   t o   d e t e r m i n e   a   u s e r ' s   e m a i l   a d d r e s s , 	 l     ��
��  
 V P this script will attempt to parse it from the display name of the user's login.    � �   t h i s   s c r i p t   w i l l   a t t e m p t   t o   p a r s e   i t   f r o m   t h e   d i s p l a y   n a m e   o f   t h e   u s e r ' s   l o g i n .	  l     ��������  ��  ��    l     ����   1 + Describe your organization's email format:    � V   D e s c r i b e   y o u r   o r g a n i z a t i o n ' s   e m a i l   f o r m a t :  l     ����   / ) 1: Email format is first.last@domain.com    � R   1 :   E m a i l   f o r m a t   i s   f i r s t . l a s t @ d o m a i n . c o m  l     ����   * $ 2: Email format is first@domain.com    � H   2 :   E m a i l   f o r m a t   i s   f i r s t @ d o m a i n . c o m  l     �� !��    N H 3: Email format is flast@domain.com (first name initial plus last name)   ! �"" �   3 :   E m a i l   f o r m a t   i s   f l a s t @ d o m a i n . c o m   ( f i r s t   n a m e   i n i t i a l   p l u s   l a s t   n a m e ) #$# l     �%&�  % . ( 4: Email format is shortName@domain.com   & �'' P   4 :   E m a i l   f o r m a t   i s   s h o r t N a m e @ d o m a i n . c o m$ ()( l     �~�}�|�~  �}  �|  ) *+* j   ) +�{,�{ 0 displayname displayName, m   ) *�z�z + -.- l     �y/0�y  / P J Complete this only if not using Active Directory to get user information.   0 �11 �   C o m p l e t e   t h i s   o n l y   i f   n o t   u s i n g   A c t i v e   D i r e c t o r y   t o   g e t   u s e r   i n f o r m a t i o n .. 232 l     �x45�x  4 M G Describe how the user's display name appears at the bottom of the menu   5 �66 �   D e s c r i b e   h o w   t h e   u s e r ' s   d i s p l a y   n a m e   a p p e a r s   a t   t h e   b o t t o m   o f   t h e   m e n u3 787 l     �w9:�w  9 R L when clicking the Apple menu (Log Out Joe Cool... or Log Out Cool, Joe...).   : �;; �   w h e n   c l i c k i n g   t h e   A p p l e   m e n u   ( L o g   O u t   J o e   C o o l . . .   o r   L o g   O u t   C o o l ,   J o e . . . ) .8 <=< l     �v>?�v  > / ) 1: Display name appears as "Last, First"   ? �@@ R   1 :   D i s p l a y   n a m e   a p p e a r s   a s   " L a s t ,   F i r s t "= ABA l     �uCD�u  C . ( 2: Display name appears as "First Last"   D �EE P   2 :   D i s p l a y   n a m e   a p p e a r s   a s   " F i r s t   L a s t "B FGF l     �t�s�r�t  �s  �r  G HIH j   , 0�qJ�q 0 domainprefix domainPrefixJ m   , /KK �LL  I MNM l     �pOP�p  O Y S Optionally append a NetBIOS domain name to the beginning of the user's short name.   P �QQ �   O p t i o n a l l y   a p p e n d   a   N e t B I O S   d o m a i n   n a m e   t o   t h e   b e g i n n i n g   o f   t h e   u s e r ' s   s h o r t   n a m e .N RSR l     �oTU�o  T 9 3 Be sure to use two backslashes when adding a name.   U �VV f   B e   s u r e   t o   u s e   t w o   b a c k s l a s h e s   w h e n   a d d i n g   a   n a m e .S WXW l     �nYZ�n  Y N H Example: Use "TALKINGMOOSE\\" to set user name "TALKINGMOOSE\username".   Z �[[ �   E x a m p l e :   U s e   " T A L K I N G M O O S E \ \ "   t o   s e t   u s e r   n a m e   " T A L K I N G M O O S E \ u s e r n a m e " .X \]\ l     �m�l�k�m  �l  �k  ] ^_^ l     �j�i�h�j  �i  �h  _ `a` l     �gbc�g  b C =------------- User Experience -------------------------------   c �dd z - - - - - - - - - - - - -   U s e r   E x p e r i e n c e   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -a efe l     �f�e�d�f  �e  �d  f ghg j   1 3�ci�c (0 verifyemailaddress verifyEMailAddressi m   1 2�b
�b boovfalsh jkj l     �alm�a  l M G If set to "true", a dialog asks the user to confirm his email address.   m �nn �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   e m a i l   a d d r e s s .k opo l     �`�_�^�`  �_  �^  p qrq j   4 8�]s�] *0 verifyserveraddress verifyServerAddresss m   4 5�\
�\ boovfalsr tut l     �[vw�[  v W Q If set to "true", a dialog asks the user to confirm his Exchange server address.   w �xx �   I f   s e t   t o   " t r u e " ,   a   d i a l o g   a s k s   t h e   u s e r   t o   c o n f i r m   h i s   E x c h a n g e   s e r v e r   a d d r e s s .u yzy l     �Z�Y�X�Z  �Y  �X  z {|{ j   9 =�W}�W *0 displaydomainprefix displayDomainPrefix} m   9 :�V
�V boovfals| ~~ l     �U���U  � C = If set to "true", the username appears as "DOMAIN\username".   � ��� z   I f   s e t   t o   " t r u e " ,   t h e   u s e r n a m e   a p p e a r s   a s   " D O M A I N \ u s e r n a m e " . ��� l     �T���T  � 5 / Otherwise, the username appears as "username".   � ��� ^   O t h e r w i s e ,   t h e   u s e r n a m e   a p p e a r s   a s   " u s e r n a m e " .� ��� l     �S�R�Q�S  �R  �Q  � ��� j   > B�P��P *0 downloadheadersonly downloadHeadersOnly� m   > ?�O
�O boovfals� ��� l     �N���N  � H B If set to "true", only email headers are downloaded into Outlook.   � ��� �   I f   s e t   t o   " t r u e " ,   o n l y   e m a i l   h e a d e r s   a r e   d o w n l o a d e d   i n t o   O u t l o o k .� ��� l     �M���M  � B < This takes much less time to sync but a user must be online   � ��� x   T h i s   t a k e s   m u c h   l e s s   t i m e   t o   s y n c   b u t   a   u s e r   m u s t   b e   o n l i n e� ��� l     �L���L  � %  to download and view messages.   � ��� >   t o   d o w n l o a d   a n d   v i e w   m e s s a g e s .� ��� l     �K�J�I�K  �J  �I  � ��� j   C G�H��H 20 hideonmycomputerfolders hideOnMyComputerFolders� m   C D�G
�G boovfals� ��� l     �F���F  � - ' If set to "true", hides local folders.   � ��� N   I f   s e t   t o   " t r u e " ,   h i d e s   l o c a l   f o l d e r s .� ��� l     �E���E  � ; 5 A single Exchange account should do this by default.   � ��� j   A   s i n g l e   E x c h a n g e   a c c o u n t   s h o u l d   d o   t h i s   b y   d e f a u l t .� ��� l     �D�C�B�D  �C  �B  � ��� j   H L�A��A 0 unifiedinbox unifiedInbox� m   H I�@
�@ boovfals� ��� l     �?���?  � C = If set to "true", turns on the Group Similar Folders feature   � ��� z   I f   s e t   t o   " t r u e " ,   t u r n s   o n   t h e   G r o u p   S i m i l a r   F o l d e r s   f e a t u r e� ��� l     �>���>  � / ) in Outlook menu > Preferences > General.   � ��� R   i n   O u t l o o k   m e n u   >   P r e f e r e n c e s   >   G e n e r a l .� ��� l     �=�<�;�=  �<  �;  � ��� j   M Q�:��: *0 disableautodiscover disableAutodiscover� m   M N�9
�9 boovfals� ��� l     �8���8  � < 6 If set to "true", disables Autodiscover functionality   � ��� l   I f   s e t   t o   " t r u e " ,   d i s a b l e s   A u t o d i s c o v e r   f u n c t i o n a l i t y� ��� l     �7���7  � C = for the Exchange account. Not recommended for mobile devices   � ��� z   f o r   t h e   E x c h a n g e   a c c o u n t .   N o t   r e c o m m e n d e d   f o r   m o b i l e   d e v i c e s� ��� l     �6���6  � B < that may connect to an internal Exchange server address and   � ��� x   t h a t   m a y   c o n n e c t   t o   a n   i n t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s   a n d� ��� l     �5���5  � ? 9 connect to a different external Exchange server address.   � ��� r   c o n n e c t   t o   a   d i f f e r e n t   e x t e r n a l   E x c h a n g e   s e r v e r   a d d r e s s .� ��� l     �4�3�2�4  �3  �2  � ��� j   R X�1��1 0 errormessage errorMessage� m   R U�� ��� � O u t l o o k ' s   s e t u p   f o r   y o u r   E x c h a n g e   a c c o u n t   f a i l e d .   P l e a s e   c o n t a c t   t h e   H e l p   D e s k   f o r   a s s i s t a n c e .� ��� l     �0���0  � T N Customize this error message for your users in case their account setup fails   � ��� �   C u s t o m i z e   t h i s   e r r o r   m e s s a g e   f o r   y o u r   u s e r s   i n   c a s e   t h e i r   a c c o u n t   s e t u p   f a i l s� ��� l     �/�.�-�/  �.  �-  � ��� l     �,���,  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �+���+  � * $ End network, server and preferences   � ��� H   E n d   n e t w o r k ,   s e r v e r   a n d   p r e f e r e n c e s� ��� l     �*���*  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �)�(�'�)  �(  �'  � ��� l     �&���&  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     �%���%  �   Begin log file setup   � ��� *   B e g i n   l o g   f i l e   s e t u p� ��� l     �$���$  � 0 *------------------------------------------   � �   T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -�  l     �#�"�!�#  �"  �!    l     � �    < 6 create the log file in the current user's Logs folder    � l   c r e a t e   t h e   l o g   f i l e   i n   t h e   c u r r e n t   u s e r ' s   L o g s   f o l d e r 	 l     ����  �  �  	 

 l    �� I     ��� 0 writelog writeLog � m     � D S t a r t i n g   E x c h a n g e   a c c o u n t   s e t u p . . .�  �  �  �    l   �� I    ��� 0 writelog writeLog � b     m    	 �  S c r i p t :   n   	  1   
 �
� 
pnam  f   	 
�  �  �  �    l   �� I    ��� 0 writelog writeLog  �  o    �
� 
ret �  �  �  �   !"! l     ��
�	�  �
  �	  " #$# l     �%&�  % 0 *------------------------------------------   & �'' T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -$ ()( l     �*+�  *   End log file setup    + �,, (   E n d   l o g   f i l e   s e t u p  ) -.- l     �/0�  / 0 *------------------------------------------   0 �11 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -. 232 l     ����  �  �  3 454 l     �67�  6 0 *------------------------------------------   7 �88 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -5 9:9 l     �;<�  ; &   Begin logging script properties   < �== @   B e g i n   l o g g i n g   s c r i p t   p r o p e r t i e s: >?> l     � @A�   @ 0 *------------------------------------------   A �BB T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -? CDC l     ��������  ��  ��  D EFE l   G����G I    ��H���� 0 writelog writeLogH I��I m    JJ �KK & S e t u p   p r o p e r t i e s . . .��  ��  ��  ��  F LML l    ,N����N I     ,��O���� 0 writelog writeLogO P��P b   ! (QRQ m   ! "SS �TT  U s e   K e r b e r o s :  R o   " '���� 0 usekerberos useKerberos��  ��  ��  ��  M UVU l  - 9W����W I   - 9��X���� 0 writelog writeLogX Y��Y b   . 5Z[Z m   . /\\ �]] " E x c h a n g e   S e r v e r :  [ o   / 4����  0 exchangeserver ExchangeServer��  ��  ��  ��  V ^_^ l  : F`����` I   : F��a���� 0 writelog writeLoga b��b b   ; Bcdc m   ; <ee �ff < E x c h a n g e   S e r v e r   R e q u i r e s   S S L :  d o   < A���� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL��  ��  ��  ��  _ ghg l  G Si����i I   G S��j���� 0 writelog writeLogj k��k b   H Olml m   H Inn �oo , E x c h a n g e   S e r v e r   P o r t :  m o   I N���� .0 exchangeserversslport ExchangeServerSSLPort��  ��  ��  ��  h pqp l  T `r����r I   T `��s���� 0 writelog writeLogs t��t b   U \uvu m   U Vww �xx $ D i r e c t o r y   S e r v e r :  v o   V [���� "0 directoryserver DirectoryServer��  ��  ��  ��  q yzy l  a m{����{ I   a m��|���� 0 writelog writeLog| }��} b   b i~~ m   b c�� ��� T D i r e c t o r y   S e r v e r   R e q u i r e s   A u t h e n t i c a t i o n :   o   c h���� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication��  ��  ��  ��  z ��� l  n z������ I   n z������� 0 writelog writeLog� ���� b   o v��� m   o p�� ��� > D i r e c t o r y   S e r v e r   R e q u i r e s   S S L :  � o   p u���� 80 directoryserverrequiresssl DirectoryServerRequiresSSL��  ��  ��  ��  � ��� l  { ������� I   { �������� 0 writelog writeLog� ���� b   | ���� m   | }�� ��� 6 D i r e c t o r y   S e r v e r   S S L   P o r t :  � o   } ����� 00 directoryserversslport DirectoryServerSSLPort��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� D D i r e c t o r y   S e r v e r   M a x i m u m   R e s u l t s :  � o   � ����� >0 directoryservermaximumresults DirectoryServerMaximumResults��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� < D i r e c t o r y   S e r v e r   S e a r c h   B a s e :  � o   � ����� 60 directoryserversearchbase DirectoryServerSearchBase��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ��� X G e t   U s e r   I n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y :  � o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory��  ��  ��  ��  � ��� l  � ������� I   � �������� 0 writelog writeLog� ���� o   � ���
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l  ������� Z   �������� =  � ���� o   � ����� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m   � ���
�� boovfals� k   ��� ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D o m a i n   N a m e :  � o   � ����� 0 
domainname 
domainName��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  E m a i l   f o r m a t :  � o   � ����� 0 emailformat emailFormat��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D i s p l a y   N a m e :  � o   � ����� 0 displayname displayName��  ��  � ��� I   � �������� 0 writelog writeLog� ���� b   � ���� m   � ��� ���  D o m a i n   P r e f i x :  � o   � ����� 0 domainprefix domainPrefix��  ��  � ���� I   �������� 0 writelog writeLog� ���� o   � ��
�� 
ret ��  ��  ��  ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l 	������ I  	������� 0 writelog writeLog� ���� b  
��� m  
�� ��� , V e r i f y   E m a i l   A d d r e s s :  � o  ���� (0 verifyemailaddress verifyEMailAddress��  ��  ��  ��  � ��� l &������ I  &������� 0 writelog writeLog� ���� b  "��� m  �� ��� . V e r i f y   S e r v e r   A d d r e s s :  � o  !���� *0 verifyserveraddress verifyServerAddress��  ��  ��  ��  � ��� l '5������ I  '5������ 0 writelog writeLog� ��~� b  (1��� m  (+�� ��� . D i s p l a y   D o m a i n   P r e f i x :  � o  +0�}�} *0 displaydomainprefix displayDomainPrefix�~  �  ��  ��  � ��� l 6D �|�{  I  6D�z�y�z 0 writelog writeLog �x b  7@ m  7: � . D o w n l o a d   H e a d e r s   O n l y :   o  :?�w�w *0 downloadheadersonly downloadHeadersOnly�x  �y  �|  �{  �  l ES	�v�u	 I  ES�t
�s�t 0 writelog writeLog
 �r b  FO m  FI � : H i d e   O n   M y   C o m p u t e r   F o l d e r s :   o  IN�q�q 20 hideonmycomputerfolders hideOnMyComputerFolders�r  �s  �v  �u    l Tb�p�o I  Tb�n�m�n 0 writelog writeLog �l b  U^ m  UX �  U n i f i e d   I n b o x :   o  X]�k�k 0 unifiedinbox unifiedInbox�l  �m  �p  �o    l cq�j�i I  cq�h�g�h 0 writelog writeLog �f b  dm m  dg   �!! , D i s a b l e   A u t o d i s c o v e r :   o  gl�e�e *0 disableautodiscover disableAutodiscover�f  �g  �j  �i   "#" l r�$�d�c$ I  r��b%�a�b 0 writelog writeLog% &�`& b  s|'(' m  sv)) �** ( E r r o r   M e s s a g e   t e x t :  ( o  v{�_�_ 0 errormessage errorMessage�`  �a  �d  �c  # +,+ l ��-�^�]- I  ���\.�[�\ 0 writelog writeLog. /�Z/ o  ���Y
�Y 
ret �Z  �[  �^  �]  , 010 l     �X�W�V�X  �W  �V  1 232 l     �U45�U  4 0 *------------------------------------------   5 �66 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -3 787 l     �T9:�T  9 %  End logging script properties    : �;; >   E n d   l o g g i n g   s c r i p t   p r o p e r t i e s  8 <=< l     �S>?�S  > 0 *------------------------------------------   ? �@@ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -= ABA l     �R�Q�P�R  �Q  �P  B CDC l     �OEF�O  E 0 *------------------------------------------   F �GG T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -D HIH l     �NJK�N  J ( " Begin collecting user information   K �LL D   B e g i n   c o l l e c t i n g   u s e r   i n f o r m a t i o nI MNM l     �MOP�M  O 0 *------------------------------------------   P �QQ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -N RSR l     �L�K�J�L  �K  �J  S TUT l     �IVW�I  V R L attempt to read information from Active Directory for the Me Contact record   W �XX �   a t t e m p t   t o   r e a d   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y   f o r   t h e   M e   C o n t a c t   r e c o r dU YZY l     �H�G�F�H  �G  �F  Z [\[ l ��]�E�D] r  ��^_^ m  ��`` �aa  _ o      �C�C 0 userfirstname userFirstName�E  �D  \ bcb l ��d�B�Ad r  ��efe m  ��gg �hh  f o      �@�@ 0 userlastname userLastName�B  �A  c iji l ��k�?�>k r  ��lml m  ��nn �oo  m o      �=�=  0 userdepartment userDepartment�?  �>  j pqp l ��r�<�;r r  ��sts m  ��uu �vv  t o      �:�: 0 
useroffice 
userOffice�<  �;  q wxw l ��y�9�8y r  ��z{z m  ��|| �}}  { o      �7�7 0 usercompany userCompany�9  �8  x ~~ l ����6�5� r  ����� m  ���� ���  � o      �4�4 0 userworkphone userWorkPhone�6  �5   ��� l ����3�2� r  ����� m  ���� ���  � o      �1�1 0 
usermobile 
userMobile�3  �2  � ��� l ����0�/� r  ����� m  ���� ���  � o      �.�. 0 userfax userFax�0  �/  � ��� l ����-�,� r  ����� m  ���� ���  � o      �+�+ 0 	usertitle 	userTitle�-  �,  � ��� l ����*�)� r  ����� m  ���� ���  � o      �(�( 0 
userstreet 
userStreet�*  �)  � ��� l ����'�&� r  ����� m  ���� ���  � o      �%�% 0 usercity userCity�'  �&  � ��� l ����$�#� r  ����� m  ���� ���  � o      �"�" 0 	userstate 	userState�$  �#  � ��� l ����!� � r  ����� m  ���� ���  � o      ��  0 userpostalcode userPostalCode�!  �   � ��� l ������ r  ����� m  ���� ���  � o      �� 0 usercountry userCountry�  �  � ��� l ������ r  ����� m  ���� ���  � o      �� 0 userwebpage userWebPage�  �  � ��� l     ����  �  �  � ��� l  R���� Z   R����� =  ��� o   �� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory� m  �
� boovtrue� k  

��� ��� l 

����  �  �  � ��� l 

����  � + % Get information from Active Directoy   � ��� J   G e t   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o y� ��� l 

����  �  �  � ��� l 

�
���
  � 3 - get the domain's primary NetBIOS domain name   � ��� Z   g e t   t h e   d o m a i n ' s   p r i m a r y   N e t B I O S   d o m a i n   n a m e� ��� l 

�	���	  �  �  � ��� Q  
~���� k  <�� ��� r  ��� I ���
� .sysoexecTEXT���     TEXT� m  �� ��� � / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y / "   - r e a d   /   S u b N o d e s   |   a w k   ' B E G I N   { F S = " :   " }   { p r i n t   $ 2 } '�  � o      �� 0 netbiosdomain netbiosDomain� ��� Z  <����� =  ��� o  �� *0 displaydomainprefix displayDomainPrefix� m  � 
�  boovtrue� r  #0��� b  #*��� o  #&���� 0 netbiosdomain netbiosDomain� m  &)�� ���  \� o      ���� 0 domainprefix domainPrefix�  � r  3<��� m  36�� ���  � o      ���� 0 domainprefix domainPrefix�  � R      ������
�� .ascrerr ****      � ****��  ��  � k  D~�� ��� l DD��������  ��  ��  �    l DD����     something went wrong    � *   s o m e t h i n g   w e n t   w r o n g  l DD��������  ��  ��    I Ds��	

�� .sysodlogaskr        TEXT	 b  DQ b  DM b  DK o  DI���� 0 errormessage errorMessage o  IJ��
�� 
ret  o  KL��
�� 
ret  m  MP � � U n a b l e   t o   d e t e r m i n e   N E T B I O S   d o m a i n   n a m e .   T h i s   c o m p u t e r   m a y   n o t   b e   b o u n d   t o   A c t i v e   D i r e c t o r y .
 ��
�� 
disp m  TW��
�� stic     ��
�� 
btns J  Z_ �� m  Z] �  O K��   ��
�� 
dflt J  bg �� m  be �    O K��   ��!��
�� 
appr! m  jm"" �## , O u t l o o k   E x c h a n g e   S e t u p��   $��$ R  t~����%
�� .ascrerr ****      � ****��  % ��&��
�� 
errn& m  x{��������  ��  � '(' l ��������  ��  ��  ( )*) l ��+,��  + 7 1 read full user information from Active Directory   , �-- b   r e a d   f u l l   u s e r   i n f o r m a t i o n   f r o m   A c t i v e   D i r e c t o r y* ./. l ��������  ��  ��  / 010 Q  �2342 k  ��55 676 r  ��898 J  ��:: ;��; m  ��<< �==  :  ��  9 n     >?> 1  ����
�� 
txdl? 1  ����
�� 
ascr7 @��@ r  ��ABA I ����C��
�� .sysoexecTEXT���     TEXTC b  ��DED b  ��FGF m  ��HH �II B / u s r / b i n / d s c l   " / A c t i v e   D i r e c t o r y /G o  ������ 0 netbiosdomain netbiosDomainE m  ��JJ �KK� / A l l   D o m a i n s / "   - r e a d   / U s e r s / $ U S E R   A u t h e n t i c a t i o n A u t h o r i t y   C i t y   c o   c o m p a n y   d e p a r t m e n t   p h y s i c a l D e l i v e r y O f f i c e N a m e   s A M A c c o u n t N a m e   w W W H o m e P a g e   E M a i l A d d r e s s   F A X N u m b e r   F i r s t N a m e   J o b T i t l e   L a s t N a m e   M o b i l e N u m b e r   P h o n e N u m b e r   P o s t a l C o d e   R e a l N a m e   S t a t e   S t r e e t��  B o      ���� "0 userinformation userInformation��  3 R      ������
�� .ascrerr ****      � ****��  ��  4 k  ��LL MNM l ����������  ��  ��  N OPO l ����QR��  Q   something went wrong   R �SS *   s o m e t h i n g   w e n t   w r o n gP TUT l ����������  ��  ��  U VWV I ����XY
�� .sysodlogaskr        TEXTX b  ��Z[Z b  ��\]\ b  ��^_^ o  ������ 0 errormessage errorMessage_ o  ����
�� 
ret ] o  ����
�� 
ret [ m  ��`` �aa n U n a b l e   t o   r e a d   u s e r   i n f o r m a t i o n   f r o m   n e t w o r k   d i r e c t o r y .Y ��bc
�� 
dispb m  ����
�� stic    c ��de
�� 
btnsd J  ��ff g��g m  ��hh �ii  O K��  e ��jk
�� 
dfltj J  ��ll m��m m  ��nn �oo  O K��  k ��p��
�� 
apprp m  ��qq �rr , O u t l o o k   E x c h a n g e   S e t u p��  W s��s R  ������t
�� .ascrerr ****      � ****��  t ��u��
�� 
errnu m  ����������  ��  1 vwv l ����������  ��  ��  w xyx Y  �
bz��{|��z k  �
]}} ~~ l ����������  ��  ��   ��� r  ���� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ��
�� 
txdl� 1  ���
�� 
ascr� ��� Z  b������� C ��� n  ��� 4  ���
�� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m  �� ���  E M a i l A d d r e s s :� Q  ^���� r  +��� n  '��� 4  "'���
�� 
citm� m  %&���� � n  "��� 4  "���
�� 
cpar� o   !���� 0 i  � o  ���� "0 userinformation userInformation� o      ���� 0 emailaddress emailAddress� R      ������
�� .ascrerr ****      � ****��  ��  � k  3^�� ��� r  3@��� J  38�� ���� m  36�� ���  ��  � n     ��� 1  ;?��
�� 
txdl� 1  8;��
�� 
ascr� ���� r  A^��� c  AZ��� n  AV��� 7KV����
�� 
cha � m  QS���� �  ;  TU� n  AK��� 4  DK���
�� 
cpar� l GJ������ [  GJ��� o  GH���� 0 i  � m  HI���� ��  ��  � o  AD���� "0 userinformation userInformation� m  VY��
�� 
TEXT� o      ���� 0 emailaddress emailAddress��  ��  ��  � ��� l cc��������  ��  ��  � ��� r  cp��� J  ch�� ���� m  cf�� ���  :  ��  � n     ��� 1  ko��
�� 
txdl� 1  hk��
�� 
ascr� ��� Z  q�������� C q}��� n  qy��� 4  ty���
�� 
cpar� o  wx���� 0 i  � o  qt���� "0 userinformation userInformation� m  y|�� ��� ( d s A t t r T y p e N a t i v e : c o :� Q  ������ r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ���� "0 userinformation userInformation� o      �~�~ 0 usercountry userCountry� R      �}�|�{
�} .ascrerr ****      � ****�|  �{  � k  ���� ��� r  ����� J  ���� ��z� m  ���� ���  �z  � n     ��� 1  ���y
�y 
txdl� 1  ���x
�x 
ascr� ��w� r  ����� c  ����� n  ����� 7���v��
�v 
cha � m  ���u�u �  ;  ��� n  ����� 4  ���t�
�t 
cpar� l ����s�r� [  ����� o  ���q�q 0 i  � m  ���p�p �s  �r  � o  ���o�o "0 userinformation userInformation� m  ���n
�n 
TEXT� o      �m�m 0 usercountry userCountry�w  ��  ��  � ��� l ���l�k�j�l  �k  �j  � ��� r  ����� J  ���� ��i� m  ���� ���  :  �i  � n        1  ���h
�h 
txdl 1  ���g
�g 
ascr�  Z  �4�f�e C �� n  ��	 4  ���d

�d 
cpar
 o  ���c�c 0 i  	 o  ���b�b "0 userinformation userInformation m  �� � 2 d s A t t r T y p e N a t i v e : c o m p a n y : Q  �0 r  �� n  �� 4  ���a
�a 
citm m  ���`�`  n  �� 4  ���_
�_ 
cpar o  ���^�^ 0 i   o  ���]�] "0 userinformation userInformation o      �\�\ 0 usercompany userCompany R      �[�Z�Y
�[ .ascrerr ****      � ****�Z  �Y   k  0  r   J  
 �X m   �    �X   n     !"! 1  �W
�W 
txdl" 1  
�V
�V 
ascr #�U# r  0$%$ c  ,&'& n  (()( 7(�T*+
�T 
cha * m  #%�S�S +  ;  &') n  ,-, 4  �R.
�R 
cpar. l /�Q�P/ [  010 o  �O�O 0 i  1 m  �N�N �Q  �P  - o  �M�M "0 userinformation userInformation' m  (+�L
�L 
TEXT% o      �K�K 0 usercompany userCompany�U  �f  �e   232 l 55�J�I�H�J  �I  �H  3 454 r  5B676 J  5:88 9�G9 m  58:: �;;  :  �G  7 n     <=< 1  =A�F
�F 
txdl= 1  :=�E
�E 
ascr5 >?> Z  C�@A�D�C@ C COBCB n  CKDED 4  FK�BF
�B 
cparF o  IJ�A�A 0 i  E o  CF�@�@ "0 userinformation userInformationC m  KNGG �HH 8 d s A t t r T y p e N a t i v e : d e p a r t m e n t :A Q  R�IJKI r  UfLML n  UbNON 4  ]b�?P
�? 
citmP m  `a�>�> O n  U]QRQ 4  X]�=S
�= 
cparS o  [\�<�< 0 i  R o  UX�;�; "0 userinformation userInformationM o      �:�:  0 userdepartment userDepartmentJ R      �9�8�7
�9 .ascrerr ****      � ****�8  �7  K k  n�TT UVU r  n{WXW J  nsYY Z�6Z m  nq[[ �\\  �6  X n     ]^] 1  vz�5
�5 
txdl^ 1  sv�4
�4 
ascrV _�3_ r  |�`a` c  |�bcb n  |�ded 7���2fg
�2 
cha f m  ���1�1 g  ;  ��e n  |�hih 4  ��0j
�0 
cparj l ��k�/�.k [  ��lml o  ���-�- 0 i  m m  ���,�, �/  �.  i o  |�+�+ "0 userinformation userInformationc m  ���*
�* 
TEXTa o      �)�)  0 userdepartment userDepartment�3  �D  �C  ? non l ���(�'�&�(  �'  �&  o pqp r  ��rsr J  ��tt u�%u m  ��vv �ww  :  �%  s n     xyx 1  ���$
�$ 
txdly 1  ���#
�# 
ascrq z{z Z  �|}�"�!| C ��~~ n  ����� 4  ��� �
�  
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation m  ���� ��� X d s A t t r T y p e N a t i v e : p h y s i c a l D e l i v e r y O f f i c e N a m e :} Q  ����� r  ����� n  ����� 4  ����
� 
citm� m  ���� � n  ����� 4  ����
� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� o      �� 0 
useroffice 
userOffice� R      ���
� .ascrerr ****      � ****�  �  � k  ��� ��� r  ����� J  ���� ��� m  ���� ���  �  � n     ��� 1  ���
� 
txdl� 1  ���
� 
ascr� ��� r  ���� c  ����� n  ����� 7�����
� 
cha � m  ���� �  ;  ��� n  ����� 4  ����
� 
cpar� l ������ [  ����� o  ���� 0 i  � m  ���
�
 �  �  � o  ���	�	 "0 userinformation userInformation� m  ���
� 
TEXT� o      �� 0 
useroffice 
userOffice�  �"  �!  { ��� l ����  �  �  � ��� r  ��� J  �� ��� m  
�� ���  :  �  � n     ��� 1  �
� 
txdl� 1  �
� 
ascr� ��� Z  o��� ��� C !��� n  ��� 4  ���
�� 
cpar� o  ���� 0 i  � o  ���� "0 userinformation userInformation� m   �� ��� @ d s A t t r T y p e N a t i v e : s A M A c c o u n t N a m e :� Q  $k���� r  '8��� n  '4��� 4  /4���
�� 
citm� m  23���� � n  '/��� 4  */���
�� 
cpar� o  -.���� 0 i  � o  '*���� "0 userinformation userInformation� o      ���� 0 usershortname userShortName� R      ������
�� .ascrerr ****      � ****��  ��  � k  @k�� ��� r  @M��� J  @E�� ���� m  @C�� ���  ��  � n     ��� 1  HL��
�� 
txdl� 1  EH��
�� 
ascr� ���� r  Nk��� c  Ng��� n  Nc��� 7Xc����
�� 
cha � m  ^`���� �  ;  ab� n  NX��� 4  QX���
�� 
cpar� l TW������ [  TW��� o  TU���� 0 i  � m  UV���� ��  ��  � o  NQ���� "0 userinformation userInformation� m  cf��
�� 
TEXT� o      ���� 0 usershortname userShortName��  �   ��  � ��� l pp��������  ��  ��  � ��� r  p}��� J  pu�� ���� m  ps�� ���  :  ��  � n     ��� 1  x|��
�� 
txdl� 1  ux��
�� 
ascr� ��� Z  ~�������� C ~���� n  ~���� 4  �����
�� 
cpar� o  ������ 0 i  � o  ~����� "0 userinformation userInformation� m  ���� ��� : d s A t t r T y p e N a t i v e : w W W H o m e P a g e :� Q  ������ r  ��   n  �� 4  ����
�� 
citm m  ������  n  �� 4  ����
�� 
cpar o  ������ 0 i   o  ������ "0 userinformation userInformation o      ���� 0 userwebpage userWebPage� R      ������
�� .ascrerr ****      � ****��  ��  � k  �� 	
	 r  �� J  �� �� m  �� �  ��   n      1  ����
�� 
txdl 1  ����
�� 
ascr
 �� r  �� c  �� n  �� 7����
�� 
cha  m  ������   ;  �� n  �� 4  ����
�� 
cpar l ������ [  �� !  o  ������ 0 i  ! m  ������ ��  ��   o  ������ "0 userinformation userInformation m  ����
�� 
TEXT o      ���� 0 userwebpage userWebPage��  ��  ��  � "#" l ����������  ��  ��  # $%$ r  ��&'& J  ��(( )��) m  ��** �++  :  ��  ' n     ,-, 1  ����
�� 
txdl- 1  ����
�� 
ascr% ./. Z  �A01����0 C ��232 n  ��454 4  ����6
�� 
cpar6 o  ������ 0 i  5 o  ������ "0 userinformation userInformation3 m  ��77 �88 
 C i t y :1 Q  �=9:;9 r  �
<=< n  �>?> 4  ��@
�� 
citm@ m  ���� ? n  �ABA 4  ���C
�� 
cparC o  � ���� 0 i  B o  ������ "0 userinformation userInformation= o      ���� 0 usercity userCity: R      ������
�� .ascrerr ****      � ****��  ��  ; k  =DD EFE r  GHG J  II J��J m  KK �LL  ��  H n     MNM 1  ��
�� 
txdlN 1  ��
�� 
ascrF O��O r   =PQP c   9RSR n   5TUT 7*5��VW
�� 
cha V m  02���� W  ;  34U n   *XYX 4  #*��Z
�� 
cparZ l &)[����[ [  &)\]\ o  &'���� 0 i  ] m  '(���� ��  ��  Y o   #���� "0 userinformation userInformationS m  58��
�� 
TEXTQ o      ���� 0 usercity userCity��  ��  ��  / ^_^ l BB��������  ��  ��  _ `a` r  BObcb J  BGdd e��e m  BEff �gg  :  ��  c n     hih 1  JN��
�� 
txdli 1  GJ��
�� 
ascra jkj Z  P�lm����l C P\non n  PXpqp 4  SX��r
�� 
cparr o  VW���� 0 i  q o  PS���� "0 userinformation userInformationo m  X[ss �tt  F A X N u m b e r :m Q  _�uvwu r  bsxyx n  boz{z 4  jo��|
�� 
citm| m  mn���� { n  bj}~} 4  ej��
�� 
cpar o  hi���� 0 i  ~ o  be���� "0 userinformation userInformationy o      ���� 0 userfax userFaxv R      ������
�� .ascrerr ****      � ****��  ��  w k  {��� ��� r  {���� J  {��� ���� m  {~�� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  ����� c  ����� n  ����� 7������
�� 
cha � m  ������ �  ;  ��� n  ����� 4  �����
�� 
cpar� l �������� [  ����� o  ������ 0 i  � m  ������ ��  ��  � o  ������ "0 userinformation userInformation� m  ����
�� 
TEXT� o      �� 0 userfax userFax��  ��  ��  k ��� l ���~�}�|�~  �}  �|  � ��� r  ����� J  ���� ��{� m  ���� ���  :  �{  � n     ��� 1  ���z
�z 
txdl� 1  ���y
�y 
ascr� ��� Z  ����x�w� C ����� n  ����� 4  ���v�
�v 
cpar� o  ���u�u 0 i  � o  ���t�t "0 userinformation userInformation� m  ���� ���  F i r s t N a m e :� Q  ����� r  ����� n  ����� 4  ���s�
�s 
citm� m  ���r�r � n  ����� 4  ���q�
�q 
cpar� o  ���p�p 0 i  � o  ���o�o "0 userinformation userInformation� o      �n�n 0 userfirstname userFirstName� R      �m�l�k
�m .ascrerr ****      � ****�l  �k  � k  ��� ��� r  ����� J  ���� ��j� m  ���� ���  �j  � n     ��� 1  ���i
�i 
txdl� 1  ���h
�h 
ascr� ��g� r  ���� c  ���� n  ���� 7��f��
�f 
cha � m  �e�e �  ;  � n  ����� 4  ���d�
�d 
cpar� l ����c�b� [  ����� o  ���a�a 0 i  � m  ���`�` �c  �b  � o  ���_�_ "0 userinformation userInformation� m  
�^
�^ 
TEXT� o      �]�] 0 userfirstname userFirstName�g  �x  �w  � ��� l �\�[�Z�\  �[  �Z  � ��� r  !��� J  �� ��Y� m  �� ���  :  �Y  � n     ��� 1   �X
�X 
txdl� 1  �W
�W 
ascr� ��� Z  "|���V�U� C ".��� n  "*��� 4  %*�T�
�T 
cpar� o  ()�S�S 0 i  � o  "%�R�R "0 userinformation userInformation� m  *-�� ���  J o b T i t l e :� Q  1x���� r  4E��� n  4A��� 4  <A�Q�
�Q 
citm� m  ?@�P�P � n  4<��� 4  7<�O�
�O 
cpar� o  :;�N�N 0 i  � o  47�M�M "0 userinformation userInformation� o      �L�L 0 	usertitle 	userTitle� R      �K�J�I
�K .ascrerr ****      � ****�J  �I  � k  Mx�� ��� r  MZ��� J  MR�� ��H� m  MP�� �    �H  � n      1  UY�G
�G 
txdl 1  RU�F
�F 
ascr� �E r  [x c  [t n  [p	 7ep�D

�D 
cha 
 m  km�C�C   ;  no	 n  [e 4  ^e�B
�B 
cpar l ad�A�@ [  ad o  ab�?�? 0 i   m  bc�>�> �A  �@   o  [^�=�= "0 userinformation userInformation m  ps�<
�< 
TEXT o      �;�; 0 	usertitle 	userTitle�E  �V  �U  �  l }}�:�9�8�:  �9  �8    r  }� J  }� �7 m  }� �  :  �7   n      1  ���6
�6 
txdl 1  ���5
�5 
ascr  Z  �� !�4�3  C ��"#" n  ��$%$ 4  ���2&
�2 
cpar& o  ���1�1 0 i  % o  ���0�0 "0 userinformation userInformation# m  ��'' �((  L a s t N a m e :! Q  ��)*+) r  ��,-, n  ��./. 4  ���/0
�/ 
citm0 m  ���.�. / n  ��121 4  ���-3
�- 
cpar3 o  ���,�, 0 i  2 o  ���+�+ "0 userinformation userInformation- o      �*�* 0 userlastname userLastName* R      �)�(�'
�) .ascrerr ****      � ****�(  �'  + k  ��44 565 r  ��787 J  ��99 :�&: m  ��;; �<<  �&  8 n     =>= 1  ���%
�% 
txdl> 1  ���$
�$ 
ascr6 ?�#? r  ��@A@ c  ��BCB n  ��DED 7���"FG
�" 
cha F m  ���!�! G  ;  ��E n  ��HIH 4  ��� J
�  
cparJ l ��K��K [  ��LML o  ���� 0 i  M m  ���� �  �  I o  ���� "0 userinformation userInformationC m  ���
� 
TEXTA o      �� 0 userlastname userLastName�#  �4  �3   NON l ������  �  �  O PQP r  ��RSR J  ��TT U�U m  ��VV �WW  :  �  S n     XYX 1  ���
� 
txdlY 1  ���
� 
ascrQ Z[Z Z  �N\]��\ C � ^_^ n  ��`a` 4  ���b
� 
cparb o  ���� 0 i  a o  ���� "0 userinformation userInformation_ m  ��cc �dd  M o b i l e N u m b e r :] Q  Jefge r  hih n  jkj 4  �l
� 
citml m  �� k n  mnm 4  	�o
� 
cparo o  �
�
 0 i  n o  	�	�	 "0 userinformation userInformationi o      �� 0 
usermobile 
userMobilef R      ���
� .ascrerr ****      � ****�  �  g k  Jpp qrq r  ,sts J  $uu v�v m  "ww �xx  �  t n     yzy 1  '+�
� 
txdlz 1  $'�
� 
ascrr {�{ r  -J|}| c  -F~~ n  -B��� 77B� ��
�  
cha � m  =?���� �  ;  @A� n  -7��� 4  07���
�� 
cpar� l 36������ [  36��� o  34���� 0 i  � m  45���� ��  ��  � o  -0���� "0 userinformation userInformation m  BE��
�� 
TEXT} o      ���� 0 
usermobile 
userMobile�  �  �  [ ��� l OO��������  ��  ��  � ��� r  O\��� J  OT�� ���� m  OR�� ���  :  ��  � n     ��� 1  W[��
�� 
txdl� 1  TW��
�� 
ascr� ��� Z  ]�������� C ]i��� n  ]e��� 4  `e���
�� 
cpar� o  cd���� 0 i  � o  ]`���� "0 userinformation userInformation� m  eh�� ���  P h o n e N u m b e r :� Q  l����� r  o���� n  o|��� 4  w|���
�� 
citm� m  z{���� � n  ow��� 4  rw���
�� 
cpar� o  uv���� 0 i  � o  or���� "0 userinformation userInformation� o      ���� 0 userworkphone userWorkPhone� R      ������
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
TEXT� o      ���� 0 userworkphone userWorkPhone��  ��  ��  � ��� l ����������  ��  ��  � ��� r  ����� J  ���� ���� m  ���� ���  :  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ��� Z  �	 ������� C ����� n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� m  ���� ���  P o s t a l C o d e :� Q  �	���� r  ����� n  ����� 4  �����
�� 
citm� m  ������ � n  ����� 4  �����
�� 
cpar� o  ������ 0 i  � o  ������ "0 userinformation userInformation� o      ����  0 userpostalcode userPostalCode� R      ������
�� .ascrerr ****      � ****��  ��  � k  �	�� ��� r  ����� J  ���� ���� m  ���� ���  ��  � n     ��� 1  ����
�� 
txdl� 1  ����
�� 
ascr� ���� r  �	��� c  �	��� n  �	��� 7			����
�� 
cha � m  		���� �  ;  		� n  �		��� 4  			���
�� 
cpar� l 		������ [  		   o  		���� 0 i   m  		���� ��  ��  � o  �	���� "0 userinformation userInformation� m  		��
�� 
TEXT� o      ����  0 userpostalcode userPostalCode��  ��  ��  �  l 	!	!��������  ��  ��    r  	!	. J  	!	& 	��	 m  	!	$

 �  :  ��   n      1  	)	-��
�� 
txdl 1  	&	)��
�� 
ascr  Z  	/	����� C 	/	; n  	/	7 4  	2	7��
�� 
cpar o  	5	6���� 0 i   o  	/	2���� "0 userinformation userInformation m  	7	: �  R e a l N a m e : Q  	>	� r  	A	R n  	A	N 4  	I	N�� 
�� 
citm  m  	L	M����  n  	A	I!"! 4  	D	I��#
�� 
cpar# o  	G	H���� 0 i  " o  	A	D���� "0 userinformation userInformation o      ���� 0 userfullname userFullName R      ������
�� .ascrerr ****      � ****��  ��   k  	Z	�$$ %&% r  	Z	g'(' J  	Z	_)) *��* m  	Z	]++ �,,  ��  ( n     -.- 1  	b	f��
�� 
txdl. 1  	_	b��
�� 
ascr& /��/ r  	h	�010 c  	h	�232 n  	h	}454 7	r	}��67
�� 
cha 6 m  	x	z���� 7  ;  	{	|5 n  	h	r898 4  	k	r��:
�� 
cpar: l 	n	q;����; [  	n	q<=< o  	n	o���� 0 i  = m  	o	p���� ��  ��  9 o  	h	k���� "0 userinformation userInformation3 m  	}	���
�� 
TEXT1 o      ���� 0 userfullname userFullName��  ��  ��   >?> l 	�	���������  ��  ��  ? @A@ r  	�	�BCB J  	�	�DD E��E m  	�	�FF �GG  :  ��  C n     HIH 1  	�	���
�� 
txdlI 1  	�	���
�� 
ascrA JKJ Z  	�	�LM����L C 	�	�NON n  	�	�PQP 4  	�	���R
�� 
cparR o  	�	����� 0 i  Q o  	�	����� "0 userinformation userInformationO m  	�	�SS �TT  S t a t e :M Q  	�	�UVWU r  	�	�XYX n  	�	�Z[Z 4  	�	���\
�� 
citm\ m  	�	����� [ n  	�	�]^] 4  	�	���_
�� 
cpar_ o  	�	����� 0 i  ^ o  	�	����� "0 userinformation userInformationY o      ���� 0 	userstate 	userStateV R      ��~�}
� .ascrerr ****      � ****�~  �}  W k  	�	�`` aba r  	�	�cdc J  	�	�ee f�|f m  	�	�gg �hh  �|  d n     iji 1  	�	��{
�{ 
txdlj 1  	�	��z
�z 
ascrb k�yk r  	�	�lml c  	�	�non n  	�	�pqp 7	�	��xrs
�x 
cha r m  	�	��w�w s  ;  	�	�q n  	�	�tut 4  	�	��vv
�v 
cparv l 	�	�w�u�tw [  	�	�xyx o  	�	��s�s 0 i  y m  	�	��r�r �u  �t  u o  	�	��q�q "0 userinformation userInformationo m  	�	��p
�p 
TEXTm o      �o�o 0 	userstate 	userState�y  ��  ��  K z{z l 	�	��n�m�l�n  �m  �l  { |}| r  	�
 ~~ J  	�	��� ��k� m  	�	��� ���  :  �k   n     ��� 1  	�	��j
�j 
txdl� 1  	�	��i
�i 
ascr} ��� Z  

[���h�g� C 

��� n  

	��� 4  

	�f�
�f 
cpar� o  

�e�e 0 i  � o  

�d�d "0 userinformation userInformation� m  
	
�� ���  S t r e e t :� Q  

W���� r  

$��� n  

 ��� 4  

 �c�
�c 
citm� m  

�b�b � n  

��� 4  

�a�
�a 
cpar� o  

�`�` 0 i  � o  

�_�_ "0 userinformation userInformation� o      �^�^ 0 
userstreet 
userStreet� R      �]�\�[
�] .ascrerr ****      � ****�\  �[  � k  
,
W�� ��� r  
,
9��� J  
,
1�� ��Z� m  
,
/�� ���  �Z  � n     ��� 1  
4
8�Y
�Y 
txdl� 1  
1
4�X
�X 
ascr� ��W� r  
:
W��� c  
:
S��� n  
:
O��� 7
D
O�V��
�V 
cha � m  
J
L�U�U �  ;  
M
N� n  
:
D��� 4  
=
D�T�
�T 
cpar� l 
@
C��S�R� [  
@
C��� o  
@
A�Q�Q 0 i  � m  
A
B�P�P �S  �R  � o  
:
=�O�O "0 userinformation userInformation� m  
O
R�N
�N 
TEXT� o      �M�M 0 
userstreet 
userStreet�W  �h  �g  � ��L� l 
\
\�K�J�I�K  �J  �I  �L  �� 0 i  { m  ���H�H | I ���G��F
�G .corecnte****       ****� n ����� 2 ���E
�E 
cpar� o  ���D�D "0 userinformation userInformation�F  ��  y ��� l 
c
c�C�B�A�C  �B  �A  � ��� r  
c
s��� J  
c
k�� ��� m  
c
f�� ���  ; K e r b e r o s v 5 ; ;� ��@� m  
f
i�� ���  ;�@  � n     ��� 1  
n
r�?
�? 
txdl� 1  
k
n�>
�> 
ascr� ��� l 
t
t�=�<�;�=  �<  �;  � ��� Q  
t
����:� r  
w
���� n  
w
��� 4  
z
�9�
�9 
citm� m  
}
~�8�8 � o  
w
z�7�7 "0 userinformation userInformation� o      �6�6 &0 userkerberosrealm userKerberosRealm� R      �5�4�3
�5 .ascrerr ****      � ****�4  �3  �:  � ��� l 
�
��2�1�0�2  �1  �0  � ��� r  
�
���� J  
�
��� ��/� m  
�
��� ���  �/  � n     ��� 1  
�
��.
�. 
txdl� 1  
�
��-
�- 
ascr� ��� l 
�
��,�+�*�,  �+  �*  � ��� Z  
�
����)�(� = 
�
���� o  
�
��'�' 0 emailaddress emailAddress� m  
�
��� ���  � k  
�
��� ��� l 
�
��&�%�$�&  �%  �$  � ��� l 
�
��#���#  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l 
�
��"�!� �"  �!  �   � ��� I 
�
����
� .sysodlogaskr        TEXT� b  
�
���� b  
�
���� b  
�
���� o  
�
��� 0 errormessage errorMessage� o  
�
��
� 
ret � o  
�
��
� 
ret � m  
�
��� �	 	  h U n a b l e   t o   r e a d   e m a i l   a d d r e s s   f r o m   n e t w o r k   d i r e c t o r y .� �		
� 
disp	 m  
�
��
� stic    	 �		
� 
btns	 J  
�
�		 	�	 m  
�
�		 �		  O K�  	 �			

� 
dflt		 J  
�
�		 	�	 m  
�
�		 �		  O K�  	
 �	�
� 
appr	 m  
�
�		 �		 , O u t l o o k   E x c h a n g e   S e t u p�  � 	�	 R  
�
���	
� .ascrerr ****      � ****�  	 �	�
� 
errn	 m  
�
������  �  �)  �(  � 	�	 l 
�
����
�  �  �
  �  � 			 F  
�
�			 = 
�
�			 o  
�
��	�	 0 emailformat emailFormat	 m  
�
��� 	 = 
�
�			 o  
�
��� 0 displayname displayName	 m  
�
��� 	 			 k   n	 	  	!	"	! l   ����  �  �  	" 	#	$	# l   �	%	&�  	% P J Pull user information from the account settings of the local user account   	& �	'	' �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	$ 	(	)	( l   �� ���  �   ��  	) 	*	+	* r   	,	-	, n   		.	/	. 1  	��
�� 
sisn	/ l  	0����	0 I  ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	- o      ���� 0 usershortname userShortName	+ 	1	2	1 r  	3	4	3 n  	5	6	5 1  ��
�� 
siln	6 l 	7����	7 I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	4 o      ���� 0 userfullname userFullName	2 	8	9	8 l ��������  ��  ��  	9 	:	;	: l ��	<	=��  	< D > first.last@domain.com and full name displays as "Last, First"   	= �	>	> |   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	; 	?	@	? l ��������  ��  ��  	@ 	A	B	A r  '	C	D	C m  	E	E �	F	F  ,  	D n     	G	H	G 1  "&��
�� 
txdl	H 1  "��
�� 
ascr	B 	I	J	I r  (4	K	L	K n  (0	M	N	M 4 +0��	O
�� 
citm	O m  ./������	N o  (+���� 0 userfullname userFullName	L o      ���� 0 userfirstname userFirstName	J 	P	Q	P r  5F	R	S	R n  5B	T	U	T 4  =B��	V
�� 
cwor	V m  @A���� 	U n  5=	W	X	W 4  8=��	Y
�� 
citm	Y m  ;<���� 	X o  58���� 0 userfullname userFullName	S o      ���� 0 userlastname userLastName	Q 	Z	[	Z r  GR	\	]	\ m  GJ	^	^ �	_	_  	] n     	`	a	` 1  MQ��
�� 
txdl	a 1  JM��
�� 
ascr	[ 	b	c	b r  Sl	d	e	d b  Sh	f	g	f b  Sb	h	i	h b  S^	j	k	j b  SZ	l	m	l o  SV���� 0 userfirstname userFirstName	m m  VY	n	n �	o	o  .	k o  Z]���� 0 userlastname userLastName	i m  ^a	p	p �	q	q  @	g o  bg���� 0 
domainname 
domainName	e o      ���� 0 emailaddress emailAddress	c 	r��	r l mm��������  ��  ��  ��  	 	s	t	s F  q�	u	v	u = qx	w	x	w o  qv���� 0 emailformat emailFormat	x m  vw���� 	v = {�	y	z	y o  {����� 0 displayname displayName	z m  ������ 	t 	{	|	{ k  ��	}	} 	~		~ l ����������  ��  ��  	 	�	�	� l ����	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
sisn	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 1  ����
�� 
siln	� l ��	�����	� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ����������  ��  ��  	� 	�	�	� l ����	�	���  	� C = first.last@domain.com and full name displays as "First Last"   	� �	�	� z   f i r s t . l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "	� 	�	�	� l ����������  ��  ��  	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�   	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4  ����	�
�� 
cwor	� m  ������ 	� n  ��	�	�	� 4  ����	�
�� 
citm	� m  ������ 	� o  ������ 0 userfullname userFullName	� o      ���� 0 userfirstname userFirstName	� 	�	�	� r  ��	�	�	� n  ��	�	�	� 4 ����	�
�� 
citm	� m  ��������	� o  ������ 0 userfullname userFullName	� o      ���� 0 userlastname userLastName	� 	�	�	� r  ��	�	�	� m  ��	�	� �	�	�  	� n     	�	�	� 1  ����
�� 
txdl	� 1  ����
�� 
ascr	� 	�	�	� r  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� b  ��	�	�	� o  ������ 0 userfirstname userFirstName	� m  ��	�	� �	�	�  .	� o  ������ 0 userlastname userLastName	� m  ��	�	� �	�	�  @	� o  ������ 0 
domainname 
domainName	� o      ���� 0 emailaddress emailAddress	� 	���	� l ����������  ��  ��  ��  	| 	�	�	� F  �	�	�	� = �	�	�	� o  ������ 0 emailformat emailFormat	� m  � ���� 	� = 	�	�	� o  	���� 0 displayname displayName	� m  	
���� 	� 	�	�	� k  x	�	� 	�	�	� l ��������  ��  ��  	� 	�	�	� l ��	�	���  	� P J Pull user information from the account settings of the local user account   	� �	�	� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t	� 	�	�	� l ��������  ��  ��  	� 	�	�	� r  	�	�	� n  	�	�	� 1  ��
�� 
sisn	� l 	�����	� I ������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 usershortname userShortName	� 	�	�	� r   -	�	�	� n   )	�	�	� 1  %)��
�� 
siln	� l  %	�����	� I  %������
�� .sysosigtsirr   ��� null��  ��  ��  ��  	� o      ���� 0 userfullname userFullName	� 	�	�	� l ..��������  ��  ��  	� 	�	�	� l ..��	�	���  	� ? 9 first@domain.com and full name displays as "Last, First"   	� �	�	� r   f i r s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "	� 	�	�	� l ..����~��  �  �~  	� 	�	�	� r  .9	�	�	� m  .1	�	� �
 
   ,  	� n     


 1  48�}
�} 
txdl
 1  14�|
�| 
ascr	� 


 r  :F


 n  :B


 4 =B�{
	
�{ 
citm
	 m  @A�z�z��
 o  :=�y�y 0 userfullname userFullName
 o      �x�x 0 userfirstname userFirstName
 




 r  GX


 n  GT


 4  OT�w

�w 
cwor
 m  RS�v�v 
 n  GO


 4  JO�u

�u 
citm
 m  MN�t�t 
 o  GJ�s�s 0 userfullname userFullName
 o      �r�r 0 userlastname userLastName
 


 r  Yd


 m  Y\

 �

  
 n     


 1  _c�q
�q 
txdl
 1  \_�p
�p 
ascr
 


 r  ev


 b  er
 
!
  b  el
"
#
" o  eh�o�o 0 userfirstname userFirstName
# m  hk
$
$ �
%
%  @
! o  lq�n�n 0 
domainname 
domainName
 o      �m�m 0 emailaddress emailAddress
 
&�l
& l ww�k�j�i�k  �j  �i  �l  	� 
'
(
' F  {�
)
*
) = {�
+
,
+ o  {��h�h 0 emailformat emailFormat
, m  ���g�g 
* = ��
-
.
- o  ���f�f 0 displayname displayName
. m  ���e�e 
( 
/
0
/ k  ��
1
1 
2
3
2 l ���d�c�b�d  �c  �b  
3 
4
5
4 l ���a
6
7�a  
6 P J Pull user information from the account settings of the local user account   
7 �
8
8 �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
5 
9
:
9 l ���`�_�^�`  �_  �^  
: 
;
<
; r  ��
=
>
= n  ��
?
@
? 1  ���]
�] 
sisn
@ l ��
A�\�[
A I ���Z�Y�X
�Z .sysosigtsirr   ��� null�Y  �X  �\  �[  
> o      �W�W 0 usershortname userShortName
< 
B
C
B r  ��
D
E
D n  ��
F
G
F 1  ���V
�V 
siln
G l ��
H�U�T
H I ���S�R�Q
�S .sysosigtsirr   ��� null�R  �Q  �U  �T  
E o      �P�P 0 userfullname userFullName
C 
I
J
I l ���O�N�M�O  �N  �M  
J 
K
L
K l ���L
M
N�L  
M = 7 first@domain.com if full name displays as "First Last"   
N �
O
O n   f i r s t @ d o m a i n . c o m   i f   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "
L 
P
Q
P l ���K�J�I�K  �J  �I  
Q 
R
S
R r  ��
T
U
T m  ��
V
V �
W
W   
U n     
X
Y
X 1  ���H
�H 
txdl
Y 1  ���G
�G 
ascr
S 
Z
[
Z r  ��
\
]
\ n  ��
^
_
^ 4  ���F
`
�F 
cwor
` m  ���E�E 
_ n  ��
a
b
a 4  ���D
c
�D 
citm
c m  ���C�C 
b o  ���B�B 0 userfullname userFullName
] o      �A�A 0 userfirstname userFirstName
[ 
d
e
d r  ��
f
g
f n  ��
h
i
h 4 ���@
j
�@ 
citm
j m  ���?�?��
i o  ���>�> 0 userfullname userFullName
g o      �=�= 0 userlastname userLastName
e 
k
l
k r  ��
m
n
m m  ��
o
o �
p
p  
n n     
q
r
q 1  ���<
�< 
txdl
r 1  ���;
�; 
ascr
l 
s
t
s r  ��
u
v
u b  ��
w
x
w b  ��
y
z
y o  ���:�: 0 userfirstname userFirstName
z m  ��
{
{ �
|
|  @
x o  ���9�9 0 
domainname 
domainName
v o      �8�8 0 emailaddress emailAddress
t 
}�7
} l ���6�5�4�6  �5  �4  �7  
0 
~

~ F  �
�
�
� = �
�
�
� o  ��3�3 0 emailformat emailFormat
� m  �2�2 
� = 
�
�
� o  �1�1 0 displayname displayName
� m  �0�0 
 
�
�
� k  �
�
� 
�
�
� l �/�.�-�/  �.  �-  
� 
�
�
� l �,
�
��,  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l �+�*�)�+  �*  �)  
� 
�
�
� r  !
�
�
� n  
�
�
� 1  �(
�( 
sisn
� l 
��'�&
� I �%�$�#
�% .sysosigtsirr   ��� null�$  �#  �'  �&  
� o      �"�" 0 usershortname userShortName
� 
�
�
� r  "/
�
�
� n  "+
�
�
� 1  '+�!
�! 
siln
� l "'
�� �
� I "'���
� .sysosigtsirr   ��� null�  �  �   �  
� o      �� 0 userfullname userFullName
� 
�
�
� l 00����  �  �  
� 
�
�
� l 00�
�
��  
� ? 9 flast@domain.com and full name displays as "Last, First"   
� �
�
� r   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "
� 
�
�
� l 00����  �  �  
� 
�
�
� r  0;
�
�
� m  03
�
� �
�
�  ,  
� n     
�
�
� 1  6:�
� 
txdl
� 1  36�
� 
ascr
� 
�
�
� r  <H
�
�
� n  <D
�
�
� 4 ?D�
�
� 
citm
� m  BC����
� o  <?�� 0 userfullname userFullName
� o      �� 0 userfirstname userFirstName
� 
�
�
� r  IZ
�
�
� n  IV
�
�
� 4  QV�
�
� 
cwor
� m  TU�� 
� n  IQ
�
�
� 4  LQ�
�
� 
citm
� m  OP�
�
 
� o  IL�	�	 0 userfullname userFullName
� o      �� 0 userlastname userLastName
� 
�
�
� r  [f
�
�
� m  [^
�
� �
�
�  
� n     
�
�
� 1  ae�
� 
txdl
� 1  ^a�
� 
ascr
� 
�
�
� r  g�
�
�
� b  g}
�
�
� b  gw
�
�
� b  gs
�
�
� l go
���
� n  go
�
�
� 4  jo�
�
� 
cha 
� m  mn�� 
� o  gj�� 0 userfirstname userFirstName�  �  
� o  or� �  0 userlastname userLastName
� m  sv
�
� �
�
�  @
� o  w|���� 0 
domainname 
domainName
� o      ���� 0 emailaddress emailAddress
� 
���
� l ����������  ��  ��  ��  
� 
�
�
� F  ��
�
�
� = ��
�
�
� o  ������ 0 emailformat emailFormat
� m  ������ 
� = ��
�
�
� o  ������ 0 displayname displayName
� m  ������ 
� 
�
�
� k  �
�
� 
�
�
� l ����������  ��  ��  
� 
�
�
� l ����
�
���  
� P J Pull user information from the account settings of the local user account   
� �
�
� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t
� 
�
�
� l ����������  ��  ��  
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 1  ����
�� 
sisn
� l ��
�����
� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
� o      ���� 0 usershortname userShortName
� 
�
�
� r  ��
�
�
� n  ��
�
�
� 1  ����
�� 
siln
� l ��
�����
� I ��������
�� .sysosigtsirr   ��� null��  ��  ��  ��  
� o      ���� 0 userfullname userFullName
� 
�
�
� l ����������  ��  ��  
� 
� 
� l ������   > 8 flast@domain.com and full name displays as "First Last"    � p   f l a s t @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "   l ����������  ��  ��    r  ��	 m  ��

 �   	 n      1  ����
�� 
txdl 1  ����
�� 
ascr  r  �� n  �� 4  ����
�� 
cwor m  ������  n  �� 4  ����
�� 
citm m  ������  o  ������ 0 userfullname userFullName o      ���� 0 userfirstname userFirstName  r  �� n  �� 4 ����
�� 
citm m  �������� o  ������ 0 userfullname userFullName o      ���� 0 userlastname userLastName   r  ��!"! m  ��## �$$  " n     %&% 1  ����
�� 
txdl& 1  ����
�� 
ascr  '(' r  �)*) l �+����+ b  �,-, b  �./. b  ��010 n  ��232 4  ����4
�� 
cha 4 m  ������ 3 o  ������ 0 userfirstname userFirstName1 o  ������ 0 userlastname userLastName/ m  � 55 �66  @- o  ���� 0 
domainname 
domainName��  ��  * o      ���� 0 emailaddress emailAddress( 7��7 l ��������  ��  ��  ��  
� 898 F  ':;: = <=< o  ���� 0 emailformat emailFormat= m  ���� ; = #>?> o  !���� 0 displayname displayName? m  !"���� 9 @A@ k  *�BB CDC l **��������  ��  ��  D EFE l **��GH��  G P J Pull user information from the account settings of the local user account   H �II �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n tF JKJ l **��������  ��  ��  K LML r  *7NON n  *3PQP 1  /3��
�� 
sisnQ l */R����R I */������
�� .sysosigtsirr   ��� null��  ��  ��  ��  O o      ���� 0 usershortname userShortNameM STS r  8EUVU n  8AWXW 1  =A��
�� 
silnX l 8=Y����Y I 8=������
�� .sysosigtsirr   ��� null��  ��  ��  ��  V o      ���� 0 userfullname userFullNameT Z[Z l FF��������  ��  ��  [ \]\ l FF��^_��  ^ C = shortName@domain.com and full name displays as "Last, First"   _ �`` z   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " L a s t ,   F i r s t "] aba l FF��������  ��  ��  b cdc r  FQefe m  FIgg �hh  ,  f n     iji 1  LP��
�� 
txdlj 1  IL��
�� 
ascrd klk r  R^mnm n  RZopo 4 UZ��q
�� 
citmq m  XY������p o  RU���� 0 userfullname userFullNamen o      ���� 0 userfirstname userFirstNamel rsr r  _ptut n  _lvwv 4  gl��x
�� 
cworx m  jk���� w n  _gyzy 4  bg��{
�� 
citm{ m  ef���� z o  _b���� 0 userfullname userFullNameu o      ���� 0 userlastname userLastNames |}| r  q|~~ m  qt�� ���   n     ��� 1  w{��
�� 
txdl� 1  tw��
�� 
ascr} ��� r  }���� b  }���� b  }���� o  }����� 0 usershortname userShortName� m  ���� ���  @� o  ������ 0 
domainname 
domainName� o      ���� 0 emailaddress emailAddress� ���� l ����������  ��  ��  ��  A ��� F  ����� = ����� o  ������ 0 emailformat emailFormat� m  ������ � = ����� o  ������ 0 displayname displayName� m  ������ � ���� k  ��� ��� l ����������  ��  ��  � ��� l ��������  � P J Pull user information from the account settings of the local user account   � ��� �   P u l l   u s e r   i n f o r m a t i o n   f r o m   t h e   a c c o u n t   s e t t i n g s   o f   t h e   l o c a l   u s e r   a c c o u n t� ��� l ���������  ��  �  � ��� r  ����� n  ����� 1  ���~
�~ 
sisn� l ����}�|� I ���{�z�y
�{ .sysosigtsirr   ��� null�z  �y  �}  �|  � o      �x�x 0 usershortname userShortName� ��� r  ����� n  ����� 1  ���w
�w 
siln� l ����v�u� I ���t�s�r
�t .sysosigtsirr   ��� null�s  �r  �v  �u  � o      �q�q 0 userfullname userFullName� ��� l ���p�o�n�p  �o  �n  � ��� l ���m���m  � B < shortName@domain.com and full name displays as "First Last"   � ��� x   s h o r t N a m e @ d o m a i n . c o m   a n d   f u l l   n a m e   d i s p l a y s   a s   " F i r s t   L a s t "� ��� l ���l�k�j�l  �k  �j  � ��� r  ����� m  ���� ���   � n     ��� 1  ���i
�i 
txdl� 1  ���h
�h 
ascr� ��� r  ����� n  ����� 4  ���g�
�g 
cwor� m  ���f�f � n  ����� 4  ���e�
�e 
citm� m  ���d�d � o  ���c�c 0 userfullname userFullName� o      �b�b 0 userfirstname userFirstName� ��� r  ����� n  ����� 4 ���a�
�a 
citm� m  ���`�`��� o  ���_�_ 0 userfullname userFullName� o      �^�^ 0 userlastname userLastName� ��� r  ����� m  ���� ���  � n     ��� 1  ���]
�] 
txdl� 1  ���\
�\ 
ascr� ��� r   ��� b   ��� b   ��� o   �[�[ 0 usershortname userShortName� m  �� ���  @� o  �Z�Z 0 
domainname 
domainName� o      �Y�Y 0 emailaddress emailAddress� ��X� l �W�V�U�W  �V  �U  �X  ��  � k  R�� ��� l �T�S�R�T  �S  �R  � ��� l �Q���Q  �   something went wrong   � ��� *   s o m e t h i n g   w e n t   w r o n g� ��� l �P�O�N�P  �O  �N  � ��� I E�M��
�M .sysodlogaskr        TEXT� b  #��� b  ��� b  ��� o  �L�L 0 errormessage errorMessage� o  �K
�K 
ret � o  �J
�J 
ret � m  "�� ��� x U n a b l e   t o   p a r s e   a c c o u n t   i n f o r m a t i o n   f r o m   l o c a l   O S   X   a c c o u n t .� �I��
�I 
disp� m  &)�H
�H stic    � �G��
�G 
btns� J  ,1��  �F  m  ,/ �  O K�F  � �E
�E 
dflt J  49 �D m  47 �  O K�D   �C	�B
�C 
appr	 m  <?

 � , O u t l o o k   E x c h a n g e   S e t u p�B  �  R  FP�A�@
�A .ascrerr ****      � ****�@   �?�>
�? 
errn m  JM�=�=���>   �< l QQ�;�:�9�;  �:  �9  �<  �  �  �  l     �8�7�6�8  �7  �6    l     �5�5   0 *------------------------------------------    � T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     �4�4   &   End collecting user information    � @   E n d   c o l l e c t i n g   u s e r   i n f o r m a t i o n  l     �3 �3   0 *------------------------------------------     �!! T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "#" l     �2�1�0�2  �1  �0  # $%$ l     �/&'�/  & 0 *------------------------------------------   ' �(( T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -% )*) l     �.+,�.  + %  Begin logging user information   , �-- >   B e g i n   l o g g i n g   u s e r   i n f o r m a t i o n* ./. l     �-01�-  0 0 *------------------------------------------   1 �22 T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -/ 343 l     �,�+�*�,  �+  �*  4 565 l S[7�)�(7 I  S[�'8�&�' 0 writelog writeLog8 9�%9 m  TW:: �;; & U s e r   i n f o r m a t i o n . . .�%  �&  �)  �(  6 <=< l \h>�$�#> I  \h�"?�!�" 0 writelog writeLog? @� @ b  ]dABA m  ]`CC �DD  F i r s t   N a m e :  B o  `c�� 0 userfirstname userFirstName�   �!  �$  �#  = EFE l iuG��G I  iu�H�� 0 writelog writeLogH I�I b  jqJKJ m  jmLL �MM  L a s t   N a m e :  K o  mp�� 0 userlastname userLastName�  �  �  �  F NON l v�P��P I  v��Q�� 0 writelog writeLogQ R�R b  w~STS m  wzUU �VV  E m a i l   A d d r e s s :  T o  z}�� 0 emailaddress emailAddress�  �  �  �  O WXW l ��Y��Y I  ���Z�� 0 writelog writeLogZ [�[ b  ��\]\ m  ��^^ �__  D e p a r t m e n t :  ] o  ����  0 userdepartment userDepartment�  �  �  �  X `a` l ��b��b I  ���
c�	�
 0 writelog writeLogc d�d b  ��efe m  ��gg �hh  O f f i c e :  f o  ���� 0 
useroffice 
userOffice�  �	  �  �  a iji l ��k��k I  ���l�� 0 writelog writeLogl m�m b  ��non m  ��pp �qq  C o m p a n y :  o o  ���� 0 usercompany userCompany�  �  �  �  j rsr l ��t� ��t I  ����u���� 0 writelog writeLogu v��v b  ��wxw m  ��yy �zz  W o r k   P h o n e :  x o  ������ 0 userworkphone userWorkPhone��  ��  �   ��  s {|{ l ��}����} I  ����~���� 0 writelog writeLog~ �� b  ����� m  ���� ���  M o b i l e   P h o n e :  � o  ������ 0 
usermobile 
userMobile��  ��  ��  ��  | ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ��� 
 F A X :  � o  ������ 0 userfax userFax��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  T i t l e :  � o  ������ 0 	usertitle 	userTitle��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  S t r e e t :  � o  ������ 0 
userstreet 
userStreet��  ��  ��  ��  � ��� l �������� I  ��������� 0 writelog writeLog� ���� b  ����� m  ���� ���  C i t y :  � o  ������ 0 usercity userCity��  ��  ��  ��  � ��� l ������� I  �������� 0 writelog writeLog� ���� b  � ��� m  ���� ���  S t a t e :  � o  ������ 0 	userstate 	userState��  ��  ��  ��  � ��� l ������ I  ������� 0 writelog writeLog� ���� b  ��� m  	�� ���  P o s t a l   C o d e :  � o  	����  0 userpostalcode userPostalCode��  ��  ��  ��  � ��� l ������ I  ������� 0 writelog writeLog� ���� b  ��� m  �� ���  C o u n t r y :  � o  ���� 0 usercountry userCountry��  ��  ��  ��  � ��� l +������ I  +������� 0 writelog writeLog� ���� b   '��� m   #�� ���  W e b   P a g e :  � o  #&���� 0 userwebpage userWebPage��  ��  ��  ��  � ��� l ,2������ I  ,2������� 0 writelog writeLog� ���� o  -.��
�� 
ret ��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  � #  End logging user information   � ��� :   E n d   l o g g i n g   u s e r   i n f o r m a t i o n� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin account setup   � ��� (   B e g i n   a c c o u n t   s e t u p� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� l 3/������ O  3/��� k  9.�� ��� I 9>������
�� .miscactvnull��� ��� null��  ��  � ��� l ??��������  ��  ��  � � � r  ?F m  ?@��
�� boovtrue 1  @E��
�� 
wkOf   l GG��������  ��  ��    Q  G�	 k  Jh

  r  JU o  JO���� 0 unifiedinbox unifiedInbox 1  OT��
�� 
GrpF �� n Vh I  Wh������ 0 writelog writeLog �� b  Wd b  W` m  WZ � : S e t   G r o u p   S i m i l a r   F o l d e r s   t o   o  Z_���� 0 unifiedinbox unifiedInbox m  `c �  :   S u c c e s s f u l .��  ��    f  VW��   R      ������
�� .ascrerr ****      � ****��  ��  	 n p� I  q������� 0 writelog writeLog �� b  q~ !  b  qz"#" m  qt$$ �%% : S e t   G r o u p   S i m i l a r   F o l d e r s   t o  # o  ty���� 0 unifiedinbox unifiedInbox! m  z}&& �''  :   F a i l e d .��  ��    f  pq ()( l ����������  ��  ��  ) *+* Q  ��,-., k  ��// 010 r  ��232 o  ������ 20 hideonmycomputerfolders hideOnMyComputerFolders3 1  ����
�� 
hOMC1 4��4 n ��565 I  ����7���� 0 writelog writeLog7 8��8 b  ��9:9 b  ��;<; m  ��== �>> F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  < o  ������ 20 hideonmycomputerfolders hideOnMyComputerFolders: m  ��?? �@@  :   S u c c e s s f u l .��  ��  6  f  ����  - R      ������
�� .ascrerr ****      � ****��  ��  . n ��ABA I  ����C���� 0 writelog writeLogC D��D b  ��EFE b  ��GHG m  ��II �JJ F S e t   H i d e   O n   M y   C o m p u t e r   F o l d e r s   t o  H o  ������ 20 hideonmycomputerfolders hideOnMyComputerFoldersF m  ��KK �LL  :   F a i l e d .��  ��  B  f  ��+ MNM l ����������  ��  ��  N OPO Z  �QR���Q = ��STS o  ���~�~ (0 verifyemailaddress verifyEMailAddressT m  ���}
�} boovtrueR k  �UU VWV r  ��XYX I ���|Z[
�| .sysodlogaskr        TEXTZ m  ��\\ �]] X P l e a s e   v e r i f y   y o u r   e m a i l   a d d r e s s   i s   c o r r e c t .[ �{^_
�{ 
dtxt^ o  ���z�z 0 emailaddress emailAddress_ �y`a
�y 
disp` m  ���x�x a �wbc
�w 
apprb m  ��dd �ee , O u t l o o k   E x c h a n g e   S e t u pc �vfg
�v 
btnsf J  ��hh iji m  ��kk �ll  C a n c e lj m�um m  ��nn �oo  V e r i f y�u  g �tp�s
�t 
dfltp J  ��qq r�rr m  ��ss �tt  V e r i f y�r  �s  Y o      �q�q 0 verifyemail verifyEmailW uvu r  �wxw n  �yzy 1  ��p
�p 
ttxtz o  ���o�o 0 verifyemail verifyEmailx o      �n�n 0 emailaddress emailAddressv {�m{ n |}| I  �l~�k�l 0 writelog writeLog~ �j b  ��� b  ��� m  
�� ��� > U s e r   v e r i f i e d   e m a i l   a d d r e s s   a s  � o  
�i�i 0 emailaddress emailAddress� m  �� ���  .�j  �k  }  f  �m  ��  �  P ��� l �h�g�f�h  �g  �f  � ��� Z  |���e�d� = "��� o   �c�c *0 verifyserveraddress verifyServerAddress� m   !�b
�b boovtrue� k  %x�� ��� r  %W��� I %S�a��
�a .sysodlogaskr        TEXT� m  %(�� ��� f P l e a s e   v e r i f y   y o u r   E x c h a n g e   S e r v e r   n a m e   i s   c o r r e c t .� �`��
�` 
dtxt� o  +0�_�_  0 exchangeserver ExchangeServer� �^��
�^ 
disp� m  34�]�] � �\��
�\ 
appr� m  7:�� ��� , O u t l o o k   E x c h a n g e   S e t u p� �[��
�[ 
btns� J  =E�� ��� m  =@�� ���  C a n c e l� ��Z� m  @C�� ���  V e r i f y�Z  � �Y��X
�Y 
dflt� J  HM�� ��W� m  HK�� ���  V e r i f y�W  �X  � o      �V�V 0 verifyserver verifyServer� ��� r  Xe��� n  X_��� 1  [_�U
�U 
ttxt� o  X[�T�T 0 verifyserver verifyServer� o      �S�S  0 exchangeserver ExchangeServer� ��R� n fx��� I  gx�Q��P�Q 0 writelog writeLog� ��O� b  gt��� b  gp��� m  gj�� ��� @ U s e r   v e r i f i e d   s e r v e r   a d d r e s s   a s  � o  jo�N�N  0 exchangeserver ExchangeServer� m  ps�� ���  .�O  �P  �  f  fg�R  �e  �d  � ��� l }}�M�L�K�M  �L  �K  � ��� l }}�J���J  � "  create the Exchange account   � ��� 8   c r e a t e   t h e   E x c h a n g e   a c c o u n t� ��� l }}�I�H�G�I  �H  �G  � ��� Q  }^���� k  ��� ��� r  ���� I ��F�E�
�F .corecrel****      � null�E  � �D��
�D 
kocl� m  ���C
�C 
Eact� �B��A
�B 
prdt� l 	����@�?� K  ���� �>��
�> 
pnam� b  ����� m  ���� ���  M a i l b o x   -  � o  ���=�= 0 userfullname userFullName� �<��
�< 
unme� b  ����� o  ���;�; 0 domainprefix domainPrefix� o  ���:�: 0 usershortname userShortName� �9��
�9 
fnam� o  ���8�8 0 userfullname userFullName� �7��
�7 
emad� o  ���6�6 0 emailaddress emailAddress� �5��
�5 
host� o  ���4�4  0 exchangeserver ExchangeServer� �3��
�3 
usss� o  ���2�2 60 exchangeserverrequiresssl ExchangeServerRequiresSSL� �1��
�1 
port� o  ���0�0 .0 exchangeserversslport ExchangeServerSSLPort� �/��
�/ 
ExLS� o  ���.�. "0 directoryserver DirectoryServer� �-��
�- 
LDAu� o  ���,�, N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication� �+��
�+ 
LDSL� o  ���*�* 80 directoryserverrequiresssl DirectoryServerRequiresSSL� �)��
�) 
LDMX� o  ���(�( >0 directoryservermaximumresults DirectoryServerMaximumResults� �'��
�' 
LDSB� o  ���&�& 60 directoryserversearchbase DirectoryServerSearchBase� �%��
�% 
ExPm� o  ���$�$ *0 downloadheadersonly downloadHeadersOnly� �#��"
�# 
pBAD� o  ���!�! *0 disableautodiscover disableAutodiscover�"  �@  �?  �A  � o      � �  (0 newexchangeaccount newExchangeAccount� ��� n 	��� I  
� �� 0 writelog writeLog  � m  
 � H C r e a t e   E x c h a n g e   a c c o u n t :   S u c c e s s f u l .�  �  �  f  	
�  � R      ���
� .ascrerr ****      � ****�  �  � k  ^  l ����  �  �    l �	
�  	   something went wrong   
 � *   s o m e t h i n g   w e n t   w r o n g  l ����  �  �    n ! I  !��� 0 writelog writeLog � m   � @ C r e a t e   E x c h a n g e   a c c o u n t :   F a i l e d .�  �    f    l ""����  �  �    I "Q�
� .sysodlogaskr        TEXT b  "/ b  "+ b  ") !  o  "'�
�
 0 errormessage errorMessage! o  '(�	
�	 
ret  o  )*�
� 
ret  m  +."" �## D U n a b l e   t o   c r e a t e   E x c h a n g e   a c c o u n t . �$%
� 
disp$ m  25�
� stic    % �&'
� 
btns& J  8=(( )�) m  8;** �++  O K�  ' �,-
� 
dflt, J  @E.. /�/ m  @C00 �11  O K�  - �2� 
� 
appr2 m  HK33 �44 , O u t l o o k   E x c h a n g e   S e t u p�    565 R  R\����7
�� .ascrerr ****      � ****��  7 ��8��
�� 
errn8 m  VY��������  6 9��9 l ]]��������  ��  ��  ��  � :;: l __��������  ��  ��  ; <=< l __��>?��  > e _ The following lines enable Kerberos support if the userKerberos property above is set to true.   ? �@@ �   T h e   f o l l o w i n g   l i n e s   e n a b l e   K e r b e r o s   s u p p o r t   i f   t h e   u s e r K e r b e r o s   p r o p e r t y   a b o v e   i s   s e t   t o   t r u e .= ABA l __��������  ��  ��  B CDC Z  _�EF����E = _fGHG o  _d���� 0 usekerberos useKerberosH m  de��
�� boovtrueF Q  i�IJKI k  l�LL MNM r  lyOPO o  lq���� 0 usekerberos useKerberosP n      QRQ 1  tx��
�� 
KerbR o  qt���� (0 newexchangeaccount newExchangeAccountN STS r  z�UVU o  z}���� &0 userkerberosrealm userKerberosRealmV n      WXW 1  ����
�� 
ExGIX o  }����� (0 newexchangeaccount newExchangeAccountT Y��Y n ��Z[Z I  ����\���� 0 writelog writeLog\ ]��] m  ��^^ �__ P S e t   K e r b e r o s   a u t h e n t i c a t i o n :   S u c c e s s f u l .��  ��  [  f  ����  J R      ������
�� .ascrerr ****      � ****��  ��  K k  ��`` aba l ����������  ��  ��  b cdc l ����ef��  e   something went wrong   f �gg *   s o m e t h i n g   w e n t   w r o n gd hih l ����������  ��  ��  i jkj n ��lml I  ����n���� 0 writelog writeLogn o��o m  ��pp �qq H S e t   K e r b e r o s   a u t h e n t i c a t i o n :   F a i l e d .��  ��  m  f  ��k rsr l ����������  ��  ��  s tut I ����vw
�� .sysodlogaskr        TEXTv b  ��xyx b  ��z{z b  ��|}| o  ������ 0 errormessage errorMessage} o  ����
�� 
ret { o  ����
�� 
ret y m  ��~~ � ^ U n a b l e   t o   s e t   E x c h a n g e   a c c o u n t   t o   u s e   K e r b e r o s .w ����
�� 
disp� m  ����
�� stic    � ����
�� 
btns� J  ���� ���� m  ���� ���  O K��  � ����
�� 
dflt� J  ���� ���� m  ���� ���  O K��  � �����
�� 
appr� m  ���� ��� , O u t l o o k   E x c h a n g e   S e t u p��  u ��� R  �������
�� .ascrerr ****      � ****��  � �����
�� 
errn� m  ����������  � ���� l ����������  ��  ��  ��  ��  ��  D ��� l ����������  ��  ��  � ��� Q  ������ k  ���� ��� l ��������  � M G The Me Contact record is automatically created with the first account.   � ��� �   T h e   M e   C o n t a c t   r e c o r d   i s   a u t o m a t i c a l l y   c r e a t e d   w i t h   t h e   f i r s t   a c c o u n t .� ��� l ��������  � a [ Set the first name, last name, email address and other information using Active Directory.   � ��� �   S e t   t h e   f i r s t   n a m e ,   l a s t   n a m e ,   e m a i l   a d d r e s s   a n d   o t h e r   i n f o r m a t i o n   u s i n g   A c t i v e   D i r e c t o r y .� ��� l ����������  ��  ��  � ��� r  ����� o  ������ 0 userfirstname userFirstName� n      ��� 1  ����
�� 
pFrN� 1  ����
�� 
meCn� ��� r  ����� o  ������ 0 userlastname userLastName� n      ��� 1  ����
�� 
pLsN� 1  ����
�� 
meCn� ��� r  ���� K  ��� ����
�� 
radd� o  ���� 0 emailaddress emailAddress� �����
�� 
type� m  ��
�� EATyeWrk��  � n      ��� 1  ��
�� 
EmAd� 1  ��
�� 
meCn� ��� r  '��� o  ����  0 userdepartment userDepartment� n      ��� 1  "&��
�� 
Dptm� 1  "��
�� 
meCn� ��� r  (5��� o  (+���� 0 
useroffice 
userOffice� n      ��� 1  04��
�� 
Ofic� 1  +0��
�� 
meCn� ��� r  6C��� o  69���� 0 usercompany userCompany� n      ��� 1  >B��
�� 
Cmpy� 1  9>��
�� 
meCn� ��� r  DQ��� o  DG���� 0 userworkphone userWorkPhone� n      ��� 1  LP��
�� 
bsNm� 1  GL��
�� 
meCn� ��� r  R_��� o  RU���� 0 
usermobile 
userMobile� n      ��� 1  Z^��
�� 
mbNm� 1  UZ��
�� 
meCn� ��� r  `m��� o  `c���� 0 userfax userFax� n      ��� 1  hl��
�� 
bFax� 1  ch��
�� 
meCn� ��� r  n{��� o  nq���� 0 	usertitle 	userTitle� n      ��� 1  vz��
�� 
pTtl� 1  qv��
�� 
meCn� ��� r  |���� o  |���� 0 
userstreet 
userStreet� n      ��� 1  ����
�� 
bStA� 1  ���
�� 
meCn� ��� r  ����� o  ������ 0 usercity userCity� n      ��� 1  ����
�� 
bCty� 1  ����
�� 
meCn� ��� r  ����� o  ������ 0 	userstate 	userState� n      ��� 1  ����
�� 
bSta� 1  ����
�� 
meCn� ��� r  ����� o  ������  0 userpostalcode userPostalCode� n         1  ����
�� 
bZip 1  ����
�� 
meCn�  r  �� o  ������ 0 usercountry userCountry n       1  ����
�� 
bCou 1  ����
�� 
meCn 	 r  ��

 o  ������ 0 userwebpage userWebPage n       1  ����
�� 
bsWP 1  ����
�� 
meCn	 �� n �� I  ����~� 0 writelog writeLog �} m  �� � X P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   S u c c e s s f u l .�}  �~    f  ����  � R      �|�{�z
�| .ascrerr ****      � ****�{  �z  � n �� I  ���y�x�y 0 writelog writeLog �w m  �� � P P o p u l a t e   M e   C o n t a c t   i n f o r m a t i o n :   F a i l e d .�w  �x    f  ���  l ���v�u�t�v  �u  �t    l ���s �s   0 * Set Outlook to be the default application     �!! T   S e t   O u t l o o k   t o   b e   t h e   d e f a u l t   a p p l i c a t i o n "#" l ���r$%�r  $ ( " for mail, calendars and contacts.   % �&& D   f o r   m a i l ,   c a l e n d a r s   a n d   c o n t a c t s .# '(' l ���q�p�o�q  �p  �o  ( )*) Q  �+,-+ k  �.. /0/ r  ��121 m  ���n
�n boovtrue2 1  ���m
�m 
pMSD0 343 r  ��565 m  ���l
�l boovtrue6 1  ���k
�k 
pCSD4 787 r  �9:9 m  ���j
�j boovtrue: 1  ��i
�i 
pABD8 ;�h; n <=< I  �g>�f�g 0 writelog writeLog> ?�e? m  @@ �AA � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   S u c c e s s f u l .�e  �f  =  f  �h  , R      �d�c�b
�d .ascrerr ****      � ****�c  �b  - n BCB I  �aD�`�a 0 writelog writeLogD E�_E m  FF �GG � S e t   O u t l o o k   a s   d e f a u l t   m a i l ,   c a l e n d a r   a n d   c o n t a c t s   a p p l i c a t i o n :   F a i l e d .�_  �`  C  f  * HIH l �^�]�\�^  �]  �\  I JKJ I $�[L�Z
�[ .sysodelanull��� ��� nmbrL m   �Y�Y �Z  K MNM r  %,OPO m  %&�X
�X boovfalsP 1  &+�W
�W 
wkOfN QRQ l --�V�U�T�V  �U  �T  R STS l --�SUV�S  U   We're done.   V �WW    W e ' r e   d o n e .T X�RX l --�Q�P�O�Q  �P  �O  �R  � m  36YY�                                                                                  OPIM  alis    x  Macintosh HD               �\	'H+  Z�Microsoft Outlook.app                                          'п�,�0        ����  	                Applications    �\Ag      �,�p    Z�  0Macintosh HD:Applications: Microsoft Outlook.app  ,  M i c r o s o f t   O u t l o o k . a p p    M a c i n t o s h   H D  "Applications/Microsoft Outlook.app  / ��  ��  ��  � Z[Z l     �N�M�L�N  �M  �L  [ \]\ l     �K^_�K  ^ 0 *------------------------------------------   _ �`` T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -] aba l     �Jcd�J  c   End account setup   d �ee $   E n d   a c c o u n t   s e t u pb fgf l     �Ihi�I  h 0 *------------------------------------------   i �jj T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -g klk l     �H�G�F�H  �G  �F  l mnm l     �Eop�E  o 0 *------------------------------------------   p �qq T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -n rsr l     �Dtu�D  t   Begin script cleanup   u �vv *   B e g i n   s c r i p t   c l e a n u ps wxw l     �Cyz�C  y 0 *------------------------------------------   z �{{ T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -x |}| l     �B�A�@�B  �A  �@  } ~~ l     �?�>�=�?  �>  �=   ��� l 0S��<�;� Q  0S���� k  3C�� ��� I 3:�:��9
�: .sysoexecTEXT���     TEXT� m  36�� ��� � / b i n / r m   $ H O M E / L i b r a r y / L a u n c h A g e n t s / n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5 . p l i s t�9  � ��8� I  ;C�7��6�7 0 writelog writeLog� ��5� m  <?�� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   S u c c e s s f u l .�5  �6  �8  � R      �4�3�2
�4 .ascrerr ****      � ****�3  �2  � I  KS�1��0�1 0 writelog writeLog� ��/� m  LO�� ��� � D e l e t e   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   f i l e   f r o m   u s e r   L a u n c h A g e n t s   f o l d e r :   F a i l e d .�/  �0  �<  �;  � ��� l     �.�-�,�.  �-  �,  � ��� l Tw��+�*� Q  Tw���� k  Wg�� ��� I W^�)��(
�) .sysoexecTEXT���     TEXT� m  WZ�� ��� x / b i n / l a u n c h c t l   r e m o v e   n e t . t a l k i n g m o o s e . O u t l o o k E x c h a n g e S e t u p 5�(  � ��'� I  _g�&��%�& 0 writelog writeLog� ��$� m  `c�� ��� x U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   S u c c e s s f u l .�$  �%  �'  � R      �#�"�!
�# .ascrerr ****      � ****�"  �!  � I  ow� ���  0 writelog writeLog� ��� m  ps�� ��� p U n l o a d   O u t l o o k E x c h a n g e S e t u p 5 . p l i s t   l a u n c h   a g e n t :   F a i l e d .�  �  �+  �*  � ��� l     ����  �  �  � ��� l x~���� I  x~���� 0 writelog writeLog� ��� o  yz�
� 
ret �  �  �  �  � ��� l ����� I  ����� 0 writelog writeLog� ��� o  ���
� 
ret �  �  �  �  � ��� l ������ I  ������ 0 writelog writeLog� ��
� o  ���	
�	 
ret �
  �  �  �  � ��� l     ����  �  �  � ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ����  �   End script cleanup   � ��� &   E n d   s c r i p t   c l e a n u p� ��� l     ����  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��� �  �  �   � ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �   Begin script handlers   � ��� ,   B e g i n   s c r i p t   h a n d l e r s� ��� l     ������  � 0 *------------------------------------------   � ��� T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ��������  ��  ��  � ��� i   Y \��� I      ������� 0 writelog writeLog� ���� o      ���� 0 
logmessage 
logMessage��  ��  � k     Y�� ��� r     ��� b     	��� l    ������ I    ����
�� .earsffdralis        afdr� m     ��
�� afdrcusr� �����
�� 
rtyp� m    ��
�� 
TEXT��  ��  ��  � m    �� ��� L L i b r a r y : L o g s : O u t l o o k E x c h a n g e S e t u p 5 . l o g� o      ���� 0 logfile logFile� ��� r    !��� b    ��� b    ��� b    ��� n    ��� 1    ��
�� 
shdt� l    ����  I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � m     �   � n     1    ��
�� 
tstr l   ���� I   ������
�� .misccurdldt    ��� null��  ��  ��  ��  � 1    ��
�� 
tab � o      ���� 0 rightnow rightNow�  Z   " 5	��
 =  " % o   " #���� 0 
logmessage 
logMessage o   # $��
�� 
ret 	 r   ( + o   ( )��
�� 
ret  o      ���� 0 loginfo logInfo��  
 r   . 5 b   . 3 b   . 1 o   . /���� 0 rightnow rightNow o   / 0���� 0 
logmessage 
logMessage o   1 2��
�� 
ret  o      ���� 0 loginfo logInfo  r   6 B I  6 @��
�� .rdwropenshor       file 4   6 :��
�� 
file o   8 9���� 0 logfile logFile ����
�� 
perm m   ; <��
�� boovtrue��   o      ���� 0 openlogfile openLogFile  I  C P�� 
�� .rdwrwritnull���     **** o   C D���� 0 loginfo logInfo  ��!"
�� 
refn! o   E F���� 0 openlogfile openLogFile" ��#��
�� 
wrat# m   G J��
�� rdwreof ��   $��$ I  Q Y��%��
�� .rdwrclosnull���     ****% 4   Q U��&
�� 
file& o   S T���� 0 logfile logFile��  ��  � '(' l     ��������  ��  ��  ( )*) l     ��+,��  + 0 *------------------------------------------   , �-- T - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -* ./. l     ��01��  0   End script handlers   1 �22 (   E n d   s c r i p t   h a n d l e r s/ 3��3 l     ��45��  4 5 /------------------------------------------5.4.0   5 �66 ^ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 5 . 4 . 0��       ��7�� ?���� i�������� ��� �����K���������������89��  7 ���������������������������������������������������� 0 usekerberos useKerberos��  0 exchangeserver ExchangeServer�� 60 exchangeserverrequiresssl ExchangeServerRequiresSSL�� .0 exchangeserversslport ExchangeServerSSLPort�� "0 directoryserver DirectoryServer�� N0 %directoryserverrequiresauthentication %DirectoryServerRequiresAuthentication�� 80 directoryserverrequiresssl DirectoryServerRequiresSSL�� 00 directoryserversslport DirectoryServerSSLPort�� >0 directoryservermaximumresults DirectoryServerMaximumResults�� 60 directoryserversearchbase DirectoryServerSearchBase�� N0 %getuserinformationfromactivedirectory %getUserInformationFromActiveDirectory�� 0 
domainname 
domainName�� 0 emailformat emailFormat�� 0 displayname displayName�� 0 domainprefix domainPrefix�� (0 verifyemailaddress verifyEMailAddress�� *0 verifyserveraddress verifyServerAddress�� *0 displaydomainprefix displayDomainPrefix�� *0 downloadheadersonly downloadHeadersOnly�� 20 hideonmycomputerfolders hideOnMyComputerFolders�� 0 unifiedinbox unifiedInbox�� *0 disableautodiscover disableAutodiscover�� 0 errormessage errorMessage�� 0 writelog writeLog
�� .aevtoappnull  �   � ****
�� boovtrue
�� boovtrue���
�� boovtrue
�� boovtrue������
�� boovtrue�� �� 
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals
�� boovfals8 �������:;���� 0 writelog writeLog�� ��<�� <  ���� 0 
logmessage 
logMessage��  : ������������ 0 
logmessage 
logMessage�� 0 logfile logFile�� 0 rightnow rightNow�� 0 loginfo logInfo�� 0 openlogfile openLogFile; �����������������~�}�|�{�z�y�x�w�v�u
�� afdrcusr
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� .misccurdldt    ��� null
�� 
shdt
�� 
tstr
� 
tab 
�~ 
ret 
�} 
file
�| 
perm
�{ .rdwropenshor       file
�z 
refn
�y 
wrat
�x rdwreof �w 
�v .rdwrwritnull���     ****
�u .rdwrclosnull���     ****�� Z���l �%E�O*j �,�%*j �,%�%E�O��  �E�Y 	��%�%E�O*�/�el E�O���a a  O*�/j 9 �t=�s�r>?�q
�t .aevtoappnull  �   � ****= k    �@@ 
AA BB CC EDD LEE UFF ^GG gHH pII yJJ �KK �LL �MM �NN �OO �PP �QQ �RR �SS �TT �UU VV WW XX "YY +ZZ [[[ b\\ i]] p^^ w__ ~`` �aa �bb �cc �dd �ee �ff �gg �hh �ii �jj 5kk <ll Emm Nnn Woo `pp iqq rrr {ss �tt �uu �vv �ww �xx �yy �zz �{{ �|| �}} �~~ � ��� ��� ��p�p  �s  �r  > �o�o 0 i  ?:�n�m�lJS\enw������������� )`�kg�jn�iu�h|�g��f��e��d��c��b��a��`��_��^��]��\�[���Z�Y�X�W�V�U�T"�S�R�Q�P<�O�NHJ�M`hnq�L�K���J�I��H�G����:G[v�����F���*7Kfs�������';Vcw������
�E+FSg������D���			�C�B�A�@	E�?	^	n	p	�	�	�	�	�

$
V
o
{
�
�
�
#5�>g������
:CLU^gpy���������Y�=�<�;$&�:=?IK\�9dkns�8�7�6��������5���4�3�2��1�0�/�.�-�,�+�*�)�(�'�&�%�$�#�""*03�!� ^p~�������������������������
�	@F���������n 0 writelog writeLog
�m 
pnam
�l 
ret �k 0 userfirstname userFirstName�j 0 userlastname userLastName�i  0 userdepartment userDepartment�h 0 
useroffice 
userOffice�g 0 usercompany userCompany�f 0 userworkphone userWorkPhone�e 0 
usermobile 
userMobile�d 0 userfax userFax�c 0 	usertitle 	userTitle�b 0 
userstreet 
userStreet�a 0 usercity userCity�` 0 	userstate 	userState�_  0 userpostalcode userPostalCode�^ 0 usercountry userCountry�] 0 userwebpage userWebPage
�\ .sysoexecTEXT���     TEXT�[ 0 netbiosdomain netbiosDomain�Z  �Y  
�X 
disp
�W stic    
�V 
btns
�U 
dflt
�T 
appr�S 
�R .sysodlogaskr        TEXT
�Q 
errn�P��
�O 
ascr
�N 
txdl�M "0 userinformation userInformation
�L 
cpar
�K .corecnte****       ****
�J 
citm�I 0 emailaddress emailAddress
�H 
cha 
�G 
TEXT�F 0 usershortname userShortName�E 0 userfullname userFullName�D &0 userkerberosrealm userKerberosRealm
�C 
bool
�B .sysosigtsirr   ��� null
�A 
sisn
�@ 
siln
�? 
cwor�> 
�= .miscactvnull��� ��� null
�< 
wkOf
�; 
GrpF
�: 
hOMC
�9 
dtxt�8 
�7 0 verifyemail verifyEmail
�6 
ttxt�5 0 verifyserver verifyServer
�4 
kocl
�3 
Eact
�2 
prdt
�1 
unme
�0 
fnam
�/ 
emad
�. 
host
�- 
usss
�, 
port
�+ 
ExLS
�* 
LDAu
�) 
LDSL
�( 
LDMX
�' 
LDSB
�& 
ExPm
�% 
pBAD�$ 
�# .corecrel****      � null�" (0 newexchangeaccount newExchangeAccount
�! 
Kerb
�  
ExGI
� 
meCn
� 
pFrN
� 
pLsN
� 
radd
� 
type
� EATyeWrk
� 
EmAd
� 
Dptm
� 
Ofic
� 
Cmpy
� 
bsNm
� 
mbNm
� 
bFax
� 
pTtl
� 
bStA
� 
bCty
� 
bSta
� 
bZip
� 
bCou
� 
bsWP
� 
pMSD
�
 
pCSD
�	 
pABD� 
� .sysodelanull��� ��� nmbr�q�*�k+ O*�)�,%k+ O*�k+ O*�k+ O*�b   %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  %k+ O*�b  	%k+ O*a b  
%k+ O*�k+ Ob  
f  G*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*�k+ Y hO*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*a b  %k+ O*�k+ Oa E` Oa E`  Oa !E` "Oa #E` $Oa %E` &Oa 'E` (Oa )E` *Oa +E` ,Oa -E` .Oa /E` 0Oa 1E` 2Oa 3E` 4Oa 5E` 6Oa 7E` 8Oa 9E` :Ob  
e � 4a ;j <E` =Ob  e  _ =a >%Ec  Y a ?Ec  W AX @ Ab  �%�%a B%a Ca Da Ea Fkva Ga Hkva Ia Ja K LO)a Ma NlhO &a Okv_ Pa Q,FOa R_ =%a S%j <E` TW AX @ Ab  �%�%a U%a Ca Da Ea Vkva Ga Wkva Ia Xa K LO)a Ma NlhO{k_ Ta Y-j Zkh  a [kv_ Pa Q,FO_ Ta Y�/a \ L _ Ta Y�/a ]l/E` ^W 2X @ Aa _kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` ^Y hOa bkv_ Pa Q,FO_ Ta Y�/a c L _ Ta Y�/a ]l/E` 8W 2X @ Aa dkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` 8Y hOa ekv_ Pa Q,FO_ Ta Y�/a f L _ Ta Y�/a ]l/E` &W 2X @ Aa gkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` &Y hOa hkv_ Pa Q,FO_ Ta Y�/a i L _ Ta Y�/a ]l/E` "W 2X @ Aa jkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` "Y hOa kkv_ Pa Q,FO_ Ta Y�/a l L _ Ta Y�/a ]l/E` $W 2X @ Aa mkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` $Y hOa nkv_ Pa Q,FO_ Ta Y�/a o L _ Ta Y�/a ]l/E` pW 2X @ Aa qkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` pY hOa rkv_ Pa Q,FO_ Ta Y�/a s L _ Ta Y�/a ]l/E` :W 2X @ Aa tkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` :Y hOa ukv_ Pa Q,FO_ Ta Y�/a v L _ Ta Y�/a ]l/E` 2W 2X @ Aa wkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` 2Y hOa xkv_ Pa Q,FO_ Ta Y�/a y L _ Ta Y�/a ]l/E` ,W 2X @ Aa zkv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` ,Y hOa {kv_ Pa Q,FO_ Ta Y�/a | L _ Ta Y�/a ]l/E` W 2X @ Aa }kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` Y hOa ~kv_ Pa Q,FO_ Ta Y�/a  L _ Ta Y�/a ]l/E` .W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` .Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E`  W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E`  Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` *W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` *Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` (W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` (Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` 6W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` 6Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` �W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` �Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` 4W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` 4Y hOa �kv_ Pa Q,FO_ Ta Y�/a � L _ Ta Y�/a ]l/E` 0W 2X @ Aa �kv_ Pa Q,FO_ Ta Y�k/[a `\[Zl\62a a&E` 0Y hOP[OY��Oa �a �lv_ Pa Q,FO _ Ta ]l/E` �W X @ AhOa �kv_ Pa Q,FO_ ^a �  ?b  �%�%a �%a Ca Da Ea �kva Ga �kva Ia �a K LO)a Ma NlhY hOPYlb  k 	 b  k a �& s*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]i/E` O_ �a ]k/a �k/E`  Oa �_ Pa Q,FO_ a �%_  %a �%b  %E` ^OPY�b  k 	 b  l a �& s*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]k/a �k/E` O_ �a ]i/E`  Oa �_ Pa Q,FO_ a �%_  %a �%b  %E` ^OPYZb  l 	 b  k a �& k*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]i/E` O_ �a ]k/a �k/E`  Oa �_ Pa Q,FO_ a �%b  %E` ^OPY�b  l 	 b  l a �& k*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]k/a �k/E` O_ �a ]i/E`  Oa �_ Pa Q,FO_ a �%b  %E` ^OPYXb  m 	 b  k a �& t*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]i/E` O_ �a ]k/a �k/E`  Oa �_ Pa Q,FO_ a `k/_  %a �%b  %E` ^OPY�b  m 	 b  l a �& t*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]k/a �k/E` O_ �a ]i/E`  Oa �_ Pa Q,FO_ a `k/_  %a �%b  %E` ^OPYDb  a � 	 b  k a �& k*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]i/E` O_ �a ]k/a �k/E`  Oa �_ Pa Q,FO_ pa �%b  %E` ^OPY �b  a � 	 b  l a �& k*j �a �,E` pO*j �a �,E` �Oa �_ Pa Q,FO_ �a ]k/a �k/E` O_ �a ]i/E`  Oa �_ Pa Q,FO_ pa �%b  %E` ^OPY >b  �%�%a �%a Ca Da Ea �kva Ga �kva Ia �a K LO)a Ma NlhOPO*a �k+ O*a �_ %k+ O*a �_  %k+ O*a �_ ^%k+ O*a �_ "%k+ O*a �_ $%k+ O*a �_ &%k+ O*a �_ (%k+ O*a �_ *%k+ O*a �_ ,%k+ O*a �_ .%k+ O*a �_ 0%k+ O*a �_ 2%k+ O*a �_ 4%k+ O*a �_ 6%k+ O*a �_ 8%k+ O*a �_ :%k+ O*�k+ Oa ��*j �Oe*a �,FO #b  *a �,FO)a �b  %a �%k+ W X @ A)a �b  %a �%k+ O #b  *a �,FO)a �b  %a �%k+ W X @ A)a �b  %a �%k+ Ob  e  Ra �a �_ ^a Cka Ia �a Ea �a �lva Ga �kva � LE` �O_ �a �,E` ^O)a �_ ^%a �%k+ Y hOb  e  Xa �a �b  a Cka Ia �a Ea �a �lva Ga �kva � LE` �O_ �a �,Ec  O)a �b  %a �%k+ Y hO �*a �a �a ��a �_ �%a �b  _ p%a �_ �a �_ ^a �b  a �b  a �b  a �b  a b  ab  ab  ab  	ab  ab  aa �E`O)a	k+ W LX @ A)a
k+ Ob  �%�%a%a Ca Da Eakva Gakva Iaa K LO)a Ma NlhOPOb   e  w 'b   _a,FO_ �_a,FO)ak+ W LX @ A)ak+ Ob  �%�%a%a Ca Da Eakva Gakva Iaa K LO)a Ma NlhOPY hO �_ *a,a,FO_  *a,a,FOa_ ^aaa �*a,a,FO_ "*a,a,FO_ $*a,a,FO_ &*a,a ,FO_ (*a,a!,FO_ **a,a",FO_ ,*a,a#,FO_ .*a,a$,FO_ 0*a,a%,FO_ 2*a,a&,FO_ 4*a,a',FO_ 6*a,a(,FO_ 8*a,a),FO_ :*a,a*,FO)a+k+ W X @ A)a,k+ O %e*a-,FOe*a.,FOe*a/,FO)a0k+ W X @ A)a1k+ Oa2j3Of*a �,FOPUO a4j <O*a5k+ W X @ A*a6k+ O a7j <O*a8k+ W X @ A*a9k+ O*�k+ O*�k+ O*�k+ ascr  ��ޭ