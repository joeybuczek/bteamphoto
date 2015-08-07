## User stories to help develop the site.

**1: As the admin user, I'd like to create, delete, and manage user accounts (wedding photography clients).**

 - I should be able to edit their contact information, add a wedding photography event, and edit the details of that event. All users should be listed in a Client Index view (which serves as the admin dashboard).

**2: As a user, I'd like to receive an invitation to use the site to manage my wedding photography event details.**

 - As a user I should receive an email with login information, including an initial, temporary password that I can change after I log in. When I log into the site, I should be directed to a "My Details" page that contains all my contact and wedding photography event details, along with the option to edit those details.
 
 - As the admin, I should be able to send an invitation from my Client Index dashboard page. I should also be able to see the status of the invitation (pending until client logs in for the first time).

**3: As the admin user, I'd like to create an invoice for a wedding photography event.**

 - I should be able to attach an invoice to a wedding instance that includes a description, balance, and tax rate. Also, each invoice should have the option of an itemized breakdown.
 
**4: As a user, I'd like to view the invoice for my wedding photography event.**

 - I should be able to view the invoice balance due along with any itemized listing on the invoice. I should have access to this through my wedding details page.

**5: As a user, I'd like to make a secure credit card payment to pay off my invoice balance (via Stripe).**

 - I should be able to access this feature on the invoice page. Once I pay the balance, the invoice should reflect as paid.

**6: As the admin, I'd like to add/remove images and collections of images.**

 - I should be able to add/remove both collections and individual images from those collections through a "Manage Images" page.

**7. As a site visitor, I'd like to view the various photo collections on the site, read about the photographers, and contact them directly.

 - I should be able to visit the main welcome page of the site and view images, content, and contact information. When using my mobile device I should be able to initiate a phone call to the photographer by touching the phone number on the main welcome page (same for email/email address).

 - The main welcome page of the site should utilize AngularJS for content delivery/view-switching.

 - The different views (wedding/portraits/etc) should be controlled via select box in the contact bar area, and all other relevant content on the page should change with it.

 **8. As a visitor of the site, I should be able to read reviews from past clients.

 - I should be able to see two randomly selected reviews based on the current genre selected.

 **9. As a client, I should be able to see links to any web galleries created by the business.

 - I should be able to see a list of any web gallery links on my client landing page.

 **10. As a site developer, I should be able to reset my database by seeding it with proper admin user/rights.

 - I should be able to run rake db:reset and have the default admin account set up with initial password, along with 'demo' user/data.

 
