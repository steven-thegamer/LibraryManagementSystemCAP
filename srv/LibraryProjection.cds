// This file defines a projection for the library system, which includes all books and registered users.
// This is only to be accessible for administrators.
using { my.library.Books, my.library.Users } from '../db/index.cds';

service LibraryProjection
{
  entity AllBooks as projection on Books;
  entity RegisteredUsers as projection on Users; 
}

annotate LibraryProjection @(requires: 'Administrators');