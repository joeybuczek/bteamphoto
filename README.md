## B-Team Photography Website Template
by Joey Buczek: Owner, Photographer

Built with Ruby 2.1.2, Rails 4.1.9, Foundation 4.5.4

**Site Name & Slogans**

Please be sure to properly update the application helper.rb file, as it contains all the helper methods that display the company name and slogans across the site. The methods are listed below:

 - `helper_my_business_name` : The the menu bar at the top of the site's page uses this, and anywhere else you designate the name of your business to show up in your views.
 
 - `helper_title_slogan` : Name/Slogan displayed in the web browser's tab.

**Users/Clients**

There are currently two user roles: admin & client. 

**admin**

 - The admin user must be created on the backend through the console. There is only one admin user, which is able to create, edit, and delete clients through the site's interface. Additionally, all new 'events' to be photographed for the clients will be added by the admin user through the site as well.

**client**

 - In order for a user to become a client, they must currently be an actual client of the business. The user's account is initiated by the admin, and the login information is emailed to them. There is a temporary password provided for the user's first time logging in, upon which they are alerted to change it (unless they elect to keep it). 

 - Client users are able to see and edit both personal and event photography information, along with having access to any web gallery links hosted by the site. They are also able to see and pay down their remaining balance for the photography services through the site.



