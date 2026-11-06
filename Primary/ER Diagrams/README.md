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

Publisher->Book (1:M),
Member->Loan (1:M),
Member->Reservation (1:M),
Book->Reservation (1:M),
Book<->Author (M:N)
