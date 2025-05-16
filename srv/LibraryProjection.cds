using my.library.AvailableBooks from '../db/library';
using my.library.Users from '../db/users';
using my.library.Books from '../db/books';

service LibraryProjection
{
  entity AllBooks as projection on Books;
  entity RegisteredUsers as projection on Users; 
}

annotate LibraryProjection @(requires: 'Administrators');