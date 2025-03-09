# second_chair

A new Flutter project.

Second Chair is a database. The database will be used by attorneys to enter and keep track of their clients, the documents related to those clients, the attorney’s calendar, and it will assist in helping the attorney handle billing for their clients. The app must be available on android phones and tablets, iOS phones and tablets, and the web, and the same functionality should exist on each.

The app should accomplish this through a number of different screens. The first screen should be the home screen. It should include buttons that take the user to different screens. The buttons will be add client, view clients, and calendar. We will go through each button below.

Add client. Once the add client button is pushed, it should take the user to a new screen that allows the user to add client information. That client information should include Name, Date of Birth, Phone Number, and Address. Name should be the only field that needs to be filled out. That screen should also include another Add Client button. Once that button is pressed, it should commit the client information to memory, and add that client to a database. We will need to use the database_helper file to help store that information and to allow the functionality that should come when we move onto the next button. Once added clients should be immediately viewable on the view clients screen.

View Clients. This is the second button on the home screen. Once pressed the button should take the user to a separate screen that shows the current clients. Those clients would be an accumulation of the individuals added through the Add Client button. The user should not only be able to see the clients on this screen, but also edit the client’s information. There should also be a new button that says Add Case. That button should take the user to a separate screen that allows the user to add a case to each client. Once a case is added, that case should attach to the client and the case should be viewable under the client screen. Users should be able to click on those cases and edit that case information. Once added cases should be immediately viewable on the client screen.

That add case button should contain the following fields: Jurisdiction, Case Number, Charge, Next Hearing Type, Next Hearing Date, and Next Hearing Time. These buttons should have the following functions. Jurisdiction: Jurisdiction should have numerous levels. The first will ask the user to select either Federal, State, or Municipal. If the user selects federal, there should be no other options, and that should complete the field. If the user selects state, it should then allow the user to choose from one of the 50 states. Once the state is selected, it should then allow the user to select the county. In these fields, the program should auto-populate all available sites and counties and should add any necessary dependencies to make this happen. If the user selects municipal, that should complete the field. The case number button should allow the user to enter text to complete. The charge field should also allow the user to enter text to complete. Next hearing date and next hearing time should allow the user to add a date and time from a calendar and time interface. The next hearing screen should contain a list of options. Those options should include the following:

Initial Appearance
Status Conference / Pretrial Conference
Hearing
Final Pretrial
Court Trial
Jury Trial
Other
Custom
Add

If the user selects "Custom" they should be taken to the keyboard to enter whatever type of case they would like.

If the user selects "Add" they should be able to add an option. Once that option is added, the user should have the option to remove that added line.

The user should be able to delete both clients and cases, but there should be a warning informing the user they are about to delete a client or a case, and that the choice is permanent. Once approved, the delete should remove the client or the case.

The final button on the Home Screen is the Calendar button. That button should take the user to a separate screen that shows a calendar. That calendar should pull information from the previous information provided. Specifically, it should connect to the next hearing date and next hearing time and allow the user to see what is scheduled and when. It should also show the client name, the charge, and the jurisdiction. The user should be able to click on the information shown in the calendar screen and it should take them to the case in the charge screen.

I would like to simplify this app. With the following code, I would like to remove any functionality related to importing PDFs, or adding a client through importing outside documents.

I would like to focus on adding clients through the manual "add client button".

I would like that button to populate a database with client information, and create a second screen that would allow me to add cases to each client. That functionality should allow me to add the following fields in what should be called the case detail screen: "Case Number", "Charges", "Assigned Prosecutor". There should also be another section of that charge screen that allows for entry of the "Next Hearing" and the "Hearing Type".

Let's also create a button to delete a case. This button should remove a case from the client detail screen. If this button is pressed, there should be a warning letting the client know they are about to delete the case. Once the case is deleted, the case information, as well as the accompanying information on the calendar, should be removed.

Once any information is added, it should immediately change the information that is visible on the screen. The user should not have to exit the screen and come back in to see the changes. For example, when a case is added, it should show up on the client screen under cases immediately, and not require the user to exit the client screen and come back in.