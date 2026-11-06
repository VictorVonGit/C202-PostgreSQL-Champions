This is our Er Diagrams and Schemas. Here is the Relationships and Entities.

ENTITIES:

LibraryUser,
Member
Publisher,
Author,
Book,
Loan,
Reservation

RELATIONSHIPS:

Publisher->Book,
Member->Loan,
Member->Reservation,
Book->Reservation,
Book<->Author
